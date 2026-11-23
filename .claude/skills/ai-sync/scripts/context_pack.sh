#!/usr/bin/env bash
# Prints a paste-ready context pack for another AI, built fresh from the brain's owner files.
# Usage: context_pack.sh > context-pack.md
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../../../.." && pwd)"
cd "$ROOT"

echo "# Context about me (generated $(date +%F) from my notes — facts tagged with their source)"
echo
echo "Use this to understand who I am and how I like to work. Items under 'Open questions' are unknown — don't assume them."
for f in brain/me/profile.md brain/me/communication.md brain/me/projects.md brain/me/voice.md brain/me/brand.md; do
  [[ -f "$f" ]] || continue
  echo
  echo "---"
  echo
  # Drop internal pointer lines that only make sense inside this repo.
  grep -vE '^(> Public repo|Owner of this fact set|Confirmed facts only\. Rules:|One entry per project\.)' "$f"
done
