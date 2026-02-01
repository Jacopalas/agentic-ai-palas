#!/usr/bin/env bash
#
# Palas Plugin - Minimal Project Setup
# Creates a basic .claude/CLAUDE.md for projects without one
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/starter/minimal-install.sh | bash
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo ""
echo "Palas Plugin - Minimal Project Setup"
echo "====================================="
echo ""

# Check if .claude directory exists
if [ -d ".claude" ]; then
    echo -e "${YELLOW}Warning: .claude/ directory already exists${NC}"

    if [ -f ".claude/CLAUDE.md" ]; then
        echo -e "${YELLOW}CLAUDE.md already exists. Skipping to avoid overwriting.${NC}"
        echo ""
        echo "To use the palas plugin, run in Claude Code:"
        echo "  /plugin marketplace add Jacopalas/palas-marketplace"
        echo "  /plugin install palas@palas"
        exit 0
    fi
else
    mkdir -p .claude
    echo -e "${GREEN}Created .claude/ directory${NC}"
fi

# Create minimal CLAUDE.md
cat > .claude/CLAUDE.md << 'EOF'
# Project Instructions

## Available Skills (via palas plugin)

Install the palas plugin to get these skills:

```shell
/plugin marketplace add Jacopalas/palas-marketplace
/plugin install palas@palas
```

### Skills

- `/palas:commit` — Create well-structured git commits with conventional format
- `/palas:fixing-markdown` — Validate and fix markdown formatting
- `/palas:security-scan` — Scan for exposed secrets and vulnerabilities
- `/palas:removing-notebooklm` — Remove watermarks from PDFs and images

## Project-Specific Notes

<!-- Add your project instructions here -->
<!-- Examples: -->
<!-- - Project uses Python 3.11 with uv for dependency management -->
<!-- - Run tests with: pytest tests/ -->
<!-- - Build with: npm run build -->

EOF

echo -e "${GREEN}Created .claude/CLAUDE.md${NC}"
echo ""
echo "Next steps:"
echo "  1. Open Claude Code in this directory"
echo "  2. Run: /plugin marketplace add Jacopalas/palas-marketplace"
echo "  3. Run: /plugin install palas@palas"
echo "  4. Edit .claude/CLAUDE.md to add your project-specific instructions"
echo ""
echo -e "${GREEN}Done!${NC}"
