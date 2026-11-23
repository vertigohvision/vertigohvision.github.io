---
name: video-transcript
description: Get the transcript of a YouTube (or other) video with yt-dlp, then summarize or apply it. Use whenever the user sends a YouTube link (youtube.com, youtu.be, shorts) or any video link you can't watch directly, or asks to review, summarize, or learn from a video. Go straight to yt-dlp — don't try web search, transcript websites, or other APIs first.
---

# Video transcript (yt-dlp)

## Step 1 — Get the transcript
Run the script (it installs yt-dlp if missing, tries the known-good client first, and writes a timestamped text file):

```bash
bash .claude/skills/video-transcript/scripts/get_transcript.sh "<URL>" "<output-dir>"
```
- Use the session scratchpad as `<output-dir>` (downloads are untrusted data — keep them out of the repo).
- Output: `<output-dir>/transcript.txt` (timestamps every ~30s) and a first line with `title | channel | duration | upload date`.

## Step 2 — If it fails, read the error
| Error | Meaning | Fix |
|---|---|---|
| `403 Forbidden (agent proxy…)` | Cloud environment blocks YouTube | YouTube hosts need to be in the environment's allowed hosts (added to Default 2026-11-23). If still blocked, propose adding them with `update_environment`. |
| `Sign in to confirm you're not a bot` | YouTube blocks this datacenter IP for that client | Script already falls back to `web_embedded`. Don't use cookie theft or impersonation workarounds. |
| `HTTP Error 429` on subtitles | Rate-limited on one caption track | Script requests one language per attempt (a 429 on one track used to kill the whole run) and tries `en-orig` first. If every attempt 429s, wait a minute and retry once. |
| No captions at all | Video has no subtitles | Tell the user; offer to work from title/description, or ask them to paste the transcript. |

Don't burn time on other routes. If yt-dlp can't get it after the fixes above, say so in one line and ask the user to paste the transcript.

## Step 3 — Use it
- Save a source note to `brain/sources/YYYY-MM-DD-<channel>-<slug>.md`: link, title, channel, date, and key points with timestamps. Summarize — don't store the full transcript in the repo.
- If the user wants the lessons applied, map each lesson to a concrete change, make it, and say where it lives.
