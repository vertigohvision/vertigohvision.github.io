# Rule: facts, not memory

The most important rule in this system. If the same fact lives in five notes, one goes stale, and Claude confidently uses the wrong one.

## 1. One fact, one home
- Each fact has exactly one owner file. Everywhere else **points** to it (`see brain/me/profile.md`), never copies it.
- Before adding a fact, grep `brain/` for it. If it exists, update it there.
- The 7-part goal prompt lives only in `.claude/skills/goal-prompt/SKILL.md`. The yt-dlp command lives only in `.claude/skills/video-transcript/`. Same idea everywhere.

## 2. Tag every fact with where it came from
| Tag | Meaning | Can Claude act on it? |
|---|---|---|
| `[said YYYY-MM-DD]` | I told you directly | Yes |
| `[seen YYYY-MM-DD: where]` | Verified in a file, repo, tool output | Yes |
| `[from <AI> YYYY-MM-DD]` | Imported from another AI's memory | Yes, but flag if it matters and is old |
| `[inferred YYYY-MM-DD]` | Claude's guess | Only after saying "assuming X" |

Unknowns go under **Open questions**, never filled with a plausible guess.

## 3. Memory is not a source
- Don't answer "who I am / what I want / what we did" from conversation memory or training. Read the owner file.
- If a file and the conversation disagree, the newer explicit statement from me wins — then fix the file.
- If a fact is older than ~6 months and the task hinges on it, say so.

## 4. Keep it lean
- No bloat. A file only Claude rarely needs stays out of CLAUDE.md; CLAUDE.md just points to it.
- When a file passes ~150 lines, split it by topic and update the index.

## Privacy
This repo is **public on GitHub**. Never write here: email, phone, address, finances, health, passwords/keys, client names under NDA, or anything I'd mind a stranger reading. If I share something like that and it needs to persist, tell me and suggest a private home (a private repo is the clean option).
