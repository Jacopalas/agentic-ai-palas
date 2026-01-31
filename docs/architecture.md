# Architecture

Project structure and design decisions for Agentic AI Palas.

## Overview

Agentic AI Palas is a portable toolkit of skills and scripts for Claude Code. The design prioritizes:

- **Portability**: Install into any project with a single command
- **Non-invasive**: Never overwrites existing configuration
- **Self-contained**: Skills include their own documentation
- **Generic**: Works regardless of project type or language

## Directory Structure

```text
agentic-ai-palas/
├── .claude/                    # ← This gets installed to target projects
│   ├── CLAUDE.md              # Project instructions (template)
│   ├── skills/                # Skill definitions
│   │   ├── commit/
│   │   ├── fixing-markdown/
│   │   ├── initializing-environment/
│   │   ├── removing-notebooklm/
│   │   └── security-scan/
│   ├── scripts/               # Utility scripts
│   └── _tooling/              # Shared tools and configs
├── docs/                       # Documentation (not installed)
├── install/                    # Installation scripts (not installed)
├── .agent/                     # Antigravity Kit (internal, not installed)
└── README.md
```

## What Gets Installed

When you run the installer on a target project:

| Source | Destination | Notes |
|--------|-------------|-------|
| `.claude/skills/` | `.claude/skills/` | All skills copied |
| `.claude/scripts/` | `.claude/scripts/` | All scripts copied |
| `.claude/_tooling/` | `.claude/_tooling/` | Shared tooling copied |
| `.claude/CLAUDE.md` | `.claude/CLAUDE.md` | **Only if missing** |

## What Does NOT Get Installed

| Directory | Reason |
|-----------|--------|
| `.agent/` | Antigravity Kit — optional tooling for Antigravity IDE users |
| `docs/` | Documentation — reference from GitHub |
| `install/` | Installation scripts — one-time use |
| `.git/` | Git history — not needed |

## About `.agent/` Directory

If you use [Antigravity IDE](https://github.com/vudovn/antigravity-kit), you can install Antigravity Kit 2.0:

```bash
# Requires Node.js
npx @vudovn/ag-kit init
```

This creates `.agent/` with 20+ specialist agents and 36+ skills.

**Key points:**

- `.agent/` is **git-ignored** — won't pollute commits
- `.agent/` does **not conflict** with `.claude/` — independent systems
- Not required to use or contribute to this project
- `/fixing-markdown` ignores `.agent/` entirely
- Target projects receive only `.claude/` contents

## Design Decisions

### 1. Skills Are Self-Documenting

Each skill contains its own `SKILL.md` with complete instructions. Claude reads this file when the skill is invoked.

**Why?** No need for a central registry. Adding a skill is just creating a folder.

### 2. CLAUDE.md Is Never Overwritten

The installer creates a minimal `CLAUDE.md` only if one doesn't exist.

**Why?** Projects customize their `CLAUDE.md`. Overwriting would lose customizations.

### 3. No External Dependencies for Installation

Installation uses only bash (Linux/Mac) or PowerShell (Windows).

**Why?** Projects shouldn't need Node.js/Python just to install the toolkit.

### 4. Skills May Require Dependencies

Individual skills (like `fixing-markdown`) may need Node.js or other tools.

**Why?** Keep installation simple. Skills declare their own prerequisites.

### 5. Antigravity Kit Stays Internal

The `.agent/` directory is used during development but not distributed.

**Why?** This repo uses Antigravity for its own development. Target projects don't need it.

## Skill Loading

When you invoke `/skill-name`:

1. Claude searches `.claude/skills/skill-name/SKILL.md`
2. Claude reads the skill definition
3. Claude follows the instructions in the skill
4. Claude executes commands as documented

## Adding New Skills

See [Creating Skills](creating-skills.md) for the complete guide.

Quick checklist:

1. Create `.claude/skills/my-skill/SKILL.md`
2. Follow the standard frontmatter format
3. Document usage, commands, and examples
4. Update `README.md` skills table
5. Run `/fixing-markdown` on the new skill

## Versioning

The toolkit doesn't use semantic versioning. Updates are incremental improvements.

To update an installed toolkit, re-run the installer. It will:

- Overwrite skills with latest versions
- Overwrite scripts with latest versions
- Preserve your custom `CLAUDE.md`
