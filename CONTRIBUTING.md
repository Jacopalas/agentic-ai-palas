# Contributing to Palas

Thanks for wanting to contribute! Palas focuses on **generic tools** and **domain-specific skills** for small and medium businesses.

## Our Focus

Most Claude Code plugins target developers. We're different:

- **Generic tools** — Useful across any project (commits, formatting, security)
- **Domain skills** — Business functions like finance, HR, marketing, sales, legal
- **SMB-friendly** — Practical tools for small teams without dedicated IT

## What We're Looking For

### Generic Tools

Skills that work in any project:

- **Productivity**: Task management, note-taking, documentation
- **Quality**: Formatting, validation, consistency checks
- **Security**: Scanning, auditing, compliance
- **Utilities**: File processing, data transformation

### Domain Skills (High Priority)

We especially welcome skills for business domains:

| Domain | Skill Ideas |
|--------|-------------|
| **Finance** | `/palas:invoice` — Generate/review invoices |
| | `/palas:budget` — Analyze budgets and forecasts |
| | `/palas:expense-report` — Create expense reports |
| **Marketing** | `/palas:seo-review` — Review content for SEO |
| | `/palas:social-post` — Create social media posts |
| | `/palas:newsletter` — Structure email newsletters |
| **HR** | `/palas:job-description` — Write job descriptions |
| | `/palas:onboarding` — Create onboarding checklists |
| | `/palas:policy` — Review/draft internal policies |
| **Sales** | `/palas:proposal` — Structure sales proposals |
| | `/palas:followup` — Write follow-up emails |
| | `/palas:meeting-notes` — Summarize client meetings |
| **Legal** | `/palas:contract-review` — Review basic contracts |
| | `/palas:compliance` — Compliance checklists |
| | `/palas:nda` — Generate simple NDAs |

**Don't see your domain?** We welcome skills for accounting, operations, customer support, project management, and more.

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

```text
skills/
└── your-skill-name/
    └── SKILL.md
```

If your skill needs scripts, add them in a `scripts/` subdirectory.

### 4. Follow the skill format

```markdown
---
name: your-skill-name
description: Brief description. Use when the user wants to [trigger phrases].
---

# /palas:your-skill-name — Title

What this skill does.

## Usage

/palas:your-skill-name [arguments]

**Arguments:**

- `arg1` (Required/Optional): Description

## Behavior

1. Step one
2. Step two
3. Step three

## Examples

/palas:your-skill-name example
-> Expected result

## Notes

- Important considerations
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
- Why it's useful (especially for SMBs)
- How you tested it

---

## Guidelines

### Do

- Keep skills focused on one task
- Write for non-technical users when possible
- Include clear usage instructions
- Test before submitting
- Think about SMB use cases

### Don't

- Include sensitive data (API keys, tokens, personal paths)
- Require expensive paid services
- Assume technical expertise
- Duplicate existing functionality
- Create overly complex workflows

---

## Adding Dependencies

If your skill needs Python or Node.js packages:

1. **Python**: Add to `_tooling/requirements.txt`
2. **Node.js**: Add to `_tooling/package.json`

Include setup instructions in your SKILL.md.

---

## File Naming

- Use lowercase with hyphens: `invoice-review/SKILL.md`
- Be descriptive: `budget-analysis` not `budget`
- Match the directory name to the skill name in frontmatter

---

## Questions?

Open an [issue](https://github.com/Jacopalas/agentic-ai-palas/issues).

---

Thanks for contributing to Palas!
