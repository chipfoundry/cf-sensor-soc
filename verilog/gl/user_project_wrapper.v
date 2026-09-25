module user_project_wrapper (user_clock2,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    vssa2,
    vdda2,
    vssa1,
    vdda1,
    vssd2,
    vccd2,
    vssd1,
    vccd1,
    analog_io,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 inout vssa2;
 inout vdda2;
 inout vssa1;
 inout vdda1;
 inout vssd2;
 inout vccd2;
 inout vssd1;
 inout vccd1;
 inout [28:0] analog_io;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [127:0] la_data_in;
 output [127:0] la_data_out;
 input [127:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;

 wire \afe_data[0] ;
 wire \afe_data[10] ;
 wire \afe_data[11] ;
 wire \afe_data[1] ;
 wire \afe_data[2] ;
 wire \afe_data[3] ;
 wire \afe_data[4] ;
 wire \afe_data[5] ;
 wire \afe_data[6] ;
 wire \afe_data[7] ;
 wire \afe_data[8] ;
 wire \afe_data[9] ;
 wire afe_eof;
 wire afe_ibias;
 wire afe_nbias;
 wire afe_refby2;
 wire afe_refhi;
 wire afe_vout;
 wire afe_vref;
 wire \analog_ctrl[0] ;
 wire \analog_ctrl[100] ;
 wire \analog_ctrl[101] ;
 wire \analog_ctrl[102] ;
 wire \analog_ctrl[103] ;
 wire \analog_ctrl[104] ;
 wire \analog_ctrl[105] ;
 wire \analog_ctrl[106] ;
 wire \analog_ctrl[107] ;
 wire \analog_ctrl[108] ;
 wire \analog_ctrl[109] ;
 wire \analog_ctrl[10] ;
 wire \analog_ctrl[110] ;
 wire \analog_ctrl[111] ;
 wire \analog_ctrl[112] ;
 wire \analog_ctrl[113] ;
 wire \analog_ctrl[114] ;
 wire \analog_ctrl[115] ;
 wire \analog_ctrl[116] ;
 wire \analog_ctrl[117] ;
 wire \analog_ctrl[118] ;
 wire \analog_ctrl[119] ;
 wire \analog_ctrl[11] ;
 wire \analog_ctrl[120] ;
 wire \analog_ctrl[121] ;
 wire \analog_ctrl[122] ;
 wire \analog_ctrl[12] ;
 wire \analog_ctrl[13] ;
 wire \analog_ctrl[14] ;
 wire \analog_ctrl[15] ;
 wire \analog_ctrl[16] ;
 wire \analog_ctrl[17] ;
 wire \analog_ctrl[18] ;
 wire \analog_ctrl[19] ;
 wire \analog_ctrl[1] ;
 wire \analog_ctrl[20] ;
 wire \analog_ctrl[21] ;
 wire \analog_ctrl[22] ;
 wire \analog_ctrl[23] ;
 wire \analog_ctrl[24] ;
 wire \analog_ctrl[25] ;
 wire \analog_ctrl[26] ;
 wire \analog_ctrl[27] ;
 wire \analog_ctrl[28] ;
 wire \analog_ctrl[29] ;
 wire \analog_ctrl[2] ;
 wire \analog_ctrl[30] ;
 wire \analog_ctrl[31] ;
 wire \analog_ctrl[32] ;
 wire \analog_ctrl[33] ;
 wire \analog_ctrl[34] ;
 wire \analog_ctrl[35] ;
 wire \analog_ctrl[36] ;
 wire \analog_ctrl[37] ;
 wire \analog_ctrl[38] ;
 wire \analog_ctrl[39] ;
 wire \analog_ctrl[3] ;
 wire \analog_ctrl[40] ;
 wire \analog_ctrl[41] ;
 wire \analog_ctrl[42] ;
 wire \analog_ctrl[43] ;
 wire \analog_ctrl[44] ;
 wire \analog_ctrl[45] ;
 wire \analog_ctrl[46] ;
 wire \analog_ctrl[47] ;
 wire \analog_ctrl[48] ;
 wire \analog_ctrl[49] ;
 wire \analog_ctrl[4] ;
 wire \analog_ctrl[50] ;
 wire \analog_ctrl[51] ;
 wire \analog_ctrl[52] ;
 wire \analog_ctrl[53] ;
 wire \analog_ctrl[54] ;
 wire \analog_ctrl[55] ;
 wire \analog_ctrl[56] ;
 wire \analog_ctrl[57] ;
 wire \analog_ctrl[58] ;
 wire \analog_ctrl[59] ;
 wire \analog_ctrl[5] ;
 wire \analog_ctrl[60] ;
 wire \analog_ctrl[61] ;
 wire \analog_ctrl[62] ;
 wire \analog_ctrl[63] ;
 wire \analog_ctrl[64] ;
 wire \analog_ctrl[65] ;
 wire \analog_ctrl[66] ;
 wire \analog_ctrl[67] ;
 wire \analog_ctrl[68] ;
 wire \analog_ctrl[69] ;
 wire \analog_ctrl[6] ;
 wire \analog_ctrl[70] ;
 wire \analog_ctrl[71] ;
 wire \analog_ctrl[72] ;
 wire \analog_ctrl[73] ;
 wire \analog_ctrl[74] ;
 wire \analog_ctrl[75] ;
 wire \analog_ctrl[76] ;
 wire \analog_ctrl[77] ;
 wire \analog_ctrl[78] ;
 wire \analog_ctrl[79] ;
 wire \analog_ctrl[7] ;
 wire \analog_ctrl[80] ;
 wire \analog_ctrl[81] ;
 wire \analog_ctrl[82] ;
 wire \analog_ctrl[83] ;
 wire \analog_ctrl[84] ;
 wire \analog_ctrl[85] ;
 wire \analog_ctrl[86] ;
 wire \analog_ctrl[87] ;
 wire \analog_ctrl[88] ;
 wire \analog_ctrl[89] ;
 wire \analog_ctrl[8] ;
 wire \analog_ctrl[90] ;
 wire \analog_ctrl[91] ;
 wire \analog_ctrl[92] ;
 wire \analog_ctrl[93] ;
 wire \analog_ctrl[94] ;
 wire \analog_ctrl[95] ;
 wire \analog_ctrl[96] ;
 wire \analog_ctrl[97] ;
 wire \analog_ctrl[98] ;
 wire \analog_ctrl[99] ;
 wire \analog_ctrl[9] ;
 wire sram_ack;
 wire \sram_adr[0] ;
 wire \sram_adr[10] ;
 wire \sram_adr[11] ;
 wire \sram_adr[12] ;
 wire \sram_adr[13] ;
 wire \sram_adr[14] ;
 wire \sram_adr[15] ;
 wire \sram_adr[16] ;
 wire \sram_adr[17] ;
 wire \sram_adr[18] ;
 wire \sram_adr[19] ;
 wire \sram_adr[1] ;
 wire \sram_adr[20] ;
 wire \sram_adr[21] ;
 wire \sram_adr[22] ;
 wire \sram_adr[23] ;
 wire \sram_adr[24] ;
 wire \sram_adr[25] ;
 wire \sram_adr[26] ;
 wire \sram_adr[27] ;
 wire \sram_adr[28] ;
 wire \sram_adr[29] ;
 wire \sram_adr[2] ;
 wire \sram_adr[30] ;
 wire \sram_adr[31] ;
 wire \sram_adr[3] ;
 wire \sram_adr[4] ;
 wire \sram_adr[5] ;
 wire \sram_adr[6] ;
 wire \sram_adr[7] ;
 wire \sram_adr[8] ;
 wire \sram_adr[9] ;
 wire sram_cyc;
 wire \sram_rdat[0] ;
 wire \sram_rdat[10] ;
 wire \sram_rdat[11] ;
 wire \sram_rdat[12] ;
 wire \sram_rdat[13] ;
 wire \sram_rdat[14] ;
 wire \sram_rdat[15] ;
 wire \sram_rdat[16] ;
 wire \sram_rdat[17] ;
 wire \sram_rdat[18] ;
 wire \sram_rdat[19] ;
 wire \sram_rdat[1] ;
 wire \sram_rdat[20] ;
 wire \sram_rdat[21] ;
 wire \sram_rdat[22] ;
 wire \sram_rdat[23] ;
 wire \sram_rdat[24] ;
 wire \sram_rdat[25] ;
 wire \sram_rdat[26] ;
 wire \sram_rdat[27] ;
 wire \sram_rdat[28] ;
 wire \sram_rdat[29] ;
 wire \sram_rdat[2] ;
 wire \sram_rdat[30] ;
 wire \sram_rdat[31] ;
 wire \sram_rdat[3] ;
 wire \sram_rdat[4] ;
 wire \sram_rdat[5] ;
 wire \sram_rdat[6] ;
 wire \sram_rdat[7] ;
 wire \sram_rdat[8] ;
 wire \sram_rdat[9] ;
 wire \sram_sel[0] ;
 wire \sram_sel[1] ;
 wire \sram_sel[2] ;
 wire \sram_sel[3] ;
 wire sram_stb;
 wire \sram_wdat[0] ;
 wire \sram_wdat[10] ;
 wire \sram_wdat[11] ;
 wire \sram_wdat[12] ;
 wire \sram_wdat[13] ;
 wire \sram_wdat[14] ;
 wire \sram_wdat[15] ;
 wire \sram_wdat[16] ;
 wire \sram_wdat[17] ;
 wire \sram_wdat[18] ;
 wire \sram_wdat[19] ;
 wire \sram_wdat[1] ;
 wire \sram_wdat[20] ;
 wire \sram_wdat[21] ;
 wire \sram_wdat[22] ;
 wire \sram_wdat[23] ;
 wire \sram_wdat[24] ;
 wire \sram_wdat[25] ;
 wire \sram_wdat[26] ;
 wire \sram_wdat[27] ;
 wire \sram_wdat[28] ;
 wire \sram_wdat[29] ;
 wire \sram_wdat[2] ;
 wire \sram_wdat[30] ;
 wire \sram_wdat[31] ;
 wire \sram_wdat[3] ;
 wire \sram_wdat[4] ;
 wire \sram_wdat[5] ;
 wire \sram_wdat[6] ;
 wire \sram_wdat[7] ;
 wire \sram_wdat[8] ;
 wire \sram_wdat[9] ;
 wire sram_we;

 CF_ADC_SAR12 u_cf_adc_sar12 (.en_pump_lv(\analog_ctrl[20] ),
    .vreflo(analog_io[22]),
    .scan_test_mode(\analog_ctrl[21] ),
    .test_scanin(\analog_ctrl[22] ),
    .test_scanen(\analog_ctrl[23] ),
    .hiz(\analog_ctrl[13] ),
    .sof(\analog_ctrl[11] ),
    .test_sea(\analog_ctrl[24] ),
    .reset_n(\analog_ctrl[10] ),
    .eof(afe_eof),
    .iso_en(\analog_ctrl[14] ),
    .next(\analog_ctrl[12] ),
    .vinp(afe_vout),
    .vinm(analog_io[20]),
    .vrefhi(afe_refhi),
    .trimunit(\analog_ctrl[16] ),
    .vdda(analog_io[25]),
    .vgnd(vssd1),
    .VPUMP(analog_io[27]),
    .vssa(analog_io[26]),
    .refby2(afe_refby2),
    .pumpclk(\analog_ctrl[19] ),
    .pd(\analog_ctrl[8] ),
    .pd_ana(\analog_ctrl[9] ),
    .refclk(user_clock2),
    .vpwr(vccd1),
    .dly_inc(\analog_ctrl[17] ),
    .dcen(\analog_ctrl[18] ),
    .ibias2p5u(afe_ibias),
    .ibias2p5u_1(afe_ibias),
    .enable_hv(\analog_ctrl[15] ),
    .cap_trim({\analog_ctrl[39] ,
    \analog_ctrl[38] ,
    \analog_ctrl[37] }),
    .data_out({\afe_data[11] ,
    \afe_data[10] ,
    \afe_data[9] ,
    \afe_data[8] ,
    \afe_data[7] ,
    \afe_data[6] ,
    \afe_data[5] ,
    \afe_data[4] ,
    \afe_data[3] ,
    \afe_data[2] ,
    \afe_data[1] ,
    \afe_data[0] }),
    .dft_inc({\analog_ctrl[45] ,
    \analog_ctrl[44] ,
    \analog_ctrl[43] ,
    \analog_ctrl[42] }),
    .dft_outc({\analog_ctrl[48] ,
    \analog_ctrl[47] ,
    \analog_ctrl[46] }),
    .icont_lv({\analog_ctrl[41] ,
    \analog_ctrl[40] }),
    .resolution({\analog_ctrl[26] ,
    \analog_ctrl[25] }),
    .sample_width({\analog_ctrl[36] ,
    \analog_ctrl[35] ,
    \analog_ctrl[34] ,
    \analog_ctrl[33] ,
    \analog_ctrl[32] ,
    \analog_ctrl[31] ,
    \analog_ctrl[30] ,
    \analog_ctrl[29] ,
    \analog_ctrl[28] ,
    \analog_ctrl[27] }),
    .sel_csel_dft({\analog_ctrl[52] ,
    \analog_ctrl[51] ,
    \analog_ctrl[50] ,
    \analog_ctrl[49] }));
 CF_ADC_SAR12_sar_refs u_cf_adc_sar12_sar_refs (.vdda(analog_io[25]),
    .vpwr(vccd1),
    .VPUMP(analog_io[27]),
    .vssa(analog_io[26]),
    .vgnd(vssd1),
    .pd(\analog_ctrl[8] ),
    .hiz(\analog_ctrl[13] ),
    .REFBY2(afe_refby2),
    .pd_ana(\analog_ctrl[9] ),
    .EN_RESVDA(\analog_ctrl[63] ),
    .IREF_VCMBUF(afe_ibias),
    .sw_start(\analog_ctrl[108] ),
    .pd_vcmbuf(\analog_ctrl[109] ),
    .refout(analog_io[21]),
    .refout_en(\analog_ctrl[118] ),
    .sw_holdb(\analog_ctrl[119] ),
    .enpdb_hv(\analog_ctrl[120] ),
    .REFHI(afe_refhi),
    .enable_hv(\analog_ctrl[15] ),
    .IREF_VREFBUF(afe_ibias),
    .PD_BUF_VREF(\analog_ctrl[121] ),
    .vssa_shield(analog_io[26]),
    .dft_comp_en(\analog_ctrl[122] ),
    .PWR_CTRL_VREF({\analog_ctrl[59] ,
    \analog_ctrl[58] }),
    .S_LV({\analog_ctrl[117] ,
    \analog_ctrl[116] ,
    \analog_ctrl[115] ,
    \analog_ctrl[114] ,
    \analog_ctrl[113] ,
    \analog_ctrl[112] ,
    \analog_ctrl[111] ,
    \analog_ctrl[110] }),
    .muxsarref({\analog_ctrl[62] ,
    \analog_ctrl[61] ,
    \analog_ctrl[60] }),
    .vref({\analog_ctrl[57] ,
    \analog_ctrl[56] ,
    \analog_ctrl[55] ,
    \analog_ctrl[54] ,
    \analog_ctrl[53] }));
 CF_BGR u_cf_bgr (.finetune(\analog_ctrl[96] ),
    .en_startb(\analog_ctrl[97] ),
    .mux2sel(\analog_ctrl[92] ),
    .dft_sel(\analog_ctrl[93] ),
    .pd_ibg(\analog_ctrl[95] ),
    .pd(\analog_ctrl[94] ),
    .dft_curr_in(analog_io[24]),
    .vb2_fast(analog_io[0]),
    .Vout(afe_vref),
    .ibg_3uA(afe_nbias),
    .ibg_2p375uA(afe_ibias),
    .vgnd(vssd1),
    .vpwr(vccd1),
    .CurrAbsTrim({\analog_ctrl[82] ,
    \analog_ctrl[81] ,
    \analog_ctrl[80] ,
    \analog_ctrl[79] ,
    \analog_ctrl[78] ,
    \analog_ctrl[77] }),
    .inl_ctrl({\analog_ctrl[89] ,
    \analog_ctrl[88] ,
    \analog_ctrl[87] ,
    \analog_ctrl[86] ,
    \analog_ctrl[85] ,
    \analog_ctrl[84] ,
    \analog_ctrl[83] }),
    .mux1sel({\analog_ctrl[91] ,
    \analog_ctrl[90] }),
    .trimCurr({\analog_ctrl[76] ,
    \analog_ctrl[75] ,
    \analog_ctrl[74] ,
    \analog_ctrl[73] ,
    \analog_ctrl[72] ,
    \analog_ctrl[71] }),
    .trimTC({\analog_ctrl[70] ,
    \analog_ctrl[69] ,
    \analog_ctrl[68] ,
    \analog_ctrl[67] ,
    \analog_ctrl[66] ,
    \analog_ctrl[65] ,
    \analog_ctrl[64] }));
 CF_BUF_HIZ u_cf_buf_hiz (.tp(\analog_ctrl[2] ),
    .vgnd(vssd1),
    .clk2_boost(\analog_ctrl[3] ),
    .clk1_boostr(\analog_ctrl[6] ),
    .vpwr(vccd1),
    .vout(afe_vout),
    .ibias(afe_ibias),
    .e_pd(\analog_ctrl[0] ),
    .en_pd(\analog_ctrl[1] ),
    .vinp_n(analog_io[3]),
    .vinn_n(analog_io[4]),
    .vinp_na(analog_io[5]),
    .vinn_na(analog_io[6]),
    .vinn_p(analog_io[2]),
    .vinp_p(analog_io[1]),
    .e_na_boost(\analog_ctrl[5] ),
    .e_n_boost(\analog_ctrl[4] ));
 CF_REFBUF u_cf_refbuf (.nbias(afe_nbias),
    .out(analog_io[7]),
    .ref_1v2(afe_vref),
    .vgnd(vssd1),
    .pd(\analog_ctrl[104] ),
    .ng(analog_io[8]),
    .switchon(\analog_ctrl[105] ),
    .ch_cont(\analog_ctrl[107] ),
    .boost(\analog_ctrl[106] ),
    .vpwre(analog_io[8]),
    .ch2(analog_io[7]),
    .vpwr(vccd1),
    .ch1(analog_io[7]));
 soc_sys u_soc_sys (.adc_eof(afe_eof),
    .sram_ack_i(sram_ack),
    .sram_cyc_o(sram_cyc),
    .sram_stb_o(sram_stb),
    .sram_we_o(sram_we),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_we_i(wbs_we_i),
    .adc_data({\afe_data[11] ,
    \afe_data[10] ,
    \afe_data[9] ,
    \afe_data[8] ,
    \afe_data[7] ,
    \afe_data[6] ,
    \afe_data[5] ,
    \afe_data[4] ,
    \afe_data[3] ,
    \afe_data[2] ,
    \afe_data[1] ,
    \afe_data[0] }),
    .analog_ctrl({\analog_ctrl[122] ,
    \analog_ctrl[121] ,
    \analog_ctrl[120] ,
    \analog_ctrl[119] ,
    \analog_ctrl[118] ,
    \analog_ctrl[117] ,
    \analog_ctrl[116] ,
    \analog_ctrl[115] ,
    \analog_ctrl[114] ,
    \analog_ctrl[113] ,
    \analog_ctrl[112] ,
    \analog_ctrl[111] ,
    \analog_ctrl[110] ,
    \analog_ctrl[109] ,
    \analog_ctrl[108] ,
    \analog_ctrl[107] ,
    \analog_ctrl[106] ,
    \analog_ctrl[105] ,
    \analog_ctrl[104] ,
    \analog_ctrl[103] ,
    \analog_ctrl[102] ,
    \analog_ctrl[101] ,
    \analog_ctrl[100] ,
    \analog_ctrl[99] ,
    \analog_ctrl[98] ,
    \analog_ctrl[97] ,
    \analog_ctrl[96] ,
    \analog_ctrl[95] ,
    \analog_ctrl[94] ,
    \analog_ctrl[93] ,
    \analog_ctrl[92] ,
    \analog_ctrl[91] ,
    \analog_ctrl[90] ,
    \analog_ctrl[89] ,
    \analog_ctrl[88] ,
    \analog_ctrl[87] ,
    \analog_ctrl[86] ,
    \analog_ctrl[85] ,
    \analog_ctrl[84] ,
    \analog_ctrl[83] ,
    \analog_ctrl[82] ,
    \analog_ctrl[81] ,
    \analog_ctrl[80] ,
    \analog_ctrl[79] ,
    \analog_ctrl[78] ,
    \analog_ctrl[77] ,
    \analog_ctrl[76] ,
    \analog_ctrl[75] ,
    \analog_ctrl[74] ,
    \analog_ctrl[73] ,
    \analog_ctrl[72] ,
    \analog_ctrl[71] ,
    \analog_ctrl[70] ,
    \analog_ctrl[69] ,
    \analog_ctrl[68] ,
    \analog_ctrl[67] ,
    \analog_ctrl[66] ,
    \analog_ctrl[65] ,
    \analog_ctrl[64] ,
    \analog_ctrl[63] ,
    \analog_ctrl[62] ,
    \analog_ctrl[61] ,
    \analog_ctrl[60] ,
    \analog_ctrl[59] ,
    \analog_ctrl[58] ,
    \analog_ctrl[57] ,
    \analog_ctrl[56] ,
    \analog_ctrl[55] ,
    \analog_ctrl[54] ,
    \analog_ctrl[53] ,
    \analog_ctrl[52] ,
    \analog_ctrl[51] ,
    \analog_ctrl[50] ,
    \analog_ctrl[49] ,
    \analog_ctrl[48] ,
    \analog_ctrl[47] ,
    \analog_ctrl[46] ,
    \analog_ctrl[45] ,
    \analog_ctrl[44] ,
    \analog_ctrl[43] ,
    \analog_ctrl[42] ,
    \analog_ctrl[41] ,
    \analog_ctrl[40] ,
    \analog_ctrl[39] ,
    \analog_ctrl[38] ,
    \analog_ctrl[37] ,
    \analog_ctrl[36] ,
    \analog_ctrl[35] ,
    \analog_ctrl[34] ,
    \analog_ctrl[33] ,
    \analog_ctrl[32] ,
    \analog_ctrl[31] ,
    \analog_ctrl[30] ,
    \analog_ctrl[29] ,
    \analog_ctrl[28] ,
    \analog_ctrl[27] ,
    \analog_ctrl[26] ,
    \analog_ctrl[25] ,
    \analog_ctrl[24] ,
    \analog_ctrl[23] ,
    \analog_ctrl[22] ,
    \analog_ctrl[21] ,
    \analog_ctrl[20] ,
    \analog_ctrl[19] ,
    \analog_ctrl[18] ,
    \analog_ctrl[17] ,
    \analog_ctrl[16] ,
    \analog_ctrl[15] ,
    \analog_ctrl[14] ,
    \analog_ctrl[13] ,
    \analog_ctrl[12] ,
    \analog_ctrl[11] ,
    \analog_ctrl[10] ,
    \analog_ctrl[9] ,
    \analog_ctrl[8] ,
    \analog_ctrl[7] ,
    \analog_ctrl[6] ,
    \analog_ctrl[5] ,
    \analog_ctrl[4] ,
    \analog_ctrl[3] ,
    \analog_ctrl[2] ,
    \analog_ctrl[1] ,
    \analog_ctrl[0] }),
    .io_in({io_in[37],
    io_in[36],
    io_in[35],
    io_in[34],
    io_in[33],
    io_in[32],
    io_in[31],
    io_in[30],
    io_in[29],
    io_in[28],
    io_in[27],
    io_in[26],
    io_in[25],
    io_in[24],
    io_in[23],
    io_in[22],
    io_in[21],
    io_in[20],
    io_in[19],
    io_in[18],
    io_in[17],
    io_in[16],
    io_in[15],
    io_in[14],
    io_in[13],
    io_in[12],
    io_in[11],
    io_in[10],
    io_in[9],
    io_in[8],
    io_in[7]}),
    .io_oeb({io_oeb[37],
    io_oeb[36],
    io_oeb[35],
    io_oeb[34],
    io_oeb[33],
    io_oeb[32],
    io_oeb[31],
    io_oeb[30],
    io_oeb[29],
    io_oeb[28],
    io_oeb[27],
    io_oeb[26],
    io_oeb[25],
    io_oeb[24],
    io_oeb[23],
    io_oeb[22],
    io_oeb[21],
    io_oeb[20],
    io_oeb[19],
    io_oeb[18],
    io_oeb[17],
    io_oeb[16],
    io_oeb[15],
    io_oeb[14],
    io_oeb[13],
    io_oeb[12],
    io_oeb[11],
    io_oeb[10],
    io_oeb[9],
    io_oeb[8],
    io_oeb[7]}),
    .io_out({io_out[37],
    io_out[36],
    io_out[35],
    io_out[34],
    io_out[33],
    io_out[32],
    io_out[31],
    io_out[30],
    io_out[29],
    io_out[28],
    io_out[27],
    io_out[26],
    io_out[25],
    io_out[24],
    io_out[23],
    io_out[22],
    io_out[21],
    io_out[20],
    io_out[19],
    io_out[18],
    io_out[17],
    io_out[16],
    io_out[15],
    io_out[14],
    io_out[13],
    io_out[12],
    io_out[11],
    io_out[10],
    io_out[9],
    io_out[8],
    io_out[7]}),
    .sram_adr_o({\sram_adr[31] ,
    \sram_adr[30] ,
    \sram_adr[29] ,
    \sram_adr[28] ,
    \sram_adr[27] ,
    \sram_adr[26] ,
    \sram_adr[25] ,
    \sram_adr[24] ,
    \sram_adr[23] ,
    \sram_adr[22] ,
    \sram_adr[21] ,
    \sram_adr[20] ,
    \sram_adr[19] ,
    \sram_adr[18] ,
    \sram_adr[17] ,
    \sram_adr[16] ,
    \sram_adr[15] ,
    \sram_adr[14] ,
    \sram_adr[13] ,
    \sram_adr[12] ,
    \sram_adr[11] ,
    \sram_adr[10] ,
    \sram_adr[9] ,
    \sram_adr[8] ,
    \sram_adr[7] ,
    \sram_adr[6] ,
    \sram_adr[5] ,
    \sram_adr[4] ,
    \sram_adr[3] ,
    \sram_adr[2] ,
    \sram_adr[1] ,
    \sram_adr[0] }),
    .sram_dat_i({\sram_rdat[31] ,
    \sram_rdat[30] ,
    \sram_rdat[29] ,
    \sram_rdat[28] ,
    \sram_rdat[27] ,
    \sram_rdat[26] ,
    \sram_rdat[25] ,
    \sram_rdat[24] ,
    \sram_rdat[23] ,
    \sram_rdat[22] ,
    \sram_rdat[21] ,
    \sram_rdat[20] ,
    \sram_rdat[19] ,
    \sram_rdat[18] ,
    \sram_rdat[17] ,
    \sram_rdat[16] ,
    \sram_rdat[15] ,
    \sram_rdat[14] ,
    \sram_rdat[13] ,
    \sram_rdat[12] ,
    \sram_rdat[11] ,
    \sram_rdat[10] ,
    \sram_rdat[9] ,
    \sram_rdat[8] ,
    \sram_rdat[7] ,
    \sram_rdat[6] ,
    \sram_rdat[5] ,
    \sram_rdat[4] ,
    \sram_rdat[3] ,
    \sram_rdat[2] ,
    \sram_rdat[1] ,
    \sram_rdat[0] }),
    .sram_dat_o({\sram_wdat[31] ,
    \sram_wdat[30] ,
    \sram_wdat[29] ,
    \sram_wdat[28] ,
    \sram_wdat[27] ,
    \sram_wdat[26] ,
    \sram_wdat[25] ,
    \sram_wdat[24] ,
    \sram_wdat[23] ,
    \sram_wdat[22] ,
    \sram_wdat[21] ,
    \sram_wdat[20] ,
    \sram_wdat[19] ,
    \sram_wdat[18] ,
    \sram_wdat[17] ,
    \sram_wdat[16] ,
    \sram_wdat[15] ,
    \sram_wdat[14] ,
    \sram_wdat[13] ,
    \sram_wdat[12] ,
    \sram_wdat[11] ,
    \sram_wdat[10] ,
    \sram_wdat[9] ,
    \sram_wdat[8] ,
    \sram_wdat[7] ,
    \sram_wdat[6] ,
    \sram_wdat[5] ,
    \sram_wdat[4] ,
    \sram_wdat[3] ,
    \sram_wdat[2] ,
    \sram_wdat[1] ,
    \sram_wdat[0] }),
    .sram_sel_o({\sram_sel[3] ,
    \sram_sel[2] ,
    \sram_sel[1] ,
    \sram_sel[0] }),
    .user_irq({user_irq[2],
    user_irq[1],
    user_irq[0]}),
    .wbs_adr_i({wbs_adr_i[31],
    wbs_adr_i[30],
    wbs_adr_i[29],
    wbs_adr_i[28],
    wbs_adr_i[27],
    wbs_adr_i[26],
    wbs_adr_i[25],
    wbs_adr_i[24],
    wbs_adr_i[23],
    wbs_adr_i[22],
    wbs_adr_i[21],
    wbs_adr_i[20],
    wbs_adr_i[19],
    wbs_adr_i[18],
    wbs_adr_i[17],
    wbs_adr_i[16],
    wbs_adr_i[15],
    wbs_adr_i[14],
    wbs_adr_i[13],
    wbs_adr_i[12],
    wbs_adr_i[11],
    wbs_adr_i[10],
    wbs_adr_i[9],
    wbs_adr_i[8],
    wbs_adr_i[7],
    wbs_adr_i[6],
    wbs_adr_i[5],
    wbs_adr_i[4],
    wbs_adr_i[3],
    wbs_adr_i[2],
    wbs_adr_i[1],
    wbs_adr_i[0]}),
    .wbs_dat_i({wbs_dat_i[31],
    wbs_dat_i[30],
    wbs_dat_i[29],
    wbs_dat_i[28],
    wbs_dat_i[27],
    wbs_dat_i[26],
    wbs_dat_i[25],
    wbs_dat_i[24],
    wbs_dat_i[23],
    wbs_dat_i[22],
    wbs_dat_i[21],
    wbs_dat_i[20],
    wbs_dat_i[19],
    wbs_dat_i[18],
    wbs_dat_i[17],
    wbs_dat_i[16],
    wbs_dat_i[15],
    wbs_dat_i[14],
    wbs_dat_i[13],
    wbs_dat_i[12],
    wbs_dat_i[11],
    wbs_dat_i[10],
    wbs_dat_i[9],
    wbs_dat_i[8],
    wbs_dat_i[7],
    wbs_dat_i[6],
    wbs_dat_i[5],
    wbs_dat_i[4],
    wbs_dat_i[3],
    wbs_dat_i[2],
    wbs_dat_i[1],
    wbs_dat_i[0]}),
    .wbs_dat_o({wbs_dat_o[31],
    wbs_dat_o[30],
    wbs_dat_o[29],
    wbs_dat_o[28],
    wbs_dat_o[27],
    wbs_dat_o[26],
    wbs_dat_o[25],
    wbs_dat_o[24],
    wbs_dat_o[23],
    wbs_dat_o[22],
    wbs_dat_o[21],
    wbs_dat_o[20],
    wbs_dat_o[19],
    wbs_dat_o[18],
    wbs_dat_o[17],
    wbs_dat_o[16],
    wbs_dat_o[15],
    wbs_dat_o[14],
    wbs_dat_o[13],
    wbs_dat_o[12],
    wbs_dat_o[11],
    wbs_dat_o[10],
    wbs_dat_o[9],
    wbs_dat_o[8],
    wbs_dat_o[7],
    wbs_dat_o[6],
    wbs_dat_o[5],
    wbs_dat_o[4],
    wbs_dat_o[3],
    wbs_dat_o[2],
    wbs_dat_o[1],
    wbs_dat_o[0]}),
    .wbs_sel_i({wbs_sel_i[3],
    wbs_sel_i[2],
    wbs_sel_i[1],
    wbs_sel_i[0]}));
 CF_SRAM_1024x32_wb_wrapper u_sram (.VGND(vssd1),
    .VPWR(vccd1),
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    .wbs_ack_o(sram_ack),
    .wbs_cyc_i(sram_cyc),
    .wbs_stb_i(sram_stb),
    .wbs_we_i(sram_we),
    .wbs_adr_i({\sram_adr[31] ,
    \sram_adr[30] ,
    \sram_adr[29] ,
    \sram_adr[28] ,
    \sram_adr[27] ,
    \sram_adr[26] ,
    \sram_adr[25] ,
    \sram_adr[24] ,
    \sram_adr[23] ,
    \sram_adr[22] ,
    \sram_adr[21] ,
    \sram_adr[20] ,
    \sram_adr[19] ,
    \sram_adr[18] ,
    \sram_adr[17] ,
    \sram_adr[16] ,
    \sram_adr[15] ,
    \sram_adr[14] ,
    \sram_adr[13] ,
    \sram_adr[12] ,
    \sram_adr[11] ,
    \sram_adr[10] ,
    \sram_adr[9] ,
    \sram_adr[8] ,
    \sram_adr[7] ,
    \sram_adr[6] ,
    \sram_adr[5] ,
    \sram_adr[4] ,
    \sram_adr[3] ,
    \sram_adr[2] ,
    \sram_adr[1] ,
    \sram_adr[0] }),
    .wbs_dat_i({\sram_wdat[31] ,
    \sram_wdat[30] ,
    \sram_wdat[29] ,
    \sram_wdat[28] ,
    \sram_wdat[27] ,
    \sram_wdat[26] ,
    \sram_wdat[25] ,
    \sram_wdat[24] ,
    \sram_wdat[23] ,
    \sram_wdat[22] ,
    \sram_wdat[21] ,
    \sram_wdat[20] ,
    \sram_wdat[19] ,
    \sram_wdat[18] ,
    \sram_wdat[17] ,
    \sram_wdat[16] ,
    \sram_wdat[15] ,
    \sram_wdat[14] ,
    \sram_wdat[13] ,
    \sram_wdat[12] ,
    \sram_wdat[11] ,
    \sram_wdat[10] ,
    \sram_wdat[9] ,
    \sram_wdat[8] ,
    \sram_wdat[7] ,
    \sram_wdat[6] ,
    \sram_wdat[5] ,
    \sram_wdat[4] ,
    \sram_wdat[3] ,
    \sram_wdat[2] ,
    \sram_wdat[1] ,
    \sram_wdat[0] }),
    .wbs_dat_o({\sram_rdat[31] ,
    \sram_rdat[30] ,
    \sram_rdat[29] ,
    \sram_rdat[28] ,
    \sram_rdat[27] ,
    \sram_rdat[26] ,
    \sram_rdat[25] ,
    \sram_rdat[24] ,
    \sram_rdat[23] ,
    \sram_rdat[22] ,
    \sram_rdat[21] ,
    \sram_rdat[20] ,
    \sram_rdat[19] ,
    \sram_rdat[18] ,
    \sram_rdat[17] ,
    \sram_rdat[16] ,
    \sram_rdat[15] ,
    \sram_rdat[14] ,
    \sram_rdat[13] ,
    \sram_rdat[12] ,
    \sram_rdat[11] ,
    \sram_rdat[10] ,
    \sram_rdat[9] ,
    \sram_rdat[8] ,
    \sram_rdat[7] ,
    \sram_rdat[6] ,
    \sram_rdat[5] ,
    \sram_rdat[4] ,
    \sram_rdat[3] ,
    \sram_rdat[2] ,
    \sram_rdat[1] ,
    \sram_rdat[0] }),
    .wbs_sel_i({\sram_sel[3] ,
    \sram_sel[2] ,
    \sram_sel[1] ,
    \sram_sel[0] }));
endmodule
