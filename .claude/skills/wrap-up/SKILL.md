---
name: wrap-up
description: Close out a task or session so the system learns. Logs lessons to the hindsight log, updates the owning fact files, offers to bottle a working process into a skill, and commits/pushes. Use when the user says "wrap up", "we're done", "save this", "remember this", "turn this into a skill", or at the end of any multi-step task (the goal-prompt skill calls it automatically).
---

# Wrap-up

The move that makes every other move keep getting better: every note given once goes back into the system, so it never has to be given twice.

## 1. Lessons → `brain/hindsight.md`
Add an entry at the top (newest first) only if something was actually learned:
```
## YYYY-MM-DD — <task>
- What happened: <one line>
- Lesson: <one line, phrased as a rule for next time>
- Applied to: <file/skill updated, or "not yet">
```
No entry for routine work. Corrections from the user always count.

## 2. Facts → their one owner file
- New preference/fact about the user → `brain/me/communication.md`, `profile.md`, or `projects.md` (tagged, see `brain/rules/facts-not-memory.md`).
- Grep first; update in place, don't duplicate. Answered an Open question? Move it to Confirmed.
- Nothing private (public repo).

## 3. Bottle it?
If this job (a) finally came out right after iteration, or (b) is likely to repeat the same way, offer in one line: "Want me to turn this into a `/<name>` skill?" If yes (or the user already asked):
- Create `.claude/skills/<name>/SKILL.md` (a folder with SKILL.md inside — a loose file won't load).
- Frontmatter `description`: what it does **and when to use it** — trigger phrases. Skip this and the skill never fires.
- Body: the steps in the order that worked, **including the step that was forgotten or fixed along the way** (usually the most important line), and what "done" looks like.
- Add a row to the Skills table in `CLAUDE.md`. Note: new skills show up after a new session.
- If an existing skill was used and a fix was found, update that skill instead.

## 4. Save
- `git add CLAUDE.md brain .claude && git commit` with a short message, then push to the session's branch. Containers are wiped; unpushed = lost.

## 5. Report (≤4 lines)
What got logged, what files changed, any skill created, and what's still open.
