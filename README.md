<div align="center">

<img src="https://umsousercontent.com/lib_lnlnuhLgkYnZdkSC/hj0vk05j0kemus1i.png" alt="ChipFoundry Logo" height="140" />

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![ChipFoundry Marketplace](https://img.shields.io/badge/ChipFoundry-Marketplace-6E40C9.svg)](https://platform.chipfoundry.io/marketplace)

</div>

# cf-sensor-soc

ChipFoundry **sensor SoC** reference application on Caravel: the
`cf-sensor-afe` analog island plus a digital ring (UART, SPI, I2C,
three 32-bit timers, and 4 KB SRAM for ADC capture).

This is a **new project**. It does not replace `cf-sensor-afe`. Analog
macro placement, wrap GDS, and tapeout views stay on that repo.

## What it adds

Firmware on the management RISC-V still owns the AFE through the same
`afe_wb` CSR at `0x30000000`. `soc_sys` decodes the rest of the user
Wishbone map onto catalog digital IP. GPIO 16–26, 30, and 35–37 are
user digital; HIZ bias/DFT pads that used those GPIOs on the AFE are
left unconnected.

| Block | Address | Role |
| --- | --- | --- |
| `afe_wb` | `0x30000000` | Analog power-down, trim, `sof` / STATUS |
| `CF_UART` | `0x30001000` | User UART (GPIO 22 TX / 23 RX) |
| `CF_SPI` | `0x30002000` | SPI master (GPIO 16–19) |
| `CF_I2C` | `0x30003000` | I2C master (GPIO 20–21) |
| `CF_TMR32` ×3 | `0x30004000` / `5000` / `6000` | Sample period + PWM on GPIO 24–26 |
| CAP / GPIO | `0x30007000` | ADC→SRAM burst + GPIO 35–37 |
| `CF_SRAM_1024x32` | `0x30010000` | 1024 × 32-bit capture buffer |

Write `1` to CAP_CTRL and `N` to CAP_COUNT. Each rising SAR `eof` stores
`{20'b0, data_out[11:0]}` at the next SRAM word until `N` samples.
Caravel mgmt UART on GPIO 6 still prints codes. Enable each CF_* `GCLK`
register (`+0xFF10`) before using that peripheral.

## Catalog IPs

| IP | Version | Role |
| --- | --- | --- |
| [CF_BUF_HIZ](https://github.com/chipfoundry/CF_BUF_HIZ) | 0.2.6 | Sensor input buffer |
| [CF_ADC_SAR12](https://github.com/chipfoundry/CF_ADC_SAR12) | 0.2.8 | 12-bit SAR + wrapped `sar_refs` |
| [CF_BGR](https://github.com/chipfoundry/CF_BGR) | 0.2.9 | Bandgap bias / 1.2 V reference |
| [CF_REFBUF](https://github.com/chipfoundry/CF_REFBUF) | 0.2.8 | Buffered `Vout` monitor |
| [CF_UART](https://github.com/chipfoundry/CF_UART) | v2.0.2 | User UART |
| [CF_SPI](https://github.com/chipfoundry/CF_SPI) | v2.0.1 | SPI master |
| [CF_I2C](https://github.com/chipfoundry/CF_I2C) | v2.0.0 | I2C master |
| [CF_TMR32](https://github.com/chipfoundry/CF_TMR32) | v2.1.0 | 32-bit timer / PWM (×3) |
| [CF_SRAM_1024x32](https://github.com/chipfoundry/CF_SRAM_1024x32) | v1.2.3 | 4 KB data SRAM |

Analog packages install from `ip/catalog.json`. Digital IP is public
marketplace (UART v2.0.1 has a stale marketplace sha256; this tree uses
the `CF_UART-v2.0.2` GitHub tag). `CF_IP_UTIL` is the clock-gate helper
the WB wrappers instantiate.

```bash
python3 .github/scripts/install_ips.py
```

That clones the tags in `ip/dependencies.json` (analog `CF_<IP>-<ver>`,
digital `CF_<IP>-v…`). Analog repos are private; export a GitHub token
that can read them:

```bash
export GH_TOKEN="$(env -u GITHUB_TOKEN gh auth token)"
python3 .github/scripts/install_ips.py
```

`ip/` is gitignored except `catalog.json` / `dependencies.json`. A local
`ipm install-dep --include-drafts --local-file ip/catalog.json` also
works for analog, but nests files at `ip/<IP>/<IP>/`; the installer
symlinks `layout` / `hdl` / `verify` up one level so OpenLane paths
resolve. CI runs the same script before harden and RTL verify. Set repo
secret `GH_TOKEN` (the default Actions token cannot clone other private
repos).

## GPIO

`analog_io[N]` is Caravel GPIO N+7. GPIO 5–6 stay management UART.

| GPIO | Mode | Use |
| --- | --- | --- |
| 7 | analog | BGR `vb2_fast` |
| 8–13 | analog | HIZ sensor `vinp_p` … `vinn_na` |
| 14 | analog | REFBUF monitor |
| 15 | analog | REFBUF `ng` / `vpwre` |
| 16 | out | SPI SCLK |
| 17 | out | SPI MOSI |
| 18 | in | SPI MISO |
| 19 | out | SPI CSB |
| 20–21 | bidir | I2C SCL / SDA |
| 22 | out | User UART TX |
| 23 | in | User UART RX |
| 24–26 | out | TMR0 / TMR1 / TMR2 PWM0 |
| 27 | analog | SAR `vinm` |
| 28 | analog | `sar_refs.refout` |
| 29 | analog | SAR `vreflo` |
| 30 | out | Combined IRQ / capture-done |
| 31 | analog | BGR `dft_curr_in` |
| 32–34 | analog | `vdda` / `vssa` / `VPUMP` |
| 35–37 | bidir | Spare GPIO (`CAP` word 4) |

## Harden

`user_project_wrapper` is **elaborated**. Harden digital macros first:

```bash
cf harden soc_sys
cf harden CF_SRAM_1024x32_wb_wrapper
# copy views into gds/ lef/ verilog/gl/ spef/ lib/
cf harden user_project_wrapper
```

Analog macros stay at the AFE locations (density keepout). `soc_sys` is
1200 × 500 µm at (15.06, 115). SRAM is 380 × 435 µm at (1300, 115),
south of the analog row.

Do not synthesize on top of analog. Do not move analog macros to make
room. Do not `cf init` this tree onto the AFE shuttle project.

## Analog

Same on-chip nets as `cf-sensor-afe` (`afe_vout`, `afe_ibias`, `afe_vref`,
`afe_nbias`, `afe_refhi`, `afe_refby2`). HIZ bias analog pins are not
bonded. Chip PDN is `vccd1`/`vssd1` → wrap `vpwr`/`vgnd`.
