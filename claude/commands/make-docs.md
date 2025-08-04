---
description: Generate comprehensive project documentation in the docs/ directory. Types: architecture, packages, api, testing, contributing, all (default)
allowed-tools: Glob(*), Read(*), Write(*.md), Bash(ls, find, head, tail, wc, grep)
---

# /make-docs

Generate comprehensive project documentation in the `docs/` directory.

## Usage

```
/make-docs [type]
```

## Arguments

- `type` (optional): Specify the type of documentation to generate
  - `architecture` - Project architecture and design overview
  - `packages` - Package structure and responsibilities
  - `api` - API documentation and interfaces
  - `testing` - Testing strategies and methodologies
  - `contributing` - Contribution guidelines and development workflow
  - `all` - Generate all documentation types (default)

## Examples

```bash
# Generate all documentation
/make-docs

# Generate only architecture documentation
/make-docs architecture

# Generate package documentation
/make-docs packages
```

## Generated Files

The command creates the following files in the `docs/` directory:

- `ARCHITECTURE.md` - Project architecture and design principles
- `PACKAGES.md` - Package structure and responsibilities
- `API.md` - API documentation and interface specifications
- `TESTING.md` - Testing strategies and methodologies
- `CONTRIBUTING.md` - Development workflow and contribution guidelines

## Features

- **Automatic Analysis**: Scans the codebase to understand project structure
- **Language Detection**: Adapts documentation based on detected languages (Go, Python, etc.)
- **Package Mapping**: Documents package responsibilities and dependencies
- **Design Patterns**: Records architectural decisions and patterns used
- **Testing Coverage**: Documents test strategies and coverage requirements

## Implementation

This command:

1. Creates the `docs/` directory if it doesn't exist
2. Analyzes the project structure and codebase
3. Generates appropriate documentation based on the project type
4. Follows English documentation standards as specified in CLAUDE.md
5. Creates well-structured, maintainable documentation files

## Notes

- Documentation is written in English following project conventions
- Files are created with appropriate headings and structure
- Existing files are updated rather than overwritten when possible
- The command respects existing documentation and enhances it