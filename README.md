# Claude Code Configuration

Personal configuration files for Claude Code CLI with Japanese workflow preferences and Go development best practices.

## Features

- **Japanese Language Interface**: All interactions with Claude in Japanese
- **Go Development Optimized**: Configured for Go projects with proper formatting, error handling, and testing workflows
- **TDD Workflow Integration**: Built-in Test-Driven Development workflow reminders
- **Consistent Code Style**: Enforced English documentation and variable naming conventions
- **Git Workflow Integration**: Conventional commit message format and proper Git practices

## Files

- `CLAUDE.md` - Global user instructions for Claude Code
- `settings.json` - Claude Code CLI settings
- `install.sh` - Automated installation script

## Quick Setup

### Prerequisites

1. **Claude CLI**: Ensure Claude CLI is installed
   ```bash
   curl -fsSL https://claude.ai/install.sh | sh
   ```

2. **Required Tools** (for Go development):
   ```bash
   go install golang.org/x/tools/cmd/goimports@latest
   ```

### Installation

1. **Clone this repository**:
   ```bash
   ghq get masahiro331/claude-code-config
   cd $(ghq root)/github.com/masahiro331/claude-code-config
   ```

2. **Run the installation script**:
   ```bash
   ./install.sh
   ```

The installer will:
- Check if Claude CLI is installed
- Create a backup of existing configuration (if any)
- Install the configuration files to `~/.claude/`
- Set appropriate permissions
- Verify the installation

### Manual Installation

If you prefer manual installation:

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

## Configuration Details

### Language Settings
- **Conversation Language**: Japanese - All interactions with Claude
- **Code Documentation**: English - Comments, commit messages, and PR documentation
- **Variable/Function Names**: English - Descriptive naming conventions

### Go Development Features
- **Automatic Formatting**: Uses `gofmt` and `goimports`
- **Error Handling**: Comprehensive error wrapping and handling patterns
- **Testing**: TDD workflow with table-driven tests
- **Package Structure**: Prefers `internal/` directory organization

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
1. 🧪 Test作成 (Write tests)
2. 🛠️ 実装 (Implementation)
3. 🔄 リファクタ (Refactor)
4. ✅ make test
5. 🎨 make fmt
6. 💾 commit

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
- `make test` - Run all tests
- `make fmt` - Format all Go code
- `ghq get <repo>` - Clone repository using ghq

## Updating Configuration

To update your configuration:

1. Pull the latest changes:
   ```bash
   cd $(ghq root)/github.com/masahiro331/claude-code-config
   git pull origin main
   ```

2. Run the installer again:
   ```bash
   ./install.sh
   ```

## Backup and Recovery

The installation script automatically creates backups of existing configuration in `~/.claude.backup.<timestamp>`.

To restore a backup:
```bash
# List available backups
ls -la ~/.claude.backup.*

# Restore from backup
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
2. Verify files are in the correct location:
   ```bash
   ls -la ~/.claude/
   ```
3. Check file permissions
4. Try running Claude Code in a new session

## Contributing

This is a personal configuration repository. If you'd like to suggest improvements:

1. Fork the repository
2. Make your changes
3. Create a pull request with a detailed description

## License

This configuration is provided as-is for personal use. Feel free to adapt it to your needs.