---
name: commit
description: Create well-structured git commits with consistent message format. Use when the user wants to commit changes, make a commit, guardar cambios, hacer commit, or save work to git.
metadata:
  skillport:
    category: git
    tags: [git, commit, version-control, workflow]
---

# /commit — Create Consistent Git Commits

Create git commits with well-structured, conventional commit messages.

## Usage

```text
/commit [message]
```

**Arguments:**

- `message` (Optional): Commit message or description of changes. If omitted, analyze staged changes automatically.

## Commit Message Format

Follow Conventional Commits format:

```text
<type>(<scope>): <subject>

<body>
```

### Types

| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation only |
| `style` | Formatting, no code change |
| `refactor` | Code restructuring, no behavior change |
| `perf` | Performance improvement |
| `test` | Adding or fixing tests |
| `chore` | Build, config, dependencies |
| `ci` | CI/CD changes |

### Scope

Optional. Component or area affected (e.g., `auth`, `api`, `ui`).

### Subject

- Imperative mood ("add feature" not "added feature")
- No period at end
- Max 50 characters

### Body

- Explain **why**, not **what** (code shows what)
- Wrap at 72 characters
- Optional for small changes

## Behavior

1. **Check git status**: Run `git status` to see changes
2. **Check staged files**: Run `git diff --staged --stat`
3. **Check recent commits**: Run `git log --oneline -5` for style reference
4. **Analyze changes**: Determine type and scope from files changed
5. **Draft message**: Create commit message following format
6. **Stage if needed**: Add relevant files if not staged
7. **Commit**: Execute `git commit` with message
8. **Verify**: Run `git status` to confirm

## Examples

```text
/commit
→ Analyzes staged changes, drafts appropriate message

/commit add user authentication
→ Creates: feat(auth): add user authentication

/commit fix login redirect bug
→ Creates: fix(auth): fix login redirect bug

/commit update README with installation steps
→ Creates: docs: update README with installation steps
```

## Commands

```bash
# Check current state
git status
git diff --staged --stat
git log --oneline -5

# Stage specific files (prefer over git add -A)
git add path/to/file1.ts path/to/file2.ts

# Commit with HEREDOC for proper formatting
git commit -m "$(cat <<'EOF'
type(scope): subject line

Body explaining why this change was made.
EOF
)"

# Verify
git status
```

## Rules

1. **Never use `git add -A`** — stage specific files to avoid accidents
2. **Never commit secrets** — skip `.env`, credentials, API keys
3. **Never amend without asking** — amending can lose work
4. **Never push automatically** — commit only, user pushes manually
5. **Never skip hooks** — let pre-commit hooks run

## Multi-File Commits

When changes span multiple files:

1. Group related changes into one commit
2. Use scope to indicate main area
3. List affected areas in body if helpful

```text
feat(api): add rate limiting

- Add rate limit middleware
- Update API routes
- Add rate limit tests
```

## Notes

- If pre-commit hooks fail, fix issues and create a NEW commit (don't amend)
- For large changes, consider splitting into smaller commits
- Always verify with `git status` after committing
