# Installation

Install Agentic AI Palas skills into any project.

## Requirements

- Git
- Bash (Linux, macOS, or Git Bash on Windows)

> Windows Users: Install [Git for Windows](https://git-scm.com/download/win) which includes **Git Bash**. Run the install command from *Git Bash*, not PowerShell or CMD.

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/install/install.sh | bash
```

Works on Linux, macOS, and Windows (via Git Bash).

## What Gets Installed

The installer copies these directories to your project:

```text
your-project/
└── .claude/
    ├── CLAUDE.md          # Created only if missing (minimal template)
    ├── skills/            # All available skills
    │   ├── commit/
    │   ├── fixing-markdown/
    │   ├── initializing-environment/
    │   ├── removing-notebooklm/
    │   └── security-scan/
    └── _tooling/          # Shared tooling (Node.js packages, configs)
```

## What Does NOT Get Installed

- `.agent/` directory (Antigravity Kit) — internal use only
- `docs/` directory — documentation stays in the source repo
- `install/` directory — installation scripts

## Post-Installation

1. Review `.claude/CLAUDE.md` and customize for your project
2. Test a skill: `/fixing-markdown README.md`
3. Some skills require Node.js — they will prompt you if needed

## Updating

Re-run the installer to update skills. Your custom `CLAUDE.md` will NOT be overwritten.

```bash
curl -fsSL https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/install/install.sh | bash
```

## Uninstalling

Remove the installed directories:

```bash
rm -rf .claude/skills .claude/_tooling
```

Keep `.claude/CLAUDE.md` if you've customized it.
