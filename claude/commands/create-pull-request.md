---
description: Create a pull request with proper branch management, using existing PR templates when available
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git log:*), Bash(git branch:*), Bash(git checkout:*), Bash(git push:*), Bash(gh pr create:*), Bash(gh pr list:*), Read(*), Glob(*)
argument-hint: [optional PR title]
---

# Create Pull Request

Create a new pull request with proper branch management. Automatically detects and uses existing GitHub PR templates when available, otherwise generates a comprehensive PR summary.

## Current Repository Status

!`git status --porcelain`

## Current Branch Information

!`git branch --show-current`

## Recent Commits on Current Branch

!`git log --oneline -10`

## Changes in Current Branch (vs main)

!`git diff main...HEAD`

## Your Task

1. **Template Detection**: Check for existing GitHub PR templates in standard locations
2. **Branch Analysis**: Analyze the current branch and its changes compared to the main branch
3. **Change Summary**: Understand what functionality has been added, modified, or fixed
4. **PR Creation**: Create a pull request using templates or generated description
5. **Branch Management**: Ensure the branch is properly pushed to remote if needed

## PR Creation Process

### 1. GitHub PR Template Detection
Check for PR templates in these locations (in order of priority):
- `.github/pull_request_template.md`
- `.github/PULL_REQUEST_TEMPLATE.md`
- `.github/pull_request_template/` directory (multiple templates)
- `docs/pull_request_template.md`

If templates are found:
- Use the default template or prompt for template selection if multiple exist
- Fill in template sections based on the changes analysis
- Preserve template structure and formatting

### 2. Pre-PR Checks
- Verify current branch is not `main` or `master`
- Check if branch exists on remote (push if needed)
- Analyze all commits and changes that will be included in the PR

### 3. PR Title Generation
If no title provided via `$ARGUMENTS`, generate based on:
- Conventional commit format: `<type>(<scope>): <subject>`
- Summary of the main changes
- Use the most significant change as the primary focus

### 4. PR Description Strategy

#### If PR Template Exists:
- Use the template structure
- Fill in relevant sections based on change analysis
- Maintain template's formatting and section headers
- Add detailed information for each template section

#### If No Template:
Generate comprehensive description with:
```markdown
## Summary
- [Bullet point summary of key changes]
- [Focus on the "why" rather than just the "what"]

## Changes Made
- [Detailed list of modifications]
- [New features, bug fixes, refactoring, etc.]

## Test Plan
- [How to test the changes]
- [Any specific testing scenarios]
- [Commands to run for verification]

## Notes
- [Any additional context or considerations]
- [Breaking changes, if any]
- [Dependencies or follow-up work needed]
```

### 5. Implementation Steps

1. **Template Search**: Look for PR templates in standard GitHub locations
2. **Branch Validation**: Ensure we're not on main/master branch
3. **Remote Sync**: Push current branch to remote if not already pushed
4. **Change Analysis**: Analyze all commits and file changes
5. **Description Generation**: Use template or create comprehensive description
6. **PR Creation**: Use `gh pr create` with generated title and description
7. **Verification**: Confirm PR was created successfully

## Guidelines

### Template Usage
- **Preserve Structure**: Keep original template format and sections
- **Complete Sections**: Fill in all relevant template sections thoroughly
- **Follow Instructions**: Pay attention to template comments and instructions
- **Maintain Style**: Use template's preferred formatting style

### PR Title Format
- Use conventional commit format when appropriate
- Be descriptive but concise (max 72 characters recommended)
- Start with imperative verb (Add, Fix, Update, etc.)

### Change Analysis
- **Comprehensive Review**: Examine all modified files and commits
- **Context Understanding**: Understand the broader impact of changes
- **Risk Assessment**: Identify potential breaking changes or side effects

## Safety Checks

1. **Never create PR from main/master**: Prevent accidental PRs from main branch
2. **Verify remote exists**: Ensure branch is pushed before creating PR
3. **Check for conflicts**: Warn if there might be merge conflicts
4. **Validate changes**: Ensure there are actual changes to include
5. **Template Validation**: Verify template exists and is readable

## Example Workflows

### With PR Template:
1. Detect `.github/pull_request_template.md`
2. Read template content
3. Analyze changes: Added user authentication
4. Fill template sections with auth implementation details
5. Create PR using filled template

### Without PR Template:
1. No templates found
2. Analyze changes: Bug fix in user validation
3. Generate title: `fix(validation): handle edge case in email validation`
4. Create comprehensive description
5. Create PR with generated content

## Error Handling

- **No templates found**: Proceed with generated description
- **Multiple templates**: List available templates and use default or ask for selection
- **Template read error**: Fall back to generated description
- **Branch issues**: Guide user through proper branch setup
- **Remote issues**: Help set up or push to remote

## Post-Creation

After successful PR creation:
- Provide the PR URL for easy access
- Show which template was used (if any)
- Suggest follow-up actions (assign reviewers, add labels, etc.)
- Remind about CI/CD checks if applicable