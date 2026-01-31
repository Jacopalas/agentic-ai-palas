# Installation

Install Agentic AI Palas skills and scripts into any project.

## Requirements

- Git (to clone or download)
- Bash (Linux/Mac) or PowerShell (Windows)

## Quick Install

### Linux / macOS

```bash
curl -fsSL https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/install/install.sh | bash
```

Or download and run manually:

```bash
git clone https://github.com/Jacopalas/agentic-ai-palas.git /tmp/agentic-ai-palas
bash /tmp/agentic-ai-palas/install/install.sh
rm -rf /tmp/agentic-ai-palas
```

### Windows (PowerShell)

```powershell
irm https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/install/install.ps1 | iex
```

Or download and run manually:

```powershell
git clone https://github.com/Jacopalas/agentic-ai-palas.git $env:TEMP\agentic-ai-palas
& $env:TEMP\agentic-ai-palas\install\install.ps1
Remove-Item -Recurse -Force $env:TEMP\agentic-ai-palas
```

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
    ├── scripts/           # Utility scripts
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
# Linux/Mac
curl -fsSL https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/install/install.sh | bash

# Windows
irm https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/install/install.ps1 | iex
```

## Uninstalling

Remove the installed directories:

```bash
rm -rf .claude/skills .claude/scripts .claude/_tooling
```

Keep `.claude/CLAUDE.md` if you've customized it.
