---
name: security-scan
description: Basic security scanning for common vulnerabilities. Use when the user wants to check security, scan for vulnerabilities, find secrets, audit security, revisar seguridad, escanear vulnerabilidades, or check for exposed credentials.
---

# /security:security-scan — Basic Security Scanning

Scan codebase for common security issues: exposed secrets, vulnerable patterns, and risky configurations.

## Usage

```text
/security:security-scan [target]
```

**Arguments:**

- `target` (Optional): File or directory to scan. Defaults to current directory.

## What Gets Scanned

### 1. Exposed Secrets

Patterns that indicate leaked credentials:

| Pattern | Examples |
|---------|----------|
| API Keys | `api_key`, `apikey`, `api-key` |
| Secrets | `secret`, `password`, `passwd`, `pwd` |
| Tokens | `token`, `auth_token`, `access_token` |
| Private Keys | `private_key`, `-----BEGIN.*PRIVATE KEY-----` |
| AWS | `AKIA`, `aws_access_key_id`, `aws_secret_access_key` |
| Database | `DATABASE_URL`, `DB_PASSWORD`, `connection_string` |

### 2. Dangerous Files

Files that should never be committed:

| File | Risk |
|------|------|
| `.env` | Environment variables with secrets |
| `.env.local` | Local environment overrides |
| `credentials.json` | Service account credentials |
| `*.pem`, `*.key` | Private keys |
| `id_rsa`, `id_ed25519` | SSH private keys |
| `.npmrc` with tokens | npm authentication |
| `secrets.yaml` | Kubernetes secrets |

### 3. Risky Code Patterns

| Pattern | Language | Risk |
|---------|----------|------|
| `eval()` | JS/Python | Code injection |
| `exec()` | Python | Command injection |
| `dangerouslySetInnerHTML` | React | XSS vulnerability |
| `innerHTML =` | JS | XSS vulnerability |
| `shell=True` | Python subprocess | Command injection |
| SQL string concatenation | Any | SQL injection |
| `disable_ssl_verification` | Any | MITM vulnerability |

## Behavior

1. **Scan for secrets**: Search for exposed credentials
2. **Check dangerous files**: Look for files that shouldn't exist
3. **Detect risky patterns**: Find vulnerable code patterns
4. **Check .gitignore**: Verify sensitive files are ignored
5. **Report findings**: Summarize issues by severity

## Commands

```bash
# Search for API keys and secrets (case insensitive)
rg -i "(api[_-]?key|secret|password|token|private[_-]?key)" --type-not binary -g "!node_modules" -g "!.git" -g "!*.lock"

# Search for AWS credentials
rg "AKIA[A-Z0-9]{16}" --type-not binary -g "!node_modules" -g "!.git"
rg -i "aws_(access_key|secret)" --type-not binary -g "!node_modules" -g "!.git"

# Search for private key blocks
rg "BEGIN.*PRIVATE KEY" --type-not binary -g "!node_modules" -g "!.git"

# Find dangerous files
find . -name ".env" -o -name ".env.*" -o -name "*.pem" -o -name "*.key" -o -name "id_rsa" -o -name "credentials.json" 2>/dev/null | grep -v node_modules | grep -v .git

# Search for eval/exec patterns
rg "eval\s*\(" --type js --type ts --type py -g "!node_modules"
rg "dangerouslySetInnerHTML" --type js --type ts -g "!node_modules"
rg 'innerHTML\s*=' --type js --type ts -g "!node_modules"

# Check if .env is in .gitignore
grep -E "^\.env" .gitignore 2>/dev/null || echo "WARNING: .env not in .gitignore"
```

## Output Format

### Clean Scan

```text
Security Scan: ./src

Secrets: 0 found
Dangerous files: 0 found
Risky patterns: 0 found
.gitignore: .env is ignored

No security issues detected
```

### Issues Found

```text
Security Scan: ./src

SECRETS FOUND (3):
  src/config.js:12 — api_key = "sk-..."
  src/database.js:5 — password: "hardcoded"
  .env.example:3 — Contains actual API key

DANGEROUS FILES (2):
  .env — Contains credentials, check .gitignore
  credentials.json — Service account file

RISKY PATTERNS (1):
  src/utils.js:45 — eval() usage

RECOMMENDATIONS:
1. Move secrets to environment variables
2. Add .env to .gitignore
3. Remove credentials.json from repo
4. Replace eval() with safer alternative
```

## Severity Levels

| Level | Examples |
|-------|----------|
| Critical | Private keys, AWS credentials, database passwords |
| Warning | Generic API keys, eval usage, .env exposure |
| Info | Potential false positives, best practice suggestions |

## False Positive Handling

Some matches are expected:

- `password` in form field names
- `token` in JWT handling code
- Example values in documentation
- Test fixtures with fake credentials

Review each finding in context before taking action.

## Examples

```text
/security:security-scan
-> Scans current directory

/security:security-scan src/
-> Scans only src/ directory

/security:security-scan package.json
-> Checks single file for embedded secrets
```

## Limitations

This is a **basic** security scan. For comprehensive security:

- Use dedicated tools (Snyk, Dependabot, Trivy)
- Run dependency audits (`npm audit`, `pip-audit`)
- Perform penetration testing
- Follow OWASP guidelines

## Notes

- Excludes `node_modules/`, `.git/`, and lock files by default
- Uses ripgrep (`rg`) for fast searching
- Review findings manually — context matters
- Consider adding pre-commit hooks to prevent secret commits
