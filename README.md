# Agentic AI Palas

**Stop configuring Claude Code from scratch on every project.**

One command. Instant skills. Works everywhere.

```bash
curl -fsSL https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/install/install.sh | bash
```

- Windows Users: Install [Git for Windows](https://git-scm.com/download/win) which includes **Git Bash**. Run the install command from *Git Bash*, not PowerShell or CMD.
- **Updating?** Run the same command. Your custom `CLAUDE.md` stays untouched.

## The Problem

Every time you start a new project with Claude Code, you're back to zero. No commit conventions. No markdown validation. No security checks. You either spend time setting things up again, or you just don't bother.

If you work on multiple projects—or juggle client work across different repos—this friction adds up fast.

## The Solution

Agentic AI Palas gives you a portable set of skills that install in seconds and work in any project. Python, JavaScript, Rust, Go—doesn't matter. These are generic tools that help you work faster with Claude Code.

**Perfect for:**

- Developers starting with Claude Code who want useful defaults
- Freelancers and consultants managing multiple client projects
- Teams who want consistent Claude behavior across repositories

## What You Get

| Skill | What it does |
|-------|--------------|
| `/commit` | Consistent, well-formatted git commits every time |
| `/fixing-markdown` | Catches and fixes markdown formatting issues |
| `/security-scan` | Finds exposed secrets before they hit your repo |
| `/removing-notebooklm` | Strips NotebookLM watermarks from PDFs and images |

Just type the skill name in Claude Code:

```text
/commit
/fixing-markdown docs/
/security-scan
```

## What Gets Installed

```text
your-project/
└── .claude/
    ├── skills/      # All the skills above
    ├── _tooling/    # Shared configs and tools
    └── CLAUDE.md    # Project instructions (only if missing)
```

Nothing outside `.claude/`. Your project structure stays clean.

## Documentation

| Guide | Description |
|-------|-------------|
| [Creating Skills](docs/creating-skills.md) | Build your own skills |
| [Architecture](docs/architecture.md) | How it all fits together |

## Contributing

Have a skill that could help everyone?

1. Create `.claude/skills/your-skill/SKILL.md`
2. Follow the [skill format](docs/creating-skills.md)
3. Update the skills table above
4. Submit a pull request

## Extras: Antigravity Kit

If you use [Antigravity IDE](https://antigravity.google/) with both Claude and Gemini accounts, you can extend your setup with [Antigravity Kit 2.0](https://antigravity-kit.vercel.app/):

```bash
npx @vudovn/ag-kit init
```

This adds 20+ agents and 36+ skills in a separate `.agent/` directory. Completely optional and doesn't conflict with this toolkit.
