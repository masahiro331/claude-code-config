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

# Install configuration files
install_config() {
    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    local claude_dir="$HOME/.claude"
    
    # Create .claude directory if it doesn't exist
    mkdir -p "$claude_dir"
    
    # Copy configuration files
    if [ -f "$script_dir/CLAUDE.md" ]; then
        print_info "Installing CLAUDE.md..."
        cp "$script_dir/CLAUDE.md" "$claude_dir/"
    else
        print_warning "CLAUDE.md not found in script directory"
    fi
    
    if [ -f "$script_dir/settings.json" ]; then
        print_info "Installing settings.json..."
        cp "$script_dir/settings.json" "$claude_dir/"
    else
        print_warning "settings.json not found in script directory"
    fi
    
    print_info "Configuration files installed successfully"
}

# Set appropriate permissions
set_permissions() {
    chmod 700 "$HOME/.claude"
    chmod 600 "$HOME/.claude"/* 2>/dev/null || true
    print_info "Permissions set correctly"
}

# Verify installation
verify_installation() {
    local claude_dir="$HOME/.claude"
    
    if [ -f "$claude_dir/CLAUDE.md" ] && [ -f "$claude_dir/settings.json" ]; then
        print_info "Installation verified successfully"
        echo
        echo "Configuration files installed:"
        echo "  - $claude_dir/CLAUDE.md"
        echo "  - $claude_dir/settings.json"
        echo
        print_info "Claude Code is now configured with your personal settings"
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