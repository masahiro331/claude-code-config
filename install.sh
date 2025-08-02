#!/bin/bash

# Claude Code Configuration Installer
# This script sets up Claude Code configuration files

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Claude CLI is installed
check_claude_cli() {
    if ! command -v claude &> /dev/null; then
        print_error "Claude CLI is not installed. Please install it first:"
        echo "  curl -fsSL https://claude.ai/install.sh | sh"
        exit 1
    fi
    print_info "Claude CLI is installed"
}

# Create backup of existing configuration
backup_existing_config() {
    local backup_dir="$HOME/.claude.backup.$(date +%Y%m%d_%H%M%S)"
    
    if [ -d "$HOME/.claude" ]; then
        print_warning "Existing Claude configuration found"
        print_info "Creating backup at: $backup_dir"
        cp -r "$HOME/.claude" "$backup_dir"
        print_info "Backup created successfully"
    fi
}

# Install configuration files using symlink
install_config() {
    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    local claude_dir="$HOME/.claude"
    
    # Remove existing .claude directory/symlink if it exists
    if [ -e "$claude_dir" ]; then
        rm -rf "$claude_dir"
        print_info "Removed existing .claude directory/symlink"
    fi
    
    # Create symlink to this repository
    ln -s "$script_dir" "$claude_dir"
    print_info "Created symlink: $claude_dir -> $script_dir"
    
    # Verify required files exist
    if [ -f "$script_dir/CLAUDE.md" ] && [ -f "$script_dir/settings.json" ]; then
        print_info "Configuration files linked successfully"
    else
        print_error "Required configuration files not found in $script_dir"
        exit 1
    fi
}

# Set appropriate permissions
set_permissions() {
    # For symlink, we need to set permissions on the target directory
    local target_dir="$(readlink "$HOME/.claude")"
    chmod 700 "$target_dir"
    chmod 600 "$target_dir"/* 2>/dev/null || true
    print_info "Permissions set correctly"
}

# Verify installation
verify_installation() {
    local claude_dir="$HOME/.claude"
    
    if [ -L "$claude_dir" ] && [ -f "$claude_dir/CLAUDE.md" ] && [ -f "$claude_dir/settings.json" ]; then
        print_info "Installation verified successfully"
        echo
        echo "Configuration symlink created:"
        echo "  $claude_dir -> $(readlink "$claude_dir")"
        echo
        echo "Available configuration files:"
        echo "  - $claude_dir/CLAUDE.md"
        echo "  - $claude_dir/settings.json"
        echo
        print_info "Claude Code is now configured with your personal settings"
        print_info "Any changes to the repository will be automatically reflected in Claude Code"
    else
        print_error "Installation verification failed"
        exit 1
    fi
}

# Main installation process
main() {
    echo "Claude Code Configuration Installer"
    echo "==================================="
    echo
    
    check_claude_cli
    backup_existing_config
    install_config
    set_permissions
    verify_installation
    
    echo
    print_info "Installation completed successfully!"
    echo "You can now use Claude Code with your personal configuration."
}

# Run main function
main "$@"