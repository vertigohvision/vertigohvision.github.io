"""Convert a yt-dlp subtitle file (json3 or vtt) to plain text with a timestamp every ~30s.

Usage: python3 -I to_text.py <subtitle-file> <out.txt>
"""
import json
import re
import sys


def from_json3(path):
    with open(path, encoding="utf-8") as f:
        data = json.load(f)
    for ev in data.get("events", []):
        text = "".join(s.get("utf8", "") for s in (ev.get("segs") or []))
        if text.strip():
            yield ev.get("tStartMs", 0) // 1000, text.replace("\n", " ")


def from_vtt(path):
    start, seen = 0, set()
    with open(path, encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            m = re.match(r"(\d+):(\d+):(\d+)\.\d+ -->", line)
            if m:
                h, mi, s = map(int, m.groups())
                start = h * 3600 + mi * 60 + s
                continue
            if not line or line.startswith(("WEBVTT", "Kind:", "Language:")) or line.isdigit():
                continue
            clean = re.sub(r"<[^>]+>", "", line)
            if clean and clean not in seen:  # auto-captions repeat lines
                seen.add(clean)
                yield start, clean + " "


def main():
    src, dst = sys.argv[1], sys.argv[2]
    pieces = from_json3(src) if src.endswith(".json3") else from_vtt(src)
    out, last = [], -60
    for sec, text in pieces:
        if sec - last >= 30:
            out.append(f"\n[{sec // 60}:{sec % 60:02d}] ")
            last = sec
        out.append(text)
    with open(dst, "w", encoding="utf-8") as f:
        f.write("".join(out).strip() + "\n")


if __name__ == "__main__":
    main()
