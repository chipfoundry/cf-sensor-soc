#!/usr/bin/env python3
"""Clone catalog analog + digital IPs into ip/ at the pinned tags.

Analog packages are private ChipFoundry repos. Digital IPs (and CF_IP_UTIL)
are public. ipm --local-file catalog.json only covers analog, and a local
ipm extract nests files at ip/<IP>/<IP>/layout; this script clones the
Git tags so layout/hdl/verify land where the OpenLane configs point.

The default Actions GITHUB_TOKEN cannot read other private repos. Set a
repo/org secret GH_TOKEN (PAT or GitHub App token with contents:read on
the analog IPs) for CI harden/verify.
"""

from __future__ import annotations

import json
import os
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
IP_DIR = ROOT / "ip"
DEP_FILE = IP_DIR / "dependencies.json"
ANALOG = ("CF_BUF_HIZ", "CF_ADC_SAR12", "CF_BGR", "CF_REFBUF")
# Soft dep of the Wishbone wrappers; not always listed in dependencies.json.
ALWAYS = (("CF_IP_UTIL", "v1.0.0"),)


def tag_for(name: str, version: str) -> str:
    return f"{name}-{version}"


def already_present(dest: Path) -> bool:
    return (dest / "hdl").exists() or (dest / "layout").exists() or (dest / "gds").exists()


def flatten_ipm_nest(dest: Path, name: str) -> None:
    nested = dest / name
    if not nested.is_dir():
        return
    for sub in ("layout", "hdl", "verify", "gds", "lef", "lib"):
        src = nested / sub
        link = dest / sub
        if src.exists() and not link.exists():
            link.symlink_to(Path(name) / sub)


def clone(name: str, version: str, token: str) -> None:
    dest = IP_DIR / name
    tag = tag_for(name, version)
    if already_present(dest):
        flatten_ipm_nest(dest, name)
        print(f"skip {name} (already present)")
        return

    if dest.exists():
        shutil.rmtree(dest)

    url = f"https://github.com/chipfoundry/{name}.git"
    if token:
        url = f"https://x-access-token:{token}@github.com/chipfoundry/{name}.git"

    cmd = ["git", "clone", "--depth", "1", "--branch", tag, url, str(dest)]
    print(f"clone {name} @{tag}")
    try:
        subprocess.run(cmd, check=True, capture_output=True, text=True)
    except subprocess.CalledProcessError as exc:
        stderr = (exc.stderr or "").replace(token, "***") if token else (exc.stderr or "")
        private = name in ANALOG
        hint = ""
        if private:
            hint = (
                "\nAnalog IP is a private chipfoundry repo. Set secret GH_TOKEN to a "
                "PAT/App token that can read chipfoundry/CF_BUF_HIZ, CF_ADC_SAR12, "
                "CF_BGR, and CF_REFBUF. The default Actions GITHUB_TOKEN only covers "
                "this repository."
            )
        raise SystemExit(f"failed to clone {name} @{tag}: {stderr}{hint}") from exc

    git_dir = dest / ".git"
    if git_dir.exists():
        shutil.rmtree(git_dir)
    flatten_ipm_nest(dest, name)

    if not already_present(dest):
        raise SystemExit(f"{name} cloned but has no hdl/, layout/, or gds/")


def main() -> int:
    token = os.environ.get("GH_TOKEN") or os.environ.get("GITHUB_TOKEN") or ""
    deps = json.loads(DEP_FILE.read_text())["IP"]
    seen = set()
    for item in deps:
        name, version = next(iter(item.items()))
        clone(name, version, token)
        seen.add(name)
    for name, version in ALWAYS:
        if name not in seen:
            clone(name, version, token)
    return 0


if __name__ == "__main__":
    sys.exit(main())
