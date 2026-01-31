# Agentic AI Palas

A portable toolkit of skills for Claude Code. Install once, use in any project.

## Purpose

This repository contains generic, reusable components for Claude Code that work across any project—regardless of language, framework, or domain. Skills and configurations that we want available everywhere.

**Focus**: Claude Code exclusively. We work within `.claude/` directory.

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/install/install.sh | bash
```

Works on Linux, macOS, and Windows (Git Bash).

See [Installation Guide](docs/installation.md) for manual installation and options.

## Available Skills

| Skill                  | Purpose                                                         |
| ---------------------- | --------------------------------------------------------------- |
| `/commit`              | Create well-structured git commits with conventional format     |
| `/fixing-markdown`     | Validate and fix markdown formatting                            |
| `/security-scan`       | Basic security scanning for exposed secrets and vulnerabilities |
| `/removing-notebooklm` | Remove NotebookLM watermark from PDFs and images                |

## Project Structure

```text
agentic-ai-palas/
├── .claude/                    # ← Gets installed to your projects
│   ├── skills/                 # Skill definitions
│   └── _tooling/               # Shared tools and configs
├── docs/                       # Documentation (not installed)
│   ├── installation.md
│   ├── creating-skills.md
│   └── architecture.md
├── install/
│   └── install.sh              # All platforms (bash)
└── README.md
```

## What Gets Installed

When you run the installer on your project:

| Component           | Installed          | Notes                               |
| ------------------- | ------------------ | ----------------------------------- |
| `.claude/skills/`   | ✅ Yes             | All skills                          |
| `.claude/_tooling/` | ✅ Yes             | Shared tooling                      |
| `.claude/CLAUDE.md` | ✅ Only if missing | Won't overwrite your customizations |

## Documentation

| Document                                   | Description                    |
| ------------------------------------------ | ------------------------------ |
| [Installation](docs/installation.md)       | Install, update, and uninstall |
| [Creating Skills](docs/creating-skills.md) | How to create new skills       |
| [Architecture](docs/architecture.md)       | Project structure and design   |

## Contributing

1. Create skill in `.claude/skills/my-skill/SKILL.md`
2. Follow the [skill format](docs/creating-skills.md)
3. Update this README's skills table
4. Run `/fixing-markdown` on new files
5. Submit pull request

## About Antigravity IDE

If you use [Antigravity IDE](https://github.com/vudovn/antigravity-kit), you can install [Antigravity Kit 2.0](https://antigravity-kit.vercel.app/) to get additional agents and skills:

```bash
# Requires Node.js
npx @vudovn/ag-kit init
```

This creates a `.agent/` directory with 20+ specialist agents and 36+ skills. See the [official repository](https://github.com/vudovn/antigravity-kit) for documentation.

**Important notes:**

- `.agent/` is **git-ignored** — it won't pollute your commits
- `.agent/` does **not conflict** with `.claude/` — they are independent systems
- **Not required** — you don't need Antigravity IDE to use this project
- `/fixing-markdown` is configured to ignore `.agent/` entirely
