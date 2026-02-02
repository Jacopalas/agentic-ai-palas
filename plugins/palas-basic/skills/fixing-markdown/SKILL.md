---
name: fixing-markdown
description: Validate and fix markdown formatting in files and folders. Use when the user wants to check formatting, validate markdown, fix lint errors, revisar formato, validar notas, comprobar markdown, arreglar markdown, limpiar markdown, or clean up files.
---

# /palas:fixing-markdown — Validate and Fix Markdown

Run `markdownlint-cli2` + `prettier` to auto-fix markdown formatting issues.

## CRITICAL: Execution Requirements

**ALWAYS run BOTH tools in sequence, regardless of exit codes.**

1. **markdownlint-cli2** may exit with code 1 if it finds errors it cannot auto-fix. This is expected behavior—**proceed to prettier anyway**.
2. **prettier** must ALWAYS run after markdownlint, even if markdownlint reports errors.
3. After both tools complete, manually fix any remaining markdownlint errors (e.g., MD040 for missing code block language).

**Correct flow:**

```text
markdownlint-cli2 --fix → (ignore exit code) → prettier --write → fix remaining errors manually
```

**Wrong flow (DO NOT DO THIS):**

```text
markdownlint-cli2 --fix → (sees exit code 1) → STOP ❌
```

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
# Step 1: Fix structural issues (ALWAYS run, ignore exit code)
node <plugin-path>/_tooling/node_modules/markdownlint-cli2/markdownlint-cli2-bin.mjs --config <plugin-path>/_tooling/.markdownlint-cli2.jsonc --fix "path/to/file.md"

# Step 2: Format (ALWAYS run, even if step 1 had errors)
node <plugin-path>/_tooling/node_modules/prettier/bin/prettier.cjs --config <plugin-path>/_tooling/.prettierrc --write "path/to/file.md"

# Step 3: Check remaining errors (if any, fix manually)
node <plugin-path>/_tooling/node_modules/markdownlint-cli2/markdownlint-cli2-bin.mjs --config <plugin-path>/_tooling/.markdownlint-cli2.jsonc "path/to/file.md"
```

### Folder (recursive)

```bash
# Step 1: Fix structural issues (exclude .agent/, ignore exit code)
node <plugin-path>/_tooling/node_modules/markdownlint-cli2/markdownlint-cli2-bin.mjs --config <plugin-path>/_tooling/.markdownlint-cli2.jsonc --fix "path/to/folder/**/*.md" "#.agent"

# Step 2: Format (exclude .agent/, ALWAYS run)
node <plugin-path>/_tooling/node_modules/prettier/bin/prettier.cjs --config <plugin-path>/_tooling/.prettierrc --write "path/to/folder/**/*.md" --ignore-pattern ".agent/**"

# Step 3: Check remaining errors
node <plugin-path>/_tooling/node_modules/markdownlint-cli2/markdownlint-cli2-bin.mjs --config <plugin-path>/_tooling/.markdownlint-cli2.jsonc "path/to/folder/**/*.md" "#.agent"
```

### Root Directory (`.`)

When target is `.` or root, always exclude `.agent/`:

```bash
# Step 1: Fix structural issues (ignore exit code)
node <plugin-path>/_tooling/node_modules/markdownlint-cli2/markdownlint-cli2-bin.mjs --config <plugin-path>/_tooling/.markdownlint-cli2.jsonc --fix "**/*.md" "#.agent"

# Step 2: Format (ALWAYS run)
node <plugin-path>/_tooling/node_modules/prettier/bin/prettier.cjs --config <plugin-path>/_tooling/.prettierrc --write "**/*.md" --ignore-pattern ".agent/**"

# Step 3: Check remaining errors
node <plugin-path>/_tooling/node_modules/markdownlint-cli2/markdownlint-cli2-bin.mjs --config <plugin-path>/_tooling/.markdownlint-cli2.jsonc "**/*.md" "#.agent"
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

### With Remaining Manual Fixes

```text
Fixing: src/content/posts/example.md

markdownlint: 3 errors (1 auto-fixed, 2 require manual fix)
prettier: formatted

Remaining errors:
- Line 35: MD040 - Fenced code blocks should have a language specified

Fixing manually...
Done
```

## Tools

| Tool              | Purpose                                                      |
| ----------------- | ------------------------------------------------------------ |
| markdownlint-cli2 | Structural fixes (headings, lists, code blocks, blank lines) |
| prettier          | Visual formatting (table alignment, consistent spacing)      |

## Rules Enforced

### markdownlint-cli2 (`_tooling/.markdownlint-cli2.jsonc`)

| Rule  | Description                     | Auto-fixable |
| ----- | ------------------------------- | ------------ |
| MD001 | Heading levels increment by one | No           |
| MD003 | ATX style headings (`##`)       | Yes          |
| MD004 | Dash (`-`) for unordered lists  | Yes          |
| MD009 | No trailing whitespace          | Yes          |
| MD010 | No hard tabs                    | Yes          |
| MD012 | Max 1 consecutive blank line    | Yes          |
| MD022 | Blank lines around headings     | Yes          |
| MD031 | Blank lines around code blocks  | Yes          |
| MD032 | Blank lines around lists        | Yes          |
| MD040 | Code blocks have language       | **No**       |
| MD047 | File ends with newline          | Yes          |

### prettier (`_tooling/.prettierrc`)

- Table column alignment
- Consistent spacing
- Prose wrap preserved (no line breaking)

## Behavior

1. **Check argument**: If no target provided, show usage and exit
2. **Check exclusions**: If target is `.agent/` or inside it, show warning and exit
3. **Setup environment**: Ensure Node.js dependencies are installed in plugin directory
4. **Detect target type**: file or folder
5. **Run markdownlint-cli2 with --fix**: Fix structural issues (always exclude `.agent/`). **IGNORE exit code—proceed regardless.**
6. **Run prettier**: Format visual appearance (always exclude `.agent/`). **ALWAYS run this step.**
7. **Run markdownlint-cli2 without --fix**: Check for remaining errors
8. **Fix remaining errors manually**: If any errors remain (e.g., MD040), edit the file to fix them
9. **Report**: Show results from both tools

## Notes

- Config files: `_tooling/.markdownlint-cli2.jsonc`, `_tooling/.prettierrc`
- Requires: Node.js installed on system
- Dependencies installed on first use in plugin's `_tooling/node_modules/`
- **markdownlint exit code 1 is normal** when there are unfixable errors—do not stop execution
