# Agentic AI Palas

Reusable components for AI-powered projects.

## Components

| Component | Location | Purpose |
|-----------|----------|---------|
| **Skills** | `.claude/skills` | Custom Claude Code commands |
| **Scripts** | `.claude/scripts` | Utility automation |

## Available Skills

| Skill | Purpose |
|-------|---------|
| `/fixing-markdown` | Validate and fix markdown formatting using markdownlint-cli2 and prettier |
| `/removing-notebooklm` | Remove NotebookLM watermark from PDFs and images |

See [skills directory](./skills/) for full documentation.

## Quick Start

1. Navigate to the component directory
2. Follow the component's README for setup
3. Integrate into your project

**Requirements**:
- Follow component-specific structure
- Include documentation with examples
- Write in English
- Keep components modular and reusable

## Documentation Quality

**After creating or updating ANY markdown file**, validate and fix formatting:

```bash
/fixing-markdown <file-or-folder>
```

**Examples:**
```bash
/fixing-markdown README.md
/fixing-markdown .claude/CLAUDE.md
/fixing-markdown .
```

Use `/fixing-markdown` on:
- ✅ README.md (after any update)
- ✅ CLAUDE.md (after any update)
- ✅ Component README files
- ✅ SKILL.md files
- ✅ Any other markdown documentation

This ensures consistent formatting, proper spacing, and adherence to markdown standards.

---

## Contributing

### Before Adding a New Skill or Agent

1. Create component following structure in respective README:
   - Skills: See [`skills/README.md`](../skills/README.md#creating-a-new-skill)
   - Agents: See [`agents/README.md`](../agents/README.md#creating-a-new-agent)

2. **After creation, update [`../README.md`](../README.md)**
   - Add entry to "Skills" or "Agents" table in the "What's Available" section
   - Include name, purpose, and location link

3. **Run markdown validation** (see "Documentation Quality" section above)
   ```bash
   /fixing-markdown README.md
   ```

**This keeps the project overview accurate and formatting consistent for all collaborators.**