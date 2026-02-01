# Contributing to Palas

Thanks for wanting to contribute! This plugin provides portable skills for Claude Code users.

## What We're Looking For

### Skills

Reusable skills that work across any project:

- **Developer workflows**: Git operations, code review, refactoring
- **Documentation**: Markdown, API docs, READMEs
- **Quality**: Linting, formatting, testing helpers
- **Security**: Scanning, auditing, compliance checks
- **Utilities**: File processing, data transformation, automation

Good skills are:

- **Generic**: Work in any project, not tied to specific frameworks
- **Self-contained**: Include all instructions Claude needs
- **Portable**: Don't require project-specific setup

---

## How to Contribute

### 1. Fork and clone

```bash
git clone https://github.com/YOUR_USERNAME/agentic-ai-palas.git
cd agentic-ai-palas
```

### 2. Create a branch

```bash
git checkout -b add-your-skill-name
```

### 3. Add your skill

Create a directory in `skills/` with a `SKILL.md` file:

```
skills/
└── your-skill-name/
    └── SKILL.md
```

If your skill needs scripts, add them in a `scripts/` subdirectory:

```
skills/
└── your-skill-name/
    ├── SKILL.md
    └── scripts/
        └── your-script.py
```

### 4. Follow the skill format

```markdown
---
name: your-skill-name
description: Brief description. Use when the user wants to [trigger phrases].
---

# /palas:your-skill-name — Title

What this skill does.

## Usage

```text
/palas:your-skill-name [arguments]
```

**Arguments:**

- `arg1` (Required/Optional): Description

## Behavior

1. Step one
2. Step two
3. Step three

## Commands

```bash
# Commands Claude should run
your-command here
```

## Examples

```text
/palas:your-skill-name example
-> Expected result
```

## Notes

- Important considerations
- Edge cases
```

### 5. Test your skill

```bash
claude --plugin-dir .
```

Then try `/palas:your-skill-name` to verify it works.

### 6. Submit a PR

```bash
git add .
git commit -m "feat: add your-skill-name skill"
git push origin add-your-skill-name
```

Open a PR with:

- What the skill does
- Why it's useful
- How you tested it

---

## Guidelines

### Do

- Keep skills focused on one task
- Include clear usage instructions
- Test before submitting
- Follow existing patterns in other skills
- Document any system requirements (Python, Node.js, etc.)

### Don't

- Include sensitive data (API keys, tokens, personal paths)
- Create skills that only work in specific projects
- Submit untested skills
- Duplicate existing functionality
- Require paid services without alternatives

---

## Adding Dependencies

If your skill needs Python or Node.js packages:

1. **Python**: Add to `_tooling/requirements.txt`
2. **Node.js**: Add to `_tooling/package.json`

Include setup instructions in your SKILL.md that reference the plugin's `_tooling/` directory.

---

## File Naming

- Use lowercase with hyphens: `code-review/SKILL.md`
- Be descriptive: `tdd-workflow` not `workflow`
- Match the directory name to the skill name in frontmatter

---

## Questions?

Open an [issue](https://github.com/Jacopalas/agentic-ai-palas/issues).

---

Thanks for contributing!
