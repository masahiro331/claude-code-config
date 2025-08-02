#!/bin/bash
#
# Setup script for Git hooks
# This script installs the Git hooks for Claude Code configuration management
#

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}[Setup]${NC} Setting up Git hooks for Claude Code configuration..."

# Get the repository root
REPO_ROOT="$(git rev-parse --show-toplevel)"
HOOKS_DIR="$REPO_ROOT/hooks"
GIT_HOOKS_DIR="$REPO_ROOT/.git/hooks"

# Check if hooks directory exists
if [[ ! -d "$HOOKS_DIR" ]]; then
    echo -e "${RED}[Setup]${NC} Error: hooks directory not found at $HOOKS_DIR"
    exit 1
fi

# Install hooks
HOOKS_TO_INSTALL=("pre-commit" "post-commit")

for hook in "${HOOKS_TO_INSTALL[@]}"; do
    if [[ -f "$HOOKS_DIR/$hook" ]]; then
        echo -e "${GREEN}[Setup]${NC} Installing $hook hook..."
        cp "$HOOKS_DIR/$hook" "$GIT_HOOKS_DIR/$hook"
        chmod +x "$GIT_HOOKS_DIR/$hook"
        echo -e "${GREEN}[Setup]${NC} $hook hook installed successfully"
    else
        echo -e "${YELLOW}[Setup]${NC} Warning: $hook hook not found in $HOOKS_DIR"
    fi
done

echo -e "${GREEN}[Setup]${NC} Git hooks setup completed!"
echo -e "${GREEN}[Setup]${NC} The following hooks are now active:"
echo -e "  - pre-commit: Auto-stages configuration files"
echo -e "  - post-commit: Auto-pushes changes to remote repository"