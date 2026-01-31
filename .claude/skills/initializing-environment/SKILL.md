---
name: initializing-environment
description: Internal skill to initialize Python and Node.js environments. Called by other skills before execution. Not user-invokable.
metadata:
  skillport:
    category: internal
    tags: [environment, setup, python, nodejs]
---

# Environment Setup (Internal)

Ensures Python and Node.js virtual environments are ready before running dependent skills.

## Usage

This skill is called internally by other skills. It is NOT user-invokable.

When another skill needs dependencies, call `initializing-environment` first:

```text
1. Run initializing-environment checks
2. If checks pass, proceed with the skill
3. If checks fail, show error and exit
```

## Checks Performed

### 1. Python Environment

```bash
# Check Python3 is available
python3 --version

# Check .claude/_tooling/.venv exists, if not create it
if [ ! -d ".claude/_tooling/.venv" ]; then
    python3 -m venv .claude/_tooling/.venv
fi

# Check requirements are installed
.claude/_tooling/.venv/Scripts/pip.exe show Pillow pymupdf opencv-python > /dev/null 2>&1
if [ $? -ne 0 ]; then
    .claude/_tooling/.venv/Scripts/pip.exe install -r .claude/_tooling/requirements.txt
fi
```

### 2. Node.js Environment

```bash
# Check Node.js is available
node --version

# Check node_modules exists, if not install
if [ ! -d ".claude/_tooling/node_modules" ]; then
    npm install --prefix .claude/_tooling
fi

# Verify key packages exist
if [ ! -f ".claude/_tooling/node_modules/markdownlint-cli2/markdownlint-cli2-bin.mjs" ]; then
    npm install --prefix .claude/_tooling
fi
```

## Commands (Windows)

### Python Setup

```bash
# Create venv if missing
python -m venv .claude/_tooling/.venv

# Install requirements
.claude/_tooling/.venv/Scripts/pip.exe install -r .claude/_tooling/requirements.txt

# Verify installation
.claude/_tooling/.venv/Scripts/pip.exe show Pillow pymupdf opencv-python
```

### Node.js Setup

```bash
# Install dependencies
npm install --prefix .claude/_tooling

# Verify installation
node .claude/_tooling/node_modules/markdownlint-cli2/markdownlint-cli2-bin.mjs --help
```

## Exit Conditions

| Condition           | Action                                          |
| ------------------- | ----------------------------------------------- |
| Python3 not found   | Error: "Python3 not installed"                  |
| Node.js not found   | Error: "Node.js not installed"                  |
| venv creation fails | Error: "Failed to create Python venv"           |
| pip install fails   | Error: "Failed to install Python dependencies"  |
| npm install fails   | Error: "Failed to install Node.js dependencies" |
| All checks pass     | Proceed silently                                |

## Behavior

1. **Check Python3**: Verify `python3 --version` or `python --version` works
2. **Check Node.js**: Verify `node --version` works
3. **Setup Python venv**: Create `.claude/_tooling/.venv/` if missing, install `requirements.txt`
4. **Setup Node.js**: Run `npm install --prefix .claude/_tooling` if `.claude/_tooling/node_modules/` missing
5. **Return**: Success or error message

## Dependencies

### Python (`.claude/_tooling/requirements.txt`)

- `Pillow` — Image processing
- `pymupdf` — PDF processing
- `opencv-python` — Computer vision / image analysis

### Node.js (`.claude/_tooling/package.json`)

- `markdownlint-cli2` — Markdown linting
- `prettier` — Code formatting

## Notes

- This skill runs silently when everything is ready
- Only shows output when setup is needed or errors occur
- Other skills should call this at the start of their execution
