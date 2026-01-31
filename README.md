# Agentic AI Palas

A collaborative collection of reusable skills, agents, scripts, and templates for AI-powered projects using Claude Code, Antigravity, and other AI platforms.

## Purpose

We're building a shared toolkit that extends the capabilities of Claude Code and other AI tools. This project contains production-ready components—skills, agents, automation scripts, and templates—that we develop, test, and refine for use across different projects.

## What's Available

### Skills

Custom Claude Code commands and extensions:

| Skill | Purpose | Location |
|-------|---------|----------|
| `/fixing-markdown` | Validate and fix markdown formatting | [`.claude/skills/fixing-markdown`](./.claude/skills/fixing-markdown) |

### Agents

Autonomous tools for specific workflows:

*(Coming soon)*

### Scripts

Utility scripts and automation:

Available in [`.claude/scripts`](./.claude/scripts)

### Templates & Resources

Reusable templates, configurations, and documentation resources:

Available in [`/contents`](./contents)

## Quick Start

1. **Browse components**: Explore the skills, agents, or scripts directories
2. **Read documentation**: Each component includes a detailed README or SKILL.md
3. **Use or integrate**: Follow setup instructions to use in your projects

## Project Structure

```
├── .claude/                 # Claude Code skills and tools
│   ├── skills/              # Available skills (SKILL.md format)
│   │   ├── fixing-markdown/
│   │   └── [new-skills]/
│   └── scripts/             # Utility scripts
├── agents/                  # Autonomous agents
├── scripts/                 # General utility scripts
├── contents/                # Templates and resources
├── README.md                # This file (overview & available components)
└── .claude/CLAUDE.md        # Claude integration guide
```

## Contributing

This is a collaborative project. When adding new components:

1. Follow the component-specific structure (see [`.claude/CLAUDE.md`](./.claude/CLAUDE.md))
2. Write clear documentation with examples
3. Keep components modular and reusable
4. Write all documentation in English
5. **Update this README** with the new component in the "What's Available" section
6. Submit a pull request

## Documentation

- [Claude Integration Guide](./.claude/CLAUDE.md) — Setup and component structure
- [Skills Guide](./skills/README.md) — How to create and use skills
- [Agents Guide](./agents/README.md) — How to create and use agents
- [Scripts Guide](./scripts/README.md) — How to create and use scripts
- [Contents Guide](./contents/README.md) — Templates and resources

---

**Note**: This README serves as the main entry point. Each component has detailed documentation in its own directory.
