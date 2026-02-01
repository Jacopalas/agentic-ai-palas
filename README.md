# Palas — Claude Code Plugin

![Agentic AI Palas Overview](./infographic.svg)

**Portable toolkit of skills for Claude Code.**

A plugin that provides reusable skills for git commits, markdown linting, security scanning, and watermark removal. Works in any project.

## Installation

### From Marketplace (Recommended)

```shell
# Add the marketplace (one time)
/plugin marketplace add Jacopalas/palas-marketplace

# Install the plugin
/plugin install palas@palas
```

### Direct Installation

```shell
# Clone and load directly
git clone https://github.com/Jacopalas/agentic-ai-palas.git
claude --plugin-dir ./agentic-ai-palas
```

## Available Skills

| Skill | Command | Description |
|-------|---------|-------------|
| Commit | `/palas:commit` | Create well-formatted conventional git commits |
| Markdown | `/palas:fixing-markdown` | Validate and auto-fix markdown formatting |
| Security | `/palas:security-scan` | Scan for exposed secrets and vulnerabilities |
| Watermark | `/palas:removing-notebooklm` | Remove NotebookLM watermarks from PDFs/images |

## Usage Examples

```text
/palas:commit
-> Analyzes staged changes and creates a conventional commit

/palas:fixing-markdown docs/
-> Fixes markdown formatting in all files under docs/

/palas:security-scan
-> Scans current directory for exposed secrets

/palas:removing-notebooklm presentation.pdf
-> Removes watermark, creates presentation_clean.pdf
```

## Requirements

- **Claude Code** v1.0.33 or later
- **Node.js** (for markdown linting) — installed on first use
- **Python 3** (for watermark removal) — installed on first use

Dependencies are installed automatically in isolated environments within the plugin directory. No pollution of your project or system.

## Plugin Structure

```text
agentic-ai-palas/
├── .claude-plugin/
│   └── plugin.json        # Plugin manifest
├── skills/
│   ├── commit/            # Git commit skill
│   ├── fixing-markdown/   # Markdown linting skill
│   ├── security-scan/     # Security scanning skill
│   └── removing-notebooklm/
│       ├── SKILL.md
│       └── scripts/       # Python watermark removal
└── _tooling/
    ├── package.json       # Node.js dependencies
    ├── requirements.txt   # Python dependencies
    └── configs...         # Linting configurations
```

## Optional for new users

If you don't have a `.claude/CLAUDE.md` in your project yet, run this one-liner to create a minimal setup:

```bash
curl -fsSL https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/starter/minimal-install.sh | bash
```

This creates a `.claude/CLAUDE.md` with plugin installation instructions and a section for your project-specific notes.

**Windows users**: Run from Git Bash, not PowerShell or CMD.

## Contributing

Want to add a skill? See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

Quick start:

1. Fork this repository, create a branch
2. Create `skills/your-skill/SKILL.md`
3. Test with `claude --plugin-dir .`
4. Submit a pull request

## Marketplace

This plugin is distributed via the [palas-marketplace](https://github.com/Jacopalas/palas-marketplace) repository.

## License

MIT
