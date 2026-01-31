# Agentic AI Palas

A portable toolkit of skills and scripts for Claude Code. Install once, use in any project.

## Purpose

This repository contains generic, reusable components for Claude Code that work across any project—regardless of language, framework, or domain. Skills, scripts, and configurations that we want available everywhere.

**Focus**: Claude Code exclusively. We work within `.claude/` directory.

## Quick Install

### Linux / macOS

```bash
curl -fsSL https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/install/install.sh | bash
```

### Windows (PowerShell)

```powershell
irm https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/install/install.ps1 | iex
```

See [Installation Guide](docs/installation.md) for manual installation and options.

## Available Skills

| Skill | Purpose |
|-------|---------|
| `/commit` | Create well-structured git commits with conventional format |
| `/fixing-markdown` | Validate and fix markdown formatting |
| `/security-scan` | Basic security scanning for exposed secrets and vulnerabilities |
| `/removing-notebooklm` | Remove NotebookLM watermark from PDFs and images |

## Project Structure

```text
agentic-ai-palas/
├── .claude/                    # ← Gets installed to your projects
│   ├── skills/                 # Skill definitions
│   ├── scripts/                # Utility scripts
│   └── _tooling/               # Shared tools and configs
├── docs/                       # Documentation (not installed)
│   ├── installation.md
│   ├── creating-skills.md
│   └── architecture.md
├── install/                    # Installation scripts
│   ├── install.sh              # Linux/macOS
│   └── install.ps1             # Windows
└── README.md
```

## What Gets Installed

When you run the installer on your project:

| Component | Installed | Notes |
|-----------|-----------|-------|
| `.claude/skills/` | ✅ Yes | All skills |
| `.claude/scripts/` | ✅ Yes | Utility scripts |
| `.claude/_tooling/` | ✅ Yes | Shared tooling |
| `.claude/CLAUDE.md` | ✅ Only if missing | Won't overwrite your customizations |

## Documentation

| Document | Description |
|----------|-------------|
| [Installation](docs/installation.md) | Install, update, and uninstall |
| [Creating Skills](docs/creating-skills.md) | How to create new skills |
| [Architecture](docs/architecture.md) | Project structure and design |

## Contributing

1. Create skill in `.claude/skills/my-skill/SKILL.md`
2. Follow the [skill format](docs/creating-skills.md)
3. Update this README's skills table
4. Run `/fixing-markdown` on new files
5. Submit pull request

## Internal Note

This repository uses [Antigravity Kit](https://github.com/vudovn/antigravity-kit) (`.agent/` directory) for its own development. The `.agent/` directory is **not** installed to target projects—it's for internal use only.
