#!/bin/bash
#
# Auto-commit script for Claude Code configuration changes
# Can be called manually or integrated into other workflows
#

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

print_info() {
    echo -e "${BLUE}[Claude Config Auto-Commit]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[Claude Config Auto-Commit]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[Claude Config Auto-Commit]${NC} $1"
}

# Check if we're in a git repository
if ! git rev-parse --git-dir >/dev/null 2>&1; then
    print_warning "Not in a git repository, skipping auto-commit"
    exit 0
fi

# Check if there are any changes to configuration files
CONFIG_FILES=("CLAUDE.md" "settings.json")
CHANGED_FILES=()

for file in "${CONFIG_FILES[@]}"; do
    if [[ -f "$file" ]] && ! git diff --quiet "$file" 2>/dev/null; then
        CHANGED_FILES+=("$file")
    fi
done

# If no changes, exit
if [[ ${#CHANGED_FILES[@]} -eq 0 ]]; then
    print_info "No configuration changes detected"
    exit 0
fi

# Stage the changed files
print_info "Staging configuration changes: ${CHANGED_FILES[*]}"
for file in "${CHANGED_FILES[@]}"; do
    git add "$file"
done

# Create commit message
COMMIT_MSG="chore(config): update Claude Code configuration

Updated files: ${CHANGED_FILES[*]}

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>"

# Commit the changes
if git commit -m "$COMMIT_MSG" >/dev/null 2>&1; then
    print_success "Configuration changes committed successfully"
    
    # Push if we have a remote
    if git remote get-url origin >/dev/null 2>&1; then
        if git push origin main >/dev/null 2>&1; then
            print_success "Changes pushed to remote repository"
        else
            print_warning "Failed to push changes (network issue or authentication required)"
        fi
    fi
else
    print_warning "No changes to commit"
fi