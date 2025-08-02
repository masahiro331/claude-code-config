#!/bin/bash
#
# Claude Code Configuration Installer
# This script installs Claude Code configuration files and Git hooks
#

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}[Claude Config Installer]${NC} Setting up Claude Code configuration..."

# Get the repository root and user's home directory
REPO_ROOT="$(git rev-parse --show-toplevel)"
CLAUDE_DIR="$REPO_ROOT/claude"
USER_CLAUDE_DIR="$HOME/.claude"

# Check if claude directory exists in repo
if [[ ! -d "$CLAUDE_DIR" ]]; then
    echo -e "${RED}[Claude Config Installer]${NC} Error: claude directory not found at $CLAUDE_DIR"
    exit 1
fi

# Create user's Claude directory if it doesn't exist
if [[ ! -d "$USER_CLAUDE_DIR" ]]; then
    echo -e "${YELLOW}[Claude Config Installer]${NC} Creating ~/.claude directory..."
    mkdir -p "$USER_CLAUDE_DIR"
fi

# Install configuration files
echo -e "${GREEN}[Claude Config Installer]${NC} Installing configuration files..."

# Copy CLAUDE.md to user's global config
if [[ -f "$CLAUDE_DIR/CLAUDE.md" ]]; then
    echo -e "${GREEN}[Claude Config Installer]${NC} Installing global CLAUDE.md..."
    cp "$CLAUDE_DIR/CLAUDE.md" "$USER_CLAUDE_DIR/CLAUDE.md"
    echo -e "${GREEN}[Claude Config Installer]${NC} Global CLAUDE.md installed to ~/.claude/CLAUDE.md"
else
    echo -e "${YELLOW}[Claude Config Installer]${NC} Warning: CLAUDE.md not found in $CLAUDE_DIR"
fi

# Copy settings.json if it exists
if [[ -f "$CLAUDE_DIR/settings.json" ]]; then
    echo -e "${GREEN}[Claude Config Installer]${NC} Installing settings.json..."
    cp "$CLAUDE_DIR/settings.json" "$USER_CLAUDE_DIR/settings.json"
    echo -e "${GREEN}[Claude Config Installer]${NC} settings.json installed to ~/.claude/settings.json"
else
    echo -e "${YELLOW}[Claude Config Installer]${NC} Warning: settings.json not found in $CLAUDE_DIR"
fi

# Copy commands directory if it exists
if [[ -d "$CLAUDE_DIR/commands" ]]; then
    echo -e "${GREEN}[Claude Config Installer]${NC} Installing commands..."
    cp -r "$CLAUDE_DIR/commands" "$USER_CLAUDE_DIR/"
    echo -e "${GREEN}[Claude Config Installer]${NC} Commands installed to ~/.claude/commands/"
else
    echo -e "${YELLOW}[Claude Config Installer]${NC} Warning: commands directory not found in $CLAUDE_DIR"
fi

# Install Git hooks
echo -e "${GREEN}[Claude Config Installer]${NC} Installing Git hooks..."
HOOKS_DIR="$REPO_ROOT/hooks"
GIT_HOOKS_DIR="$REPO_ROOT/.git/hooks"

if [[ -d "$HOOKS_DIR" ]]; then
    HOOKS_TO_INSTALL=("pre-commit" "post-commit")
    
    for hook in "${HOOKS_TO_INSTALL[@]}"; do
        if [[ -f "$HOOKS_DIR/$hook" ]]; then
            echo -e "${GREEN}[Claude Config Installer]${NC} Installing $hook hook..."
            cp "$HOOKS_DIR/$hook" "$GIT_HOOKS_DIR/$hook"
            chmod +x "$GIT_HOOKS_DIR/$hook"
            echo -e "${GREEN}[Claude Config Installer]${NC} $hook hook installed successfully"
        else
            echo -e "${YELLOW}[Claude Config Installer]${NC} Warning: $hook hook not found in $HOOKS_DIR"
        fi
    done
else
    echo -e "${YELLOW}[Claude Config Installer]${NC} Warning: hooks directory not found, skipping Git hooks installation"
fi

echo -e "${BLUE}[Claude Config Installer]${NC} Installation completed!"
echo -e "${GREEN}[Claude Config Installer]${NC} The following have been installed:"
echo -e "  - Global configuration: ~/.claude/CLAUDE.md"
echo -e "  - User settings: ~/.claude/settings.json"
echo -e "  - Commands: ~/.claude/commands/"
echo -e "  - Git hooks: pre-commit, post-commit"
echo ""
echo -e "${BLUE}[Claude Config Installer]${NC} You can now use Claude Code with your configured settings!"
echo -e "${YELLOW}[Claude Config Installer]${NC} Note: Git hooks will auto-stage and push changes to claude/ directory files."