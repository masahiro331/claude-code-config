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

# Check if user's Claude directory already exists
if [[ -e "$USER_CLAUDE_DIR" || -L "$USER_CLAUDE_DIR" ]]; then
    echo -e "${RED}[Claude Config Installer]${NC} Error: ~/.claude already exists"
    echo -e "${RED}[Claude Config Installer]${NC} To avoid overwriting existing configuration, please remove it manually:"
    echo -e "${RED}[Claude Config Installer]${NC}   rm -rf ~/.claude"
    echo -e "${RED}[Claude Config Installer]${NC} Then run this installer again."
    exit 1
fi

# Link claude directory to user's home
echo -e "${GREEN}[Claude Config Installer]${NC} Linking claude directory to ~/.claude..."
ln -s "$CLAUDE_DIR" "$USER_CLAUDE_DIR"
echo -e "${GREEN}[Claude Config Installer]${NC} Claude configuration directory linked to ~/.claude"

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
echo -e "  - Claude configuration: ~/.claude/ (symlinked to $(basename "$REPO_ROOT")/claude/)"
echo -e "  - Git hooks: pre-commit, post-commit (copied)"
echo ""
echo -e "${BLUE}[Claude Config Installer]${NC} You can now use Claude Code with your configured settings!"
echo -e "${YELLOW}[Claude Config Installer]${NC} Note: ~/.claude is symlinked and will auto-update when the repository changes."
echo -e "${YELLOW}[Claude Config Installer]${NC} Note: Git hooks will auto-stage and push changes to claude/ directory files."