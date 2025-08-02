#!/bin/bash
#
# Claude Code Configuration Sync Checker
# Checks if local configuration is in sync with upstream
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Get script directory (where this repo is located)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Change to repository directory
cd "$SCRIPT_DIR"

# Function to print colored output
print_info() {
    echo -e "${BLUE}[Claude Config Sync]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[Claude Config Sync]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[Claude Config Sync]${NC} $1"
}

print_error() {
    echo -e "${RED}[Claude Config Sync]${NC} $1"
}

# Check if we're in a git repository
if ! git rev-parse --git-dir >/dev/null 2>&1; then
    print_error "Not in a git repository"
    exit 1
fi

# Check if we have a remote
if ! git remote get-url origin >/dev/null 2>&1; then
    print_warning "No remote repository configured"
    exit 0
fi

# Fetch latest changes from remote (quietly)
print_info "Checking for updates..."
if ! git fetch origin main --quiet 2>/dev/null; then
    print_warning "Failed to fetch from remote (network issue or authentication required)"
    exit 0
fi

# Check if local is behind remote
LOCAL_COMMIT=$(git rev-parse HEAD)
REMOTE_COMMIT=$(git rev-parse origin/main)

if [[ "$LOCAL_COMMIT" == "$REMOTE_COMMIT" ]]; then
    print_success "Configuration is up to date"
elif git merge-base --is-ancestor "$LOCAL_COMMIT" "$REMOTE_COMMIT" 2>/dev/null; then
    # Local is behind remote
    COMMITS_BEHIND=$(git rev-list --count HEAD..origin/main)
    print_warning "Configuration is $COMMITS_BEHIND commit(s) behind upstream"
    echo "  Run 'git pull origin main' in $SCRIPT_DIR to update"
elif git merge-base --is-ancestor "$REMOTE_COMMIT" "$LOCAL_COMMIT" 2>/dev/null; then
    # Local is ahead of remote
    COMMITS_AHEAD=$(git rev-list --count origin/main..HEAD)
    print_info "Configuration is $COMMITS_AHEAD commit(s) ahead of upstream"
    echo "  Changes will be pushed automatically on next commit"
else
    # Diverged
    print_warning "Configuration has diverged from upstream"
    echo "  Manual merge may be required in $SCRIPT_DIR"
fi