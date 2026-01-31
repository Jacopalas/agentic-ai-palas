# Agentic AI Palas

Portable toolkit of skills and scripts for Claude Code.

## Purpose

This repository provides generic, reusable components for Claude Code that work in any project. We focus exclusively on `.claude/` directory—skills, scripts, and configurations.

## Available Skills

| Skill | Purpose |
|-------|---------|
| `/commit` | Create well-structured git commits with conventional format |
| `/fixing-markdown` | Validate and fix markdown formatting |
| `/security-scan` | Basic security scanning for exposed secrets |
| `/removing-notebooklm` | Remove NotebookLM watermark from PDFs and images |

## Project Structure

```text
.claude/
├── skills/                 # Skill definitions (SKILL.md format)
│   ├── commit/
│   ├── fixing-markdown/
│   ├── initializing-environment/
│   ├── removing-notebooklm/
│   └── security-scan/
├── scripts/                # Utility scripts
└── _tooling/               # Shared tools and configs
```

## Creating New Skills

1. Create directory: `.claude/skills/my-skill/`
2. Add `SKILL.md` with frontmatter and instructions
3. Follow format in [docs/creating-skills.md](../docs/creating-skills.md)
4. Update [README.md](../README.md) skills table
5. Run `/fixing-markdown .claude/skills/my-skill/SKILL.md`

## Documentation Quality

After creating or updating markdown files, validate formatting:

```text
/fixing-markdown <file-or-folder>
```

## Internal Development

This repo uses [Antigravity Kit](https://github.com/vudovn/antigravity-kit) (`.agent/` directory) for development. The `.agent/` directory is **not distributed** to target projects.

## Installation Scripts

The `install/` directory contains installation scripts:

- `install.sh` — Linux/macOS
- `install.ps1` — Windows PowerShell

These scripts copy `.claude/skills/`, `.claude/scripts/`, and `.claude/_tooling/` to target projects. They create a minimal `CLAUDE.md` only if one doesn't exist.
