# Program

> Entry point for human and AI contributors. Read this first.

## What this project benchmarks

This repo measures **AI coding systems** (codexes) across multiple dimensions: generation time, cost, lines of code, and test pass rate — across multiple programming languages and coding problems.

## Current research question

**Which codex produces the fastest, cheapest, and most correct implementations across languages?**

Active focus areas:
1. Expanding codex coverage (DeepSeek, Qwen, Grok next)
2. Adding new benchmark problems beyond MiniGit
3. Cross-codex comparative analysis

## The iteration loop

Every contribution — human or AI — follows this tight loop:

```
1. READ     → program.md (this file) + plan.md (current goals)
2. WORK     → run experiments, add adapters, fix bugs, add problems
3. MEASURE  → run benchmarks, collect metrics, compare results
4. DOCUMENT → update walkthrough.md (what you did) + plan.md (what's next)
```

### Rules

- **Before starting work**: read `plan.md` to see what's active and what's next
- **After each experiment or code change**: append a dated entry to `walkthrough.md`
- **Before ending your session**: update `plan.md` with next steps and open questions
- **Always**: follow the contributor protocol in `AGENT.md`

## File map (the important ones)

| File | Role | Who edits |
|------|------|-----------|
| `program.md` | This file — current focus + iteration loop | Human |
| `plan.md` | Living iteration plan — active experiments + backlog | Human + Agent |
| `walkthrough.md` | Proof-of-work log — dated entries per iteration | Human + Agent |
| `AGENT.md` | Contributor protocol — rules, conventions, checklists | Human |
| `benchmark.rb` | Benchmark runner — the code the agent extends | Human + Agent |
| `lib/codexes/*.rb` | Codex adapters — the main extension point | Human + Agent |

## Quick links

- Architecture details → [CLAUDE.md](./CLAUDE.md)
- Contributor protocol → [AGENT.md](./AGENT.md)
- Iteration plan → [plan.md](./plan.md)
- Proof-of-work log → [walkthrough.md](./walkthrough.md)
