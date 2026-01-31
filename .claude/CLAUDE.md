# Agentic AI Palas

Portable toolkit of skills for Claude Code.

## Purpose

This repository provides generic, reusable components for Claude Code that work in any project. We focus exclusively on `.claude/` directory—skills and configurations.

## Operating Principles

Be pragmatic. Be reliable. Self-anneal.

- **Check skills first**: Before doing manual work, verify if an existing skill can handle the task
- **Self-improvement**: When a skill fails or produces unexpected results, update the SKILL.md with the edge case or fix
- **Zero entropy**: Never create folders or files outside the defined structure
- **Living documentation**: Skills are living documents—update them as better approaches or constraints are discovered

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
└── _tooling/               # Shared tools and configs
```

## Documentation Quality

After creating or updating markdown files, validate formatting:

```text
/fixing-markdown <file-or-folder>
```

## Exclusions

The `.agent/` directory (if present) is git-ignored and must be excluded from all operations including `/fixing-markdown`.
