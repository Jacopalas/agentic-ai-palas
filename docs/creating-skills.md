# Creating Skills

Guide to creating new skills for Claude Code.

## What is a Skill?

A skill is a reusable command that Claude Code can execute. Skills are invoked with `/skill-name` and provide specialized functionality.

## Skill Structure

Each skill lives in its own directory under `.claude/skills/`:

```text
.claude/skills/
└── my-skill/
    └── SKILL.md          # Required: skill definition
```

Some skills include additional files:

```text
.claude/skills/
└── fixing-markdown/
    └── SKILL.md
```

## SKILL.md Format

Every skill requires a `SKILL.md` file with YAML frontmatter:

```markdown
---
name: my-skill
description: Brief description of what the skill does. Include trigger keywords for automatic detection.
metadata:
  skillport:
    category: category-name
    tags: [tag1, tag2, tag3]
---

# /my-skill — Short Title

One-line description of what this skill does.

## Usage

\`\`\`text
/my-skill <arguments>
\`\`\`

**Arguments:**

- `arg1` (Required): Description
- `arg2` (Optional): Description

## Prerequisites

List any requirements (tools, environment, dependencies).

## Commands

Show the actual commands the skill runs.

## Examples

\`\`\`text
/my-skill example1
→ What happens

/my-skill example2
→ What happens
\`\`\`

## Behavior

1. Step 1
2. Step 2
3. Step 3

## Notes

Additional information, caveats, or tips.
```

## Frontmatter Fields

| Field | Required | Description |
|-------|----------|-------------|
| `name` | Yes | Skill identifier (kebab-case, matches folder name) |
| `description` | Yes | What the skill does + trigger keywords |
| `metadata.skillport.category` | No | Category for organization |
| `metadata.skillport.tags` | No | Tags for discoverability |

## Naming Conventions

- **Folder name**: `kebab-case` (e.g., `fixing-markdown`)
- **Skill name**: Same as folder name
- **Command**: `/folder-name` (e.g., `/fixing-markdown`)

## Best Practices

### 1. Clear Description

Include keywords that trigger the skill:

```yaml
description: Validate and fix markdown formatting. Use when the user wants to check formatting, validate markdown, fix lint errors.
```

### 2. Show Usage First

Users should immediately understand how to invoke the skill.

### 3. Document Prerequisites

If the skill needs Node.js, Python, or external tools, say so.

### 4. Provide Examples

Real examples help users understand what to expect.

### 5. Explain Behavior

Step-by-step flow helps debugging when things go wrong.

## Testing Your Skill

1. Create the skill directory and `SKILL.md`
2. Invoke it: `/my-skill test-argument`
3. Claude should read `SKILL.md` and follow the instructions
4. Iterate on the documentation until behavior is correct

## Common Patterns

### Skills That Run Commands

```markdown
## Commands

\`\`\`bash
command --flag argument
\`\`\`
```

### Skills That Need Environment Setup

```markdown
## Prerequisites

**Run initializing-environment first** to ensure the environment is ready.
```

### Skills With Multiple Modes

```markdown
## Usage

\`\`\`text
/my-skill check <target>    # Validate without changes
/my-skill fix <target>      # Fix issues automatically
\`\`\`
```

## Adding to the Repository

1. Create `.claude/skills/my-skill/SKILL.md`
2. Update the main `README.md` skills table
3. Run `/fixing-markdown .claude/skills/my-skill/SKILL.md`
4. Commit with a descriptive message
