# Claude Code Configuration

Personal configuration files for Claude Code CLI with Japanese workflow preferences and Go/Python development best practices.

## Features

- **Japanese Language Interface**: All interactions with Claude in Japanese
- **Go/Python Development Optimized**: Configured for Go and Python projects with proper formatting, error handling, and testing workflows
- **TDD Workflow Integration**: Built-in Test-Driven Development workflow reminders
- **Consistent Code Style**: Enforced English documentation and variable naming conventions
- **Git Workflow Integration**: Conventional commit message format and proper Git practices
- **Auto-Sync Configuration**: Automatic commit/push of configuration changes and upstream sync checking
- **Custom Commands**: Built-in commands for common development tasks (PR creation, documentation generation, repository initialization)
- **Project Documentation**: Automatic generation of comprehensive project documentation

## Files

- `claude/` - Claude Code configuration directory
  - `CLAUDE.md` - Global user instructions for Claude Code
  - `settings.json` - Claude Code CLI settings with hooks configuration
  - `commands/` - Custom commands for Claude Code
    - `create-pull-request.md` - Create pull requests with proper branch management
    - `make-docs.md` - Generate comprehensive project documentation
    - `init-repo.md` - Initialize new repositories with proper structure
    - `commit.md` - Enhanced commit workflow with conventional commits
    - `refactor.md` - Structured refactoring workflow
- `hooks/` - Git hooks for automatic configuration management
- `install-claude-config.sh` - Comprehensive installation script
- `sync-check.sh` - Script to check sync status with upstream repository

## Quick Setup

### Prerequisites

1. **Claude CLI**: Ensure Claude CLI is installed
   ```bash
   curl -fsSL https://claude.ai/install.sh | sh
   ```

2. **Required Tools**:
   ```bash
   # For Go development
   go install golang.org/x/tools/cmd/goimports@latest
   
   # For Python development
   pip install uv ruff mypy
   ```

### Installation

1. **Clone this repository**:
   ```bash
   ghq get masahiro331/claude-code-config
   cd $(ghq root)/github.com/masahiro331/claude-code-config
   ```

2. **Run the installation script**:
   ```bash
   ./install-claude-config.sh
   ```

The installer will:
- Install Claude configuration files to `~/.claude/`
- Copy `claude/CLAUDE.md`, `claude/settings.json`, and `claude/commands/`
- Install Git hooks for automatic configuration management
- Set appropriate permissions
- Verify the installation

**Benefits of symlink approach:**
- Any changes to this repository are automatically reflected in Claude Code
- No need to manually sync configuration files
- Version control for your Claude Code settings
- Automatic sync checking on Claude Code session start
- Auto-commit and push of configuration changes

### Manual Installation

If you prefer manual installation using symlink:

```bash
# Remove existing .claude directory if it exists
rm -rf ~/.claude

# Create symlink to this repository
ln -s "$(pwd)" ~/.claude

# Set permissions
chmod 700 "$(pwd)"
chmod 600 "$(pwd)"/*
```

For traditional copy-based installation:

```bash
# Create the Claude configuration directory
mkdir -p ~/.claude

# Copy configuration files
cp CLAUDE.md ~/.claude/
cp settings.json ~/.claude/

# Set permissions
chmod 700 ~/.claude
chmod 600 ~/.claude/*
```

**Note:** The symlink approach is recommended for automatic synchronization.

## Configuration Details

### Language Settings
- **Conversation Language**: Japanese - All interactions with Claude
- **Code Documentation**: English - Comments, commit messages, and PR documentation
- **Variable/Function Names**: English - Descriptive naming conventions

### Development Features

#### Go
- **Philosophy**: Channels Rob Pike and knqyf263's approaches - simplicity, security-focused design
- **Automatic Formatting**: Uses `gofmt` and `goimports`
- **Error Handling**: Comprehensive error wrapping and handling patterns following defensive programming principles
- **Testing**: TDD workflow with table-driven tests
- **Package Structure**: Prefers `internal/` directory organization, follows existing project patterns

#### Python  
- **Philosophy**: Channels Guido van Rossum and Sebastián Ramírez's approaches - explicit, beautiful, developer-friendly code
- **Automatic Formatting**: Uses `ruff format` and `ruff check --fix`
- **Type Checking**: Uses `mypy` for static type analysis with extensive type hints
- **Testing**: Uses `pytest` with fixtures and parametrized tests
- **Package Management**: Uses `uv` for fast package management

#### Project Documentation
- **Automatic Documentation Generation**: Comprehensive documentation creation for projects
- **Multiple Documentation Types**: Architecture, package documentation, API specs, testing guides, contributing guidelines
- **Structured Documentation**: Follows consistent patterns and best practices
- **Design Philosophy Documentation**: Records package responsibilities and architectural decisions

### Commit Message Format
Follows conventional commits:
```
<type>(<scope>): <subject>

Examples:
feat(auth): add JWT token validation
fix(parser): handle empty input correctly
refactor: rename getUserData to fetchUserData
```

### TDD Workflow
Built-in workflow reminders:
1. 🧪 Write tests
2. 🛠️ Implementation
3. 🔄 Refactor
4. ✅ make test
5. 🎨 make fmt
6. 💾 commit

### Auto-Sync Features
- **Session Start Check**: Automatically checks if local configuration is in sync with upstream
- **Auto-Commit**: Git hooks automatically commit and push configuration file changes

## Usage Examples

### Starting a New Go Project
```bash
# Claude will automatically:
# 1. Check for existing project structure
# 2. Use appropriate package organization
# 3. Follow Go naming conventions
# 4. Set up proper error handling patterns
# 5. Create comprehensive tests
```

### Common Commands
The configuration includes shortcuts for:
- `make test` / `go test -v ./...` - Run Go tests
- `make fmt` / `go fmt ./...` / `goimports -w .` - Format Go code
- `uv run pytest` - Run Python tests
- `ruff format .` - Format Python code
- `ruff check --fix .` - Fix Python linting issues
- `mypy .` - Run Python type checking
- `ghq get <repo>` - Clone repository using ghq
- `./sync-check.sh` - Check sync status with upstream

### Custom Commands
Built-in Claude commands for development workflows:
- `/create-pull-request` - Create a new pull request with proper branch management and PR summary
- `/make-docs [type]` - Generate comprehensive project documentation (architecture, packages, api, testing, contributing, or all)
- `/init-repo` - Initialize new repositories with proper structure and conventions
- `/commit` - Enhanced commit workflow with conventional commit format
- `/refactor` - Structured refactoring workflow with safety checks

## Updating Configuration

### With Symlink Installation (Recommended)

If you used the symlink installation, updates are automatic:

```bash
# Navigate to the repository
cd $(ghq root)/github.com/masahiro331/claude-code-config

# Pull the latest changes
git pull origin main

# Changes are immediately available in Claude Code
# Status is automatically checked on next Claude Code session start
```

### With Copy-based Installation

If you used the traditional copy installation:

1. Pull the latest changes:
   ```bash
   cd $(ghq root)/github.com/masahiro331/claude-code-config
   git pull origin main
   ```

2. Run the installer again:
   ```bash
   ./install-claude-config.sh
   ```

## Auto-Sync Features

### Automatic Sync Checking
- On every Claude Code session start, the system checks if your local configuration is in sync with upstream
- You'll see notifications if updates are available or if your changes need to be pushed

### Automatic Commit and Push
- Git hooks automatically detect changes to `claude/CLAUDE.md` and `claude/settings.json`
- Changes are automatically committed with conventional commit messages
- Commits are automatically pushed to the remote repository

### Sync Status Messages
- 🟢 **Up to date**: Configuration matches upstream
- 🟡 **Behind upstream**: Updates available, run `git pull`
- 🔵 **Ahead of upstream**: Local changes will be pushed automatically
- 🟠 **Diverged**: Manual merge may be required

## Backup and Recovery

The installation script automatically creates backups of existing configuration in `~/.claude.backup.<timestamp>`.

To restore a backup:
```bash
# List available backups
ls -la ~/.claude.backup.*

# Remove symlink and restore from backup
rm ~/.claude
cp -r ~/.claude.backup.YYYYMMDD_HHMMSS ~/.claude
```

## Troubleshooting

### Claude CLI Not Found
```bash
# Install Claude CLI
curl -fsSL https://claude.ai/install.sh | sh

# Verify installation
claude --version
```

### Permission Issues
```bash
# Fix permissions
chmod 700 ~/.claude
chmod 600 ~/.claude/*
```

### Configuration Not Applied
1. Restart your terminal
2. Verify symlink is correctly set up:
   ```bash
   ls -la ~/.claude
   # Should show: ~/.claude -> /path/to/claude-code-config
   ```
3. If using symlink, verify target directory exists and has correct files:
   ```bash
   ls -la ~/.claude/
   ```
4. Check file permissions
5. Try running Claude Code in a new session

## Contributing

This is a personal configuration repository. If you'd like to suggest improvements:

1. Fork the repository
2. Make your changes
3. Create a pull request with a detailed description

## License

This configuration is provided as-is for personal use. Feel free to adapt it to your needs.