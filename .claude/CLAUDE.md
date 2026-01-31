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

## Contributing

### Before Adding a New Skill or Agent

1. Create component following structure in respective README:
   - Skills: See [`skills/README.md`](../skills/README.md#creating-a-new-skill)
   - Agents: See [`agents/README.md`](../agents/README.md#creating-a-new-agent)

2. **After creation, update [`../README.md`](../README.md)**
   - Add entry to "Skills" or "Agents" table in the "What's Available" section
   - Include name, purpose, and location link

**This keeps the project overview accurate for all collaborators.**
