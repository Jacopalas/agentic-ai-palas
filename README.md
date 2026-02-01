# Palas — Claude Code Plugin

![Agentic AI Palas Overview](./infographic.svg)

**AI skills for your business, not just your code.**

A Claude Code plugin focused on **generic tools** and **domain-specific skills** for small and medium businesses. While most plugins target developers, Palas helps everyone—from operations to finance to marketing.

## Why Palas?

Most Claude Code plugins focus on software development. Palas is different:

- **Generic tools** that work in any project (commits, markdown, security)
- **Domain skills** for business functions (finance, HR, marketing, sales)
- **SMB-friendly** — practical tools for small teams without dedicated IT

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

### Generic Tools

| Skill | Command | Description |
|-------|---------|-------------|
| Commit | `/palas:commit` | Create well-formatted conventional git commits |
| Markdown | `/palas:fixing-markdown` | Validate and auto-fix markdown formatting |
| Security | `/palas:security-scan` | Scan for exposed secrets and vulnerabilities |
| Watermark | `/palas:removing-notebooklm` | Remove NotebookLM watermarks from PDFs/images |

### Domain Skills (Roadmap)

We're building skills for business domains:

| Domain | Examples |
|--------|----------|
| **Finance** | Invoice review, budget analysis, expense reports |
| **Marketing** | SEO content review, social posts, newsletters |
| **HR** | Job descriptions, onboarding checklists, policies |
| **Sales** | Proposals, follow-up emails, meeting notes |
| **Legal** | Contract review, compliance checklists, NDAs |

Want to contribute a domain skill? See [CONTRIBUTING.md](CONTRIBUTING.md).

## Usage Examples

```text
/palas:commit
-> Analyzes staged changes and creates a conventional commit

/palas:fixing-markdown docs/
-> Fixes markdown formatting in all files under docs/

/palas:security-scan
-> Scans current directory for exposed secrets
```

## Requirements

- **Claude Code** v1.0.33 or later
- **Node.js** (for markdown linting) — installed on first use
- **Python 3** (for watermark removal) — installed on first use

Dependencies are installed automatically in isolated environments. No pollution of your project or system.

## Optional for new users

If you don't have a `.claude/CLAUDE.md` in your project yet:

```bash
curl -fsSL https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/starter/minimal-install.sh | bash
```

**Windows users**: Run from Git Bash, not PowerShell or CMD.

## Contributing

We welcome contributions, especially:

- **Generic tools** you use daily across projects
- **Domain skills** for business functions (finance, HR, marketing, legal, sales)
- **SMB workflows** that help small teams work smarter

This project intentionally avoids competing with developer-focused plugins. Our niche is **business users** and **domain experts** who use Claude Code.

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines and skill ideas.

## Marketplace

This plugin is distributed via the [palas-marketplace](https://github.com/Jacopalas/palas-marketplace) repository.

## License

MIT
