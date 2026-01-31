#!/usr/bin/env bash
#
# Agentic AI Palas - Installation Script (Linux/macOS)
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/install/install.sh | bash
#
# Or run locally:
#   bash install/install.sh
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
REPO_URL="https://github.com/Jacopalas/agentic-ai-palas.git"
TEMP_DIR=$(mktemp -d)
TARGET_DIR="${PWD}"

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  Agentic AI Palas - Installer${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Check if running from repo itself
if [ -f "${TARGET_DIR}/install/install.sh" ] && [ -d "${TARGET_DIR}/.claude/skills" ]; then
    echo -e "${YELLOW}Detected: Running from source repository${NC}"
    SOURCE_DIR="${TARGET_DIR}"
else
    # Clone repository to temp directory
    echo -e "${BLUE}Downloading Agentic AI Palas...${NC}"
    git clone --quiet --depth 1 "${REPO_URL}" "${TEMP_DIR}/repo"
    SOURCE_DIR="${TEMP_DIR}/repo"
fi

# Create .claude directory if it doesn't exist
mkdir -p "${TARGET_DIR}/.claude"

# Copy skills
echo -e "${BLUE}Installing skills...${NC}"
if [ -d "${TARGET_DIR}/.claude/skills" ]; then
    rm -rf "${TARGET_DIR}/.claude/skills"
fi
cp -r "${SOURCE_DIR}/.claude/skills" "${TARGET_DIR}/.claude/skills"
echo -e "${GREEN}  ✓ Skills installed${NC}"

# Copy _tooling
echo -e "${BLUE}Installing tooling...${NC}"
if [ -d "${TARGET_DIR}/.claude/_tooling" ]; then
    rm -rf "${TARGET_DIR}/.claude/_tooling"
fi
if [ -d "${SOURCE_DIR}/.claude/_tooling" ]; then
    cp -r "${SOURCE_DIR}/.claude/_tooling" "${TARGET_DIR}/.claude/_tooling"
    echo -e "${GREEN}  ✓ Tooling installed${NC}"
else
    echo -e "${YELLOW}  ⚠ No tooling directory found${NC}"
fi

# Create CLAUDE.md only if it doesn't exist
if [ ! -f "${TARGET_DIR}/.claude/CLAUDE.md" ]; then
    echo -e "${BLUE}Creating CLAUDE.md template...${NC}"
    cat > "${TARGET_DIR}/.claude/CLAUDE.md" << 'CLAUDEMD'
# Project Instructions

## Overview

This project uses Agentic AI Palas skills for Claude Code.

## Available Skills

| Skill | Purpose |
|-------|---------|
| `/commit` | Create well-structured git commits |
| `/fixing-markdown` | Validate and fix markdown formatting |
| `/security-scan` | Basic security scanning |

## Usage

Invoke skills by name:

```text
/commit
/fixing-markdown README.md
/security-scan
```

## Customization

Edit this file to add project-specific instructions for Claude.
CLAUDEMD
    echo -e "${GREEN}  ✓ CLAUDE.md created${NC}"
else
    echo -e "${YELLOW}  ⚠ CLAUDE.md already exists, skipping (your customizations preserved)${NC}"
fi

# Cleanup temp directory
if [ -d "${TEMP_DIR}/repo" ]; then
    rm -rf "${TEMP_DIR}"
fi

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  Installation complete!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "Installed to: ${BLUE}${TARGET_DIR}/.claude/${NC}"
echo ""
echo -e "Available skills:"
echo -e "  ${BLUE}/commit${NC}           - Create consistent git commits"
echo -e "  ${BLUE}/fixing-markdown${NC}  - Validate and fix markdown"
echo -e "  ${BLUE}/security-scan${NC}    - Basic security scanning"
echo ""
echo -e "Try it: ${YELLOW}/fixing-markdown README.md${NC}"
echo ""
