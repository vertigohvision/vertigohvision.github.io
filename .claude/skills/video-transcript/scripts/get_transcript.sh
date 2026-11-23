#!/usr/bin/env bash
# Usage: get_transcript.sh <video-url> <output-dir>
# Writes <output-dir>/transcript.txt and prints "title | channel | duration | upload_date".
#
# Lessons baked in (2026-11-23):
# - From cloud IPs the default client often hits YouTube's bot check; web_embedded still works.
# - Ask for ONE caption language per attempt: if several are requested, a 429 on one
#   (usually the auto-translated "en") aborts the whole run before the others are saved.
# - "en-orig" (the original-language track) is the least rate-limited, so try it first.
set -uo pipefail

URL="${1:?video url required}"
OUT="${2:?output dir required}"
HERE="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$OUT"

command -v yt-dlp >/dev/null 2>&1 || pip install -q yt-dlp >/dev/null 2>&1 || { echo "ERROR: could not install yt-dlp"; exit 1; }

JS_ARGS=()
command -v node >/dev/null 2>&1 && JS_ARGS=(--js-runtimes node)

SUB=""
n=0
for CLIENT in web_embedded default mweb; do
  EXTRA=()
  [[ "$CLIENT" != "default" ]] && EXTRA=(--extractor-args "youtube:player_client=$CLIENT")
  for LANG_CODE in en-orig en en-US en-GB; do
    n=$((n + 1))
    TRY="$OUT/try$n-$CLIENT-$LANG_CODE"   # fresh folder per attempt; nothing gets deleted
    mkdir -p "$TRY"
    yt-dlp --skip-download --ignore-no-formats-error \
      --write-subs --write-auto-subs --sub-langs "$LANG_CODE" \
      --sub-format "json3/vtt/best" "${JS_ARGS[@]}" "${EXTRA[@]}" \
      --print "%(title)s | %(channel)s | %(duration_string)s | %(upload_date)s" --no-simulate \
      -o "$TRY/vid" "$URL" 2>"$TRY/stderr.log" | head -1 > "$TRY/meta.txt"
    SUB="$(ls "$TRY"/vid.*.json3 "$TRY"/vid.*.vtt 2>/dev/null | head -1)"
    if [[ -n "$SUB" ]]; then
      echo "ok: client=$CLIENT lang=$LANG_CODE" >&2
      cp "$TRY/meta.txt" "$OUT/meta.txt"
      break 2
    fi
    ERR="$(grep -m1 ERROR "$TRY/stderr.log")"
    echo "miss: client=$CLIENT lang=$LANG_CODE ${ERR:-no track}" >&2
    # Bot check / blocked network affects every language for this client: skip to the next client.
    if grep -qE "not a bot|403 Forbidden|Unable to download (webpage|API page)" "$TRY/stderr.log"; then
      continue 2
    fi
  done
done

if [[ -z "$SUB" ]]; then
  echo "ERROR: no subtitles downloaded. Logs: $OUT/try*/stderr.log"
  exit 2
fi

python3 -I "$HERE/to_text.py" "$SUB" "$OUT/transcript.txt" || exit 3
cat "$OUT/meta.txt"
echo "transcript: $OUT/transcript.txt ($(wc -w < "$OUT/transcript.txt") words)"
