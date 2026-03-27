# Walkthrough

> Accumulated proof-of-work log. Each iteration appends a dated entry.
> See [AGENT.md](./AGENT.md) for entry template and update protocol.

---

## 2026-03-28 — Documentation infrastructure setup

**Contributor**: AI agent (Antigravity)
**What was done**: Deep codebase review + created autoresearch-inspired documentation loop. Added `program.md` (agent entry point), `AGENT.md` (contributor protocol), `plan.md` (living iteration plan), `walkthrough.md` (this file). Updated CLAUDE.md, README.md, INDEX.md, ROADMAP.md for coherence.

**Observations**:
- Codebase has 6 codex adapters (claude, gemini, openai, groq, aider + base) but ROADMAP.md was missing Groq/Aider status
- README.md had a broken markdown code block in Installation section (unclosed backtick)
- No iterative contribution mechanism existed — contributors had no way to track what was tried, what worked, what's next
- Karpathy's `program.md` pattern (single entry-point skill file) maps well to this project's multi-contributor model

**Decisions made**:
- `program.md` is the universal entry point (human reads it, agent reads it)
- `AGENT.md` mandates documentation updates — this is the enforcement mechanism
- `plan.md` replaces informal TODO tracking with structured experiment tracking
- `walkthrough.md` provides institutional memory across sessions
- CLAUDE.md remains as technical internals doc but now points to AGENT.md for contribution protocol

**Next**: Validate Groq and Aider adapters with real benchmark runs (plan.md items #1, #2)
