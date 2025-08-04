# Git Workflow Configuration

## Git Workflow
- `git status` - Check repository status
- `git add .` - Stage all changes
- `git commit -m "message"` - Commit with message
- `git push` - Push to remote
- `ghq get <repo>` - Clone repository using ghq
- Use `ghq` command for repository management unless in CI environment

## Commit Strategy
- Small, focused commits for each feature unit
- Always ensure tests pass before committing
- Use conventional commit messages in English following format: `<type>(<scope>): <subject>`

## Commit Message Format
- **Format**: `<type>(<scope>): <subject>`
- **Type and scope**: Always lowercase
- **Scope**: Can be empty (omit parentheses if global change)
- **Signature**: Do not add Claude signature or co-authored lines to commit messages

### Allowed Types
- `feat`: New feature for the user
- `fix`: Bug fix for the user
- `perf`: Performance improvements
- `docs`: Documentation changes
- `style`: Formatting changes, missing semicolons, etc.
- `refactor`: Refactoring production code (e.g. renaming variables)
- `test`: Adding/refactoring tests, no production code change
- `build`: Build configuration, development tools updates
- `chore`: Dependency updates, other maintenance

### Scope Examples
- parser, controller, package namespace

### Examples
- `feat(auth): add JWT token validation`
- `fix(parser): handle empty input correctly`
- `refactor: rename getUserData to fetchUserData`