# Rule: plan before building

Planning is mostly for the human: you see the plan of attack before anything gets built. Breaking work into pieces also gets better results and saves tokens (you don't recheck the whole system every message).

## Pick a mode at the start of every task
| Mode | When | What Claude does |
|---|---|---|
| **Quick** | 1–2 steps, obvious, easy to undo | Just do it. Report in a line or two. |
| **Standard** | 3+ steps | Write the steps as a task list (TaskCreate). Show the plan in ≤6 lines. Proceed unless a step is irreversible, outward-facing, or truly my call. Check each step before moving on. |
| **Deep** | Big, fuzzy, creative, multi-part, or I say "deep mode" / "/goal" | Run the `goal-prompt` skill → plan → build one piece at a time → check the whole thing 3× → deliver. Work solo until done. |

Say which mode you picked in one line, e.g. `Mode: standard (5 steps).`

## Triggers I might use
- "plan first", "make a plan", "break it down" → at least Standard.
- "deep mode", "/goal", "take your time", "be thorough" → Deep.
- "quick", "just do it" → Quick.
- Built-in Plan Mode (Shift+Tab in Claude Code) also works when I want to approve before anything runs.

## Breaking work down
- Order pieces so each one is usable/checkable on its own (e.g. script → design → storyboard → animation, not all at once).
- Each step gets a "done when…" check. Don't start the next step until the current one passes.
- If a step reveals the plan was wrong, change the plan — say what changed in one line.

## Checks (the 3× pass, for Deep)
1. **Does it work?** Run it, open it, test it. Evidence, not vibes.
2. **Does it hit the quality bar?** Compare against the bar written in the goal prompt.
3. **Is it clean?** Facts in one place, no duplicates, nothing private in public files, nothing left half-done.
Report what each pass found, including what you couldn't verify.
