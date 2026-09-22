import argparse
from pathlib import Path


def parse_lvs_config(file_path):
    """Parses the LVS config file at the specified path."""
    import json

    with open(file_path) as f:
        data = json.load(f)
    return data["LVS_VERILOG_FILES"]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--design", help="The path to the design.")
    args = parser.parse_args()

    config_file = f"{args.design}/lvs/user_project_wrapper/lvs_config.json"
    data = parse_lvs_config(config_file)
    names = []
    seen = set()
    for d in data:
        macro_name = d.split("/")[-1].split(".v")[0]
        if macro_name.startswith("$"):
            macro_name = "user_project_wrapper"
        cfg = Path(args.design) / "openlane" / macro_name / "config.json"
        if not cfg.is_file() or macro_name in seen:
            continue
        names.append(macro_name)
        seen.add(macro_name)
    Path("harden_sequence.txt").write_text(" ".join(names) + (" " if names else ""))


if __name__ == "__main__":
    main()
