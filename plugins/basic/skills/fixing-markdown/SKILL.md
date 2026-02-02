---
name: fixing-markdown
description: Validate and fix markdown formatting in files and folders. Use when the user wants to check formatting, validate markdown, fix lint errors, revisar formato, validar notas, comprobar markdown, arreglar markdown, limpiar markdown, or clean up files.
---

# /palas:fixing-markdown — Validate and Fix Markdown

Run `markdownlint-cli2` + `prettier` to auto-fix markdown formatting issues.

## Usage

```text
/palas:fixing-markdown <target>
```

**Arguments:**

- `target` (Required):
  - **File path**: Single file (e.g., `src/content/posts/example.md`)
  - **Folder path**: All .md files recursively (e.g., `src/content/posts`)

**No argument = show this usage.**

## Exclusions

**NEVER modify files under `.agent/` directory.**

The `.agent/` directory (git-ignored) contains Antigravity Kit 2.0—optional tooling for Antigravity IDE users. These files are managed externally and have their own formatting conventions. This skill must:

1. **Reject** any target that is `.agent/` or starts with `.agent/`
2. **Exclude** `.agent/` when target is `.` or root directory
3. **Skip** any file path containing `/.agent/` or `\.agent\`

If user requests `.agent/` formatting, respond:

```text
Skipping .agent/ — this directory is managed externally (Antigravity Kit).
Use Antigravity's own formatting tools if needed.
```

## Environment Setup

This skill requires Node.js dependencies. Before running:

1. **Locate plugin directory**: Find this plugin's `_tooling/` directory (contains `package.json` with name `palas-toolkit`)
2. **Install dependencies if needed**: If `_tooling/node_modules/` doesn't exist, run:
   ```bash
   npm install --prefix <plugin-path>/_tooling
   ```
3. **Run tools**: Use the plugin's local binaries

The plugin directory is typically in `~/.claude/plugins/cache/` or wherever the plugin was installed.

## Commands

Replace `<plugin-path>` with the actual path to this plugin's installation directory.

### Single File

```bash
# Step 1: Fix structural issues
node <plugin-path>/_tooling/node_modules/markdownlint-cli2/markdownlint-cli2-bin.mjs --config <plugin-path>/_tooling/.markdownlint-cli2.jsonc "path/to/file.md"

# Step 2: Format (table alignment, spacing)
node <plugin-path>/_tooling/node_modules/prettier/bin/prettier.cjs --config <plugin-path>/_tooling/.prettierrc --write "path/to/file.md"
```

### Folder (recursive)

```bash
# Step 1: Fix structural issues (exclude .agent/)
node <plugin-path>/_tooling/node_modules/markdownlint-cli2/markdownlint-cli2-bin.mjs --config <plugin-path>/_tooling/.markdownlint-cli2.jsonc "path/to/folder/**/*.md" "#.agent"

# Step 2: Format (exclude .agent/)
node <plugin-path>/_tooling/node_modules/prettier/bin/prettier.cjs --config <plugin-path>/_tooling/.prettierrc --write "path/to/folder/**/*.md" --ignore-pattern ".agent/**"
```

### Root Directory (`.`)

When target is `.` or root, always exclude `.agent/`:

```bash
# Step 1: Fix structural issues
node <plugin-path>/_tooling/node_modules/markdownlint-cli2/markdownlint-cli2-bin.mjs --config <plugin-path>/_tooling/.markdownlint-cli2.jsonc "**/*.md" "#.agent"

# Step 2: Format
node <plugin-path>/_tooling/node_modules/prettier/bin/prettier.cjs --config <plugin-path>/_tooling/.prettierrc --write "**/*.md" --ignore-pattern ".agent/**"
```

## Examples

```text
/palas:fixing-markdown src/content/posts/example.md
-> Fixes and formats specific file

/palas:fixing-markdown src/content/posts
-> Fixes and formats all .md files in posts/ recursively

/palas:fixing-markdown docs
-> Fixes and formats all .md files in docs/ recursively
```

## Output Format

### Clean File

```text
Fixing: src/content/posts/example.md

markdownlint: 0 errors
prettier: formatted

Done
```

### With Issues Fixed

```text
Fixing: src/content/posts/example.md

markdownlint: 2 errors fixed
prettier: formatted

Done
```

## Tools

| Tool              | Purpose                                                      |
| ----------------- | ------------------------------------------------------------ |
| markdownlint-cli2 | Structural fixes (headings, lists, code blocks, blank lines) |
| prettier          | Visual formatting (table alignment, consistent spacing)      |

## Rules Enforced

### markdownlint-cli2 (`_tooling/.markdownlint-cli2.jsonc`)

| Rule  | Description                     |
| ----- | ------------------------------- |
| MD001 | Heading levels increment by one |
| MD003 | ATX style headings (`##`)       |
| MD004 | Dash (`-`) for unordered lists  |
| MD009 | No trailing whitespace          |
| MD010 | No hard tabs                    |
| MD012 | Max 1 consecutive blank line    |
| MD022 | Blank lines around headings     |
| MD031 | Blank lines around code blocks  |
| MD032 | Blank lines around lists        |
| MD047 | File ends with newline          |

### prettier (`_tooling/.prettierrc`)

- Table column alignment
- Consistent spacing
- Prose wrap preserved (no line breaking)

## Behavior

1. **Check argument**: If no target provided, show usage and exit
2. **Check exclusions**: If target is `.agent/` or inside it, show warning and exit
3. **Setup environment**: Ensure Node.js dependencies are installed in plugin directory
4. **Detect target type**: file or folder
5. **Run markdownlint-cli2**: Fix structural issues (always exclude `.agent/`)
6. **Run prettier**: Format visual appearance (always exclude `.agent/`)
7. **Report**: Show results from both tools

## Notes

- Config files: `_tooling/.markdownlint-cli2.jsonc`, `_tooling/.prettierrc`
- Requires: Node.js installed on system
- Dependencies installed on first use in plugin's `_tooling/node_modules/`
