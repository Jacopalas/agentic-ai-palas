# Architecture

Project structure and design decisions for Agentic AI Palas.

## Directory Structure

```text
agentic-ai-palas/
├── .claude/                   # ← Gets installed to target projects
│   ├── CLAUDE.md              # Project instructions (template)
│   ├── skills/                # Skill definitions
│   └── _tooling/              # Shared tools and configs
├── docs/                      # Documentation (not installed)
├── install/                   # Installation scripts (not installed)
└── README.md
```

## Design Decisions

### Skills Are Self-Documenting

Each skill contains its own `SKILL.md`. Claude reads this file when the skill is invoked. No central registry needed.

### CLAUDE.md Is Never Overwritten

The installer creates `CLAUDE.md` only if missing. Your customizations are preserved.

### No External Dependencies for Installation

Installation uses only bash. Skills may require Node.js or Python, but the installer doesn't.

## Skill Loading

When you invoke `/skill-name`:

1. Claude searches `.claude/skills/skill-name/SKILL.md`
2. Claude reads and follows the instructions
3. Claude executes commands as documented

## Updating

Re-run the installer. It overwrites skills but preserves your `CLAUDE.md`.
