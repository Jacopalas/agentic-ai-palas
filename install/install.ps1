#
# Agentic AI Palas - Installation Script (Windows PowerShell)
#
# Usage:
#   irm https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/install/install.ps1 | iex
#
# Or run locally:
#   .\install\install.ps1
#

$ErrorActionPreference = "Stop"

# Configuration
$RepoUrl = "https://github.com/Jacopalas/agentic-ai-palas.git"
$TempDir = Join-Path $env:TEMP "agentic-ai-palas-install"
$TargetDir = Get-Location

function Write-ColorOutput($ForegroundColor, $Message) {
    $fc = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = $ForegroundColor
    Write-Output $Message
    $host.UI.RawUI.ForegroundColor = $fc
}

Write-Output ""
Write-ColorOutput Blue "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
Write-ColorOutput Blue "  Agentic AI Palas - Installer"
Write-ColorOutput Blue "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
Write-Output ""

# Check if running from repo itself
$InstallScriptPath = Join-Path $TargetDir "install\install.ps1"
$SkillsPath = Join-Path $TargetDir ".claude\skills"

if ((Test-Path $InstallScriptPath) -and (Test-Path $SkillsPath)) {
    Write-ColorOutput Yellow "Detected: Running from source repository"
    $SourceDir = $TargetDir.Path
} else {
    # Clone repository to temp directory
    Write-ColorOutput Blue "Downloading Agentic AI Palas..."

    if (Test-Path $TempDir) {
        Remove-Item -Recurse -Force $TempDir
    }

    git clone --quiet --depth 1 $RepoUrl $TempDir
    $SourceDir = $TempDir
}

# Create .claude directory if it doesn't exist
$ClaudeDir = Join-Path $TargetDir ".claude"
if (-not (Test-Path $ClaudeDir)) {
    New-Item -ItemType Directory -Path $ClaudeDir | Out-Null
}

# Copy skills
Write-ColorOutput Blue "Installing skills..."
$TargetSkills = Join-Path $TargetDir ".claude\skills"
$SourceSkills = Join-Path $SourceDir ".claude\skills"

if (Test-Path $TargetSkills) {
    Remove-Item -Recurse -Force $TargetSkills
}
Copy-Item -Recurse $SourceSkills $TargetSkills
Write-ColorOutput Green "  ✓ Skills installed"

# Copy scripts
Write-ColorOutput Blue "Installing scripts..."
$TargetScripts = Join-Path $TargetDir ".claude\scripts"
$SourceScripts = Join-Path $SourceDir ".claude\scripts"

if (Test-Path $TargetScripts) {
    Remove-Item -Recurse -Force $TargetScripts
}
if (Test-Path $SourceScripts) {
    Copy-Item -Recurse $SourceScripts $TargetScripts
    Write-ColorOutput Green "  ✓ Scripts installed"
} else {
    Write-ColorOutput Yellow "  ⚠ No scripts directory found"
}

# Copy _tooling
Write-ColorOutput Blue "Installing tooling..."
$TargetTooling = Join-Path $TargetDir ".claude\_tooling"
$SourceTooling = Join-Path $SourceDir ".claude\_tooling"

if (Test-Path $TargetTooling) {
    Remove-Item -Recurse -Force $TargetTooling
}
if (Test-Path $SourceTooling) {
    Copy-Item -Recurse $SourceTooling $TargetTooling
    Write-ColorOutput Green "  ✓ Tooling installed"
} else {
    Write-ColorOutput Yellow "  ⚠ No tooling directory found"
}

# Create CLAUDE.md only if it doesn't exist
$ClaudeMdPath = Join-Path $TargetDir ".claude\CLAUDE.md"
if (-not (Test-Path $ClaudeMdPath)) {
    Write-ColorOutput Blue "Creating CLAUDE.md template..."

    $ClaudeMdContent = @'
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
'@

    Set-Content -Path $ClaudeMdPath -Value $ClaudeMdContent -Encoding UTF8
    Write-ColorOutput Green "  ✓ CLAUDE.md created"
} else {
    Write-ColorOutput Yellow "  ⚠ CLAUDE.md already exists, skipping (your customizations preserved)"
}

# Cleanup temp directory
if (Test-Path $TempDir) {
    Remove-Item -Recurse -Force $TempDir
}

Write-Output ""
Write-ColorOutput Green "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
Write-ColorOutput Green "  Installation complete!"
Write-ColorOutput Green "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
Write-Output ""
Write-Output "Installed to: $ClaudeDir"
Write-Output ""
Write-Output "Available skills:"
Write-ColorOutput Blue "  /commit           - Create consistent git commits"
Write-ColorOutput Blue "  /fixing-markdown  - Validate and fix markdown"
Write-ColorOutput Blue "  /security-scan    - Basic security scanning"
Write-Output ""
Write-ColorOutput Yellow "Try it: /fixing-markdown README.md"
Write-Output ""
