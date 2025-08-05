# User Settings for Claude Code

## Language Settings

- **Conversation Language**: Japanese - All interactions with Claude should be in Japanese
- **Code Documentation**: English - Comments, commit messages, and Pull Request documentation should be in English
- **Variable/Function Names**: English - Use descriptive English names for variables, functions, and classes

## Core Development Practices (Always Applied)

@workflows/development.md
@workflows/quality.md

## Language-Specific Configuration

Programming language configurations are modularized in separate files:

- **Go**: See `languages/go.md` for Go development practices, philosophy, and code style
- **Python**: See `languages/python.md` for Python development practices, philosophy, and code style

## Additional Workflows

Additional workflow configurations:

- **Git Workflow**: See `workflows/git.md` for commit conventions and Git practices

## Tools and Commands

Tool configurations and common commands:

- **Common Commands**: See `tools/commands.md` for frequently used development commands

## Mandatory Documentation Management

Three essential documents are automatically managed via hooks:

### MEETING_NOTE.md
- **Purpose**: Records all Claude interactions as meeting minutes
- **Auto-creation**: Generated at session start with timestamp
- **Content**: Objectives, key discussions, decisions, action items
- **Management**: Automatically initialized, manually updated during sessions

### SYSTEM_OVERVIEW.md  
- **Purpose**: Documents product overview and individual feature specifications
- **Auto-creation**: Triggered by system/architecture-related keywords
- **Content**: Product overview, core features, architecture, technical stack
- **Management**: Created when system discussions occur, maintained manually

### ROADMAP.md
- **Purpose**: Manages feature requests and implementation status
- **Auto-creation**: Triggered by feature request/planning keywords  
- **Content**: Completed features, in-progress items, planned features, blockers
- **Management**: Created when feature discussions occur, serves as TODO tracker

These documents are mandatory for all projects and help maintain comprehensive project documentation automatically.

## File Structure

This configuration is organized into:
- `languages/` - Language-specific settings (Go, Python)
- `workflows/` - Development workflow configurations
- `tools/` - Command references and tool configurations
- `commands/` - Custom Claude command definitions

Each file contains detailed configuration for its specific domain, keeping context focused and manageable.
