# The brain — how this system works

Built 2026-11-23 from Duncan Rogoff's method (`brain/sources/2026-11-23-duncan-rogoff-disgustingly-good-with-claude.md`).

## The loop
1. **Claude knows me** — `CLAUDE.md` is a short index. Facts about me are split by topic in `brain/me/`, read only when needed (less bloat = less drift and making things up).
2. **Plan** — every task gets a mode: quick / standard / deep (`brain/rules/planning.md`).
3. **Brief** — big jobs get a 7-part goal prompt (`/goal-prompt`), then Claude runs solo.
4. **Bottle** — when a job comes out right, it becomes a skill (`/wrap-up`).
5. **Iterate** — every correction goes back into the owning file or skill, so I only give a note once (`brain/hindsight.md`).

## Map
```
CLAUDE.md                     index — loaded every session
brain/
  me/                         who I am (one topic per file)
    profile.md                identity + open questions
    communication.md          how to talk to me
    projects.md               what I'm working on
    (voice.md, brand.md)      add when I give samples
  rules/
    facts-not-memory.md       one fact, one home; source tags; privacy
    planning.md               modes, breakdown, 3× checks
  hindsight.md                lessons log, newest first
  sources/                    notes from videos/articles
  goals/                      goal prompts written by /goal-prompt
  inbox/                      drop raw exports from other AIs (not committed)
.claude/skills/
  goal-prompt/                ramble → 7-part brief → autonomous run
  video-transcript/           yt-dlp transcript workflow + scripts
  wrap-up/                    lessons, facts, bottle-to-skill, commit
  ai-sync/                    import from / export to other AIs
```

## Changing things
- Edit any file directly, or just tell Claude ("from now on…", "that's wrong, it's…") — it updates the owning file.
- Add a topic: new file in `brain/me/` or `brain/rules/`, then one line in `CLAUDE.md` pointing to it.
- Add a skill: say "turn this into a skill" after a job works. New skills load in the next session.

## Limits to know
- **Branch:** `CLAUDE.md` and skills only auto-load in sessions on a branch that has them. Merge this to the default branch so every session gets it.
- **Public repo:** keep private facts out (see `brain/rules/facts-not-memory.md`).
- **Per-repo:** this system loads in sessions on this repo. Other repos (e.g. vertigoh-shorts) need a copy of `CLAUDE.md` + `.claude/skills/`, or a pointer — or move the brain to a private repo of its own and add it to sessions.
