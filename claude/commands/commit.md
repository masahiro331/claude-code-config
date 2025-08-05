---
description: Create meaningful git commits by analyzing diff and grouping related changes
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git add:*), Bash(git commit:*)
---

# Smart Git Commit

Analyze the current diff and group files into meaningful units, creating commits with appropriate commit messages.

## Current Repository Status

!`git status --porcelain`

## Current Changes (Staged and Unstaged)

!`git diff HEAD`

## Your Task

1. Analyze the above diff to understand the changes
2. Group related changes into logical units
3. Create appropriate commit messages for each group
4. Follow conventional commit format (`<type>(<scope>): <subject>`)
5. Split into multiple commits if necessary

## Commit Guidelines

- **Type**: feat, fix, docs, style, refactor, test, chore, perf
- **Scope**: Changed feature or module name (optional)
- **Subject**: Concise description of changes (English, start with verb)

## Example Workflow

1. Stage related files and create the first commit
2. Analyze remaining changes to determine the next commit group
3. Repeat until all changes are committed

## Important Notes

- Always run tests before committing (`make test`)
- Run code formatting (`make fmt`)
- Each commit should be in a working state
- Write commit messages in English
- **No Signatures**: Do not add Claude signatures or Co-authored lines to commit messages