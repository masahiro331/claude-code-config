---
description: Initialize git repository with remote GitHub repository creation and setup
allowed-tools: Bash(git init:*), Bash(git add:*), Bash(git commit:*), Bash(git branch:*), Bash(git remote:*), Bash(git push:*), Bash(gh repo create:*), Bash(gh repo view:*), Bash(pwd:*), Bash(ls:*), Bash(basename:*), Bash(gh api:*), Read(*), LS(*)
argument-hint: [optional repository description]
---

# Initialize Repository

Initialize a new git repository in the current directory and create corresponding GitHub remote repository with proper setup.

## Current Directory Status

!`pwd`

!`ls -la`

## Repository Initialization Process

### 1. Pre-initialization Checks
- Verify current directory is not already a git repository
- Check if directory contains files that should be included in initial commit
- Ensure GitHub CLI (`gh`) is authenticated and available

### 2. Local Repository Setup
- Initialize git repository with `git init`
- Create initial commit with existing files (if any)
- Set default branch to `main`

### 3. Remote Repository Creation
- Create GitHub repository using `gh repo create`
- Use current directory name as repository name
- Set repository description from argument or generate default
- Configure repository as private by default (can be modified)

### 4. Remote Configuration
- Add GitHub repository as `origin` remote
- Set upstream branch tracking
- Push initial commit to remote
- Set main branch as default

## Implementation Steps

### Step 1: Environment Validation
1. Check if current directory is already a git repository
2. Verify `gh` CLI is installed and authenticated
3. Confirm current directory name for repository naming

### Step 2: Local Git Initialization
1. Run `git init` to initialize repository
2. Create `.gitignore` file if not exists (optional)
3. Stage all existing files with `git add .`
4. Create initial commit with message "Initial commit"
5. Rename default branch to `main` if needed

### Step 3: GitHub Repository Creation
1. Extract repository name from current directory
2. Create GitHub repository using `gh repo create`
3. Use provided description or default message
4. Set repository visibility (private by default)

### Step 4: Remote Setup and Push
1. Add GitHub repository as origin remote
2. Set upstream branch for main
3. Push initial commit to GitHub
4. Verify remote connection

## Command Workflow

```bash
# Check if already a git repo
git status 2>/dev/null && echo "Already a git repository" && exit 1

# Initialize local repository
git init
git add .
git commit -m "Initial commit"
git branch -M main

# Create GitHub repository
REPO_NAME=$(basename $(pwd))
gh repo create $REPO_NAME --private --description "$DESCRIPTION"

# Setup remote and push
git remote add origin https://github.com/$(gh api user --jq .login)/$REPO_NAME.git
git push -u origin main
```

## Safety Checks

1. **Existing Repository**: Don't initialize if directory is already a git repository
2. **GitHub Authentication**: Verify `gh` CLI is properly authenticated
3. **Repository Name**: Use current directory name, validate it's appropriate
4. **File Staging**: Only stage appropriate files (respect .gitignore)
5. **Remote Conflicts**: Check if repository name already exists on GitHub

## Post-Initialization Actions

After successful initialization:
- Display repository URL for easy access
- Show git status to confirm setup
- Provide next steps guidance (README creation, etc.)
- Suggest setting up branch protection rules if needed

## Error Handling

- **Already git repo**: Inform user and exit gracefully
- **GitHub authentication**: Guide user to authenticate with `gh auth login`
- **Repository exists**: Suggest alternative names or deletion
- **Network issues**: Provide retry suggestions
- **Permission errors**: Check file/directory permissions

## Arguments

- `$ARGUMENTS`: Optional repository description
  - If provided: Use as GitHub repository description
  - If empty: Use default description "Repository created with claude-code-config"

## Example Usage

```bash
# Initialize with default description
/init-repo

# Initialize with custom description
/init-repo "My awesome project for learning Go"
```

## Integration with ghq Workflow

This command is designed to work after using `ghq` to create a new project directory:

1. `ghq create username/project-name`
2. `cd $(ghq root)/github.com/username/project-name`
3. `/init-repo "Project description"`

## Expected Outcomes

After successful execution:
- Local git repository initialized with main branch
- GitHub repository created and linked as origin
- Initial commit pushed to GitHub
- Ready for development with proper remote tracking