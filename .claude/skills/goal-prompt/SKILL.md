---
name: goal-prompt
description: Turn a rough brief or a long ramble into a 7-part goal prompt, then execute it autonomously in deep mode. Use when the user says "/goal", "deep mode", "goal prompt", rambles about what they want built, or gives a big, fuzzy, creative or multi-part task (a website, a video, a content system, a launch) where a one-line prompt would come back generic.
---

# Goal prompt

Point of this skill: get out of the model's way. A clear goal + a vivid quality bar + freedom beats a one-line prompt every time.

## Step 1 — Gather (don't interrogate)
- Pull everything from the user's message/ramble, plus `brain/me/profile.md`, `brain/me/projects.md`, and any voice/brand files that exist in `brain/me/`.
- If a part is missing, fill it with a sensible default and mark it `(assumed)`. Ask **only** if a missing piece would make the whole result wrong — and ask everything in one batch.

## Step 2 — Write the goal prompt (all 7 parts)
Write it to a file: `brain/goals/YYYY-MM-DD-<slug>.md` (create the folder if needed). Use this template:

```markdown
# Goal: <name>

## 1. What I want and why
<The real thing needed, the real number/outcome, and why it matters.>

## 2. Quality bar
<What excellent looks like, in vivid, specific words. References/links. What would make it feel generic — avoid that.>

## 3. Tools
<Tools, files, accounts, skills that already exist.> Then: go find more — search for better tools, libraries, references or methods and use them if they raise the quality.

## 4. Creative freedom
You may change the plan and make the calls. <Any hard limits: budget, brand rules, must-keeps.>

## 5. Check your work (3×)
1. Does it work? (run/open/test it)
2. Does it meet the quality bar above? (compare honestly)
3. Is it clean and complete? (nothing half-done, nothing private in public files)
Fix what each pass finds before the next.

## 6. Delivery
<Where the finished thing goes (repo path, branch, artifact, Drive) and what link/file comes back.>

## 7. Goal + go
<One sentence restating the goal.> Work completely autonomously and do not ask me for anything until you're all done.
```

## Step 3 — Show, then run
- Show the user the 7 parts in a compact form (≤15 lines). Unless they said "just write the prompt", start executing immediately — don't wait for approval.
- Execute per `brain/rules/planning.md` (Deep mode): task list, one piece at a time, each piece checked.

## Step 4 — Finish
- Final report: what was delivered (link/path), what each of the 3 checks found, what's not verified, and one honest line on what would make it better next round.
- Then run the `wrap-up` skill.
