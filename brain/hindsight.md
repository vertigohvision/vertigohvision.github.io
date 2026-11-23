# Hindsight log

Newest first. One entry per real lesson. Format and rules: `.claude/skills/wrap-up/SKILL.md`.

## 2026-11-23 — Pulling a YouTube transcript from a cloud session
- What happened: yt-dlp first hit the environment's network block, then YouTube's bot check, then a 429 on the auto-translated English track.
- Lesson: YouTube hosts must be allowed in the environment; use the `web_embedded` client with `--ignore-no-formats-error`; ask for `en-orig` captions first. Don't use browser impersonation or cookie workarounds.
- Applied to: `.claude/skills/video-transcript/` (script + error table); Default environment allowed hosts.

## 2026-11-23 — Building the system
- What happened: asked to learn "who I am" but had only one message, no Drive access (needed re-sign-in), and no access to the vertigoh-shorts repo.
- Lesson: when inputs are thin, write what's confirmed and list open questions — don't pad the profile with guesses.
- Applied to: `brain/me/profile.md` (Open questions), `brain/rules/facts-not-memory.md`.
