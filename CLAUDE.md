# CLAUDE.md — index

This file is a map, not a manual. Read the linked file only when the task needs it.

## Always on (every session)
- **How to talk to me:** `brain/me/communication.md` — short, honest, coach + friend.
- **Facts, not memory:** `brain/rules/facts-not-memory.md` — every fact lives in one file; point to it, never copy it. If you don't have a fact, say so; don't fill the gap.
- **Plan before building:** `brain/rules/planning.md` — 3+ steps = plan first. Pick a mode: quick / standard / deep.
- **Learn as we go:** when I correct you or state a preference, update the one file that owns that fact in the same turn, and log it in `brain/hindsight.md`.
- **This repo is PUBLIC.** No email, phone, money, health, passwords or anything private goes in here. See "Privacy" in `brain/rules/facts-not-memory.md`.
- **Containers are wiped.** Commit and push brain changes before the session ends.

## Who I am (read when writing as me, or making choices for me)
- `brain/me/profile.md` — confirmed facts + open questions.
- `brain/me/projects.md` — what I'm working on.

## Skills (`.claude/skills/`) — type `/name` or let them trigger
| Skill | Use when |
|---|---|
| `goal-prompt` | Big or fuzzy task, or I "ramble" a brief → 7-part goal prompt, then run it solo. |
| `video-transcript` | I send any YouTube/video link. Uses yt-dlp. Never guess at other routes. |
| `wrap-up` | End of a task/session, or "wrap up" → log lessons, update facts, offer to bottle into a skill, commit. |
| `ai-sync` | I paste/drop context from another AI (ChatGPT, Gemini, etc.), or want a context pack to give one. |

## Where things live
- `brain/README.md` — how this system works and how to change it.
- `brain/hindsight.md` — lessons log (what went wrong, what to do next time).
- `brain/sources/` — notes from videos/articles I've fed you, with links.
- `brain/inbox/` — drop zone for raw exports from other AIs. Process with `ai-sync`.
