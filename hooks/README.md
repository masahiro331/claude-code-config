# Git Hooks for Claude Code Configuration

This directory contains Git hooks that automate the management of Claude Code configuration files.

## Available Hooks

### pre-commit
- **Purpose**: Automatically stages configuration files that have been modified
- **Files watched**: `claude/CLAUDE.md`, `claude/settings.json`
- **Behavior**: If any of the watched files are modified but not staged, they will be automatically added to the commit

### post-commit
- **Purpose**: Automatically pushes configuration changes to the remote repository
- **Behavior**: After a successful commit, attempts to push changes to the `main` branch on the `origin` remote

## Installation

To install these hooks in your local repository, run:

```bash
./setup-hooks.sh
```

## Manual Installation

If you prefer to install hooks manually:

```bash
# Copy hooks to .git/hooks directory
cp hooks/pre-commit .git/hooks/
cp hooks/post-commit .git/hooks/

# Make them executable
chmod +x .git/hooks/pre-commit
chmod +x .git/hooks/post-commit
```

## Security Note

These hooks are designed for defensive automation of configuration management. They:
- Only operate on configuration files (`claude/CLAUDE.md`, `claude/settings.json`)
- Do not execute arbitrary code or external commands beyond Git operations
- Include error handling to prevent destructive operations
- Provide clear feedback about their actions

## Customization

To modify the behavior of these hooks:
1. Edit the hook files in this directory
2. Re-run the setup script to install the updated hooks
3. Test the hooks with a sample commit to ensure they work as expected