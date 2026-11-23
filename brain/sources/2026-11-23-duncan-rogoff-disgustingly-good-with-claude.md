# "Give Me 13 Minutes and I'll Make You Disgustingly Good With Claude"

- Channel: Duncan Rogoff (Learn Claude Code) · 12:31 · uploaded 2026-11-15
- Link: https://youtu.be/OUbEeJOxjyw
- Fed to Claude: 2026-11-23. Transcript pulled with yt-dlp (not stored here).

## Key points → where they live in our system
| # | Point (timestamp) | Implemented in |
|---|---|---|
| 1 | Use Claude Code, not chat — it does the work, not just answers (1:03) | Working in Claude Code |
| 2 | Two kinds of instruction: **SOP** (specific path) vs **end goal** (destination). Know which you're giving (1:33) | SOP = skills; end goal = `goal-prompt` |
| 3 | Don't pack everything in one file. `CLAUDE.md` = index/map; separate files per topic (voice, brand, audience, offer, story), read only when needed (2:34) | `CLAUDE.md`, `brain/me/` |
| 4 | Include how you communicate (e.g. voice-to-text → read for meaning) (3:36) | `brain/me/communication.md` |
| 5 | **Notes point to facts, never copy them.** One fact, one place (3:36) | `brain/rules/facts-not-memory.md` |
| 6 | Plan before building; any task with 3+ steps. Plan mode is for the human; "make a plan first" gets most of the benefit. Smaller pieces = better results, fewer tokens (4:06) | `brain/rules/planning.md` |
| 7 | **Goal prompt, 7 parts:** what+why, quality bar, tools + go find more, creative freedom, check 3×, delivery, goal + "work completely autonomously…" (5:38) | `.claude/skills/goal-prompt/` |
| 8 | Ramble for 5–15 min; let Claude organize it into the 7 parts (6:43) | `goal-prompt` Step 1 |
| 9 | Bottle repeat jobs into skills. Description must say **when** to use it, or it never fires. Include the step you always forget (7:47) | `wrap-up` step 3 |
| 10 | Example of the forgotten step: tell it to use **yt-dlp** for YouTube transcripts so it doesn't guess (8:48) | `.claude/skills/video-transcript/` |
| 11 | Best way to make a skill: right after a job finally worked, "turn what we just did into a skill" (9:21) | `wrap-up` step 3 |
| 12 | Skill = folder with `SKILL.md`; restart session to see it (9:21) | `wrap-up` step 3 |
| 13 | Refine and iterate: basic version first, then notes like you'd give a person. Every note goes back into the skill so you give it once (10:23) | `brain/hindsight.md`, `wrap-up` |
| 14 | Big creative jobs (e.g. video editing): define good with references, then break into steps — script → design → storyboard → animation (10:53) | `planning.md` "Breaking work down" |
