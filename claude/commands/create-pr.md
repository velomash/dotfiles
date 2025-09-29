---
description: Create a pull request with standardized template and proper branch management
allowed-tools: Bash(git:*), Read, Glob, Grep
---

Create a pull request for the changes with the following process:

1. **Check current branch**:
   - Run `git branch --show-current` to check if on main/master
   - If on main or master, create and checkout a new descriptive branch
   - Use format: `type/description-with-hyphens`

2. **Handle uncommitted changes**:
   - Run `git status` to check for uncommitted changes
   - If changes exist, ASK the user: "Should I include these changes in the commit or stash them?"
   - Wait for user response before proceeding

3. **Commit changes** (if user wants to include them):
   - Run `git diff` to show changes
   - Run `git log --oneline -5` to see recent commit message style
   - Stage and commit with proper message format following repository style
   - For sell-alias-org and alias-org, title must match regex: `^((added|changed|fixed|hotfixed|removed|internal|build)(\(.*\)): (.*))|((release|hotfix).*)$`
   - End commit message with:
     ```
     🤖 Generated with [Claude Code](https://claude.ai/code)
     
     Co-Authored-By: Claude <noreply@anthropic.com>
     ```

4. **Push branch**:
   - Push branch to remote with `-u` flag

5. **Create PR using `gh pr create`** with this template:

```markdown
## Purpose

<!--- What is the feature, bug, or other reason for making this change? --->
<!--- Please include links to tickets if they exist. --->

## Changes

<!--- What did you change and why? --->
<!-- Example list:
- [x] completed change 1
- [x] completed change 2
- [ ] incomplete change
-->

## Screenshots

<!--- If applicable, include screenshots to assist your teammates
in quickly understanding what was added / changed / fixed.  --->

## Feature Flags

<!-- Please add the name of your feature flag here  -->

## Testing Done

<!--- How do you know this works? --->
<!--- Did you test locally or write new specs? --->
```

6. **Use proper formatting**:
   - Use HEREDOC syntax for multi-line PR body
   - Include relevant links, tickets, or context provided in arguments
   - Mark completed changes with `[x]` and incomplete with `[ ]`
   - Add "N/A" for sections that don't apply

7. **Return the PR URL** when completed

Arguments: $ARGUMENTS (optional: PR title, additional context, ticket links, or branch name)