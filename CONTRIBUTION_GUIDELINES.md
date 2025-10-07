# Archane Contribution Guideline

<!--toc:start-->
- [Contents](#ProjectName)
  - [Contribution Guidelines](#contribution-guidelines)
  - [Commit Message Guidelines](#commit-message-guidelines)
  - [Pull Request Guidelines](#pull-request-guidelines)
<!--toc:end-->

 
## Contribution Guidelines
 
1. **Clone the Repository**: After forking, clone the repository to your local machine.
 
2. **Create a New Branch**: Always create a new branch for your changes. This keeps the project history clean and easy to navigate.
 
3. **Make Your Changes**: Make your changes in the new branch. Please follow the coding standards and conventions used throughout the project.
 
4. **Test Your Changes**: Before submitting your changes, make sure to test them thoroughly.
 
5. **Commit Your Changes**: Commit your changes with a clear and concise commit message.
 
6. **Push Your Changes**: Push your changes to your forked repository.
 
7. **Submit a Pull Request**: Finally, submit a pull request to the main repository. Please provide a clear and detailed description of the changes you've made.
 

## Commit Message Guidelines

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification for our commit messages. This leads to more readable messages that are easy to follow when looking through the project history.

Write clear, descriptive commit messages that explain what and why changes were made.

- Start with a short, imperative summary
- Include extra details if needed (reason, impact, dependencies).
- Keep lines ≤ 72 characters.
- Example: “feat: hyprlock sync script”

> Good messages make future reviews and collaboration easier.

A commit message should be structured as follows:
 
```gitcommit
<type>[optional scope]: <description>
[optional body]
[optional footer(s)]
```

Where `type` must be one of the following:

### Commit Message Types

Here's a more comprehensive list of commit types that you can use:

`feat`: Adding a new feature to the project

```markdown
feat: Add multi-image upload support
```

`fix`: Fixing a bug or issue in the project

```markdown
fix: Fix bug causing application to crash on startup
```

`docs`: Updating documentation in the project

```markdown
docs: Update documentation for API endpoints
```

`style`: Making cosmetic or style changes to the project (such as changing colors or formatting code)

```markdown
style: Update colors and formatting
```

`refactor`: Making code changes that don't affect the behavior of the project, but improve its quality or maintainability

```markdown
refactor: Remove unused code
```

`test`: Adding or modifying tests for the project

```markdown
test: Add tests for new feature
```

`chore`: Making changes to the project that don't fit into any other category, such as updating dependencies or configuring the build system

```markdown
chore: Update dependencies
```

`perf`: Improving performance of the project

```markdown
perf: Improve performance of image processing
```

`security`: Addressing security issues in the project

```markdown
security: Update dependencies to address security issues
```

`merge`: Merging branches in the project

```markdown
merge: Merge branch 'feature/branch-name' into develop
```

`revert`: Reverting a previous commit

```markdown
revert: Revert "Add feature"
```

`build`: Making changes to the build system or dependencies of the project

```markdown
build: Update dependencies
```

`ci`: Making changes to the continuous integration (CI) system for the project

```markdown
ci: Update CI configuration
```

`config`: Making changes to configuration files for the project

```markdown
config: Update configuration files
```

`deploy`: Making changes to the deployment process for the project

```markdown
deploy: Update deployment scripts
```

`init`: Creating or initializing a new repository or project

```markdown
init: Initialize project
```

`move`: Moving files or directories within the project

```markdown
move: Move files to new directory
```

`rename`: Renaming files or directories within the project

```markdown
rename: Rename files
```

`remove`: Removing files or directories from the project

```markdown
remove: Remove files
```

`update`: Updating code, dependencies, or other components of the project

```markdown
update: Update code
```

These are just some examples, and you can create your own custom commit types as well. However, it's important to use them consistently and write clear, descriptive commit messages to make it easy for others to understand the changes you've made.

**Important:** If you are planning to use a custom commit message type other than the ones listed above, make sure to add it to this list so that others can understand it as well. Create a pull request to add it to this file.

## Pull Request Guidelines
 
Follow the same naming convention for your pull requests as you do for your commits. A pull request should be structured.
 
1. **Reference Related Issues**: If your pull request is related to an existing issue, please reference it in your PR description.
 
2. **Describe Your Changes**: Provide a clear and detailed description of what changes you've made.
 
3. **Include Screenshots**: If your changes include UI updates, please include screenshots in your PR description.
 
4. **Wait for Review**: After submitting your PR, please wait for it to be reviewed and approved before merging.