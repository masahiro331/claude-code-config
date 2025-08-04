# User Settings for Claude Code

## Language Settings

- **Conversation Language**: Japanese - All interactions with Claude should be in Japanese
- **Code Documentation**: English - Comments, commit messages, and Pull Request documentation should be in English
- **Variable/Function Names**: English - Use descriptive English names for variables, functions, and classes

## Code Style by Language

### Go
- **Philosophy**: Channel the mindset of **Rob Pike** (Go co-creator) and **knqyf263** (Trivy creator) when implementing
  - **Rob Pike's Principles**: Simplicity, clarity, and composition over complexity
    - "Simplicity is the ultimate sophistication"
    - Prefer clear, readable code over clever optimizations
    - Use interfaces to define behavior, not implementation
    - Embrace Go's minimalist design philosophy
  - **knqyf263's Approach**: Security-focused, robust error handling, and practical design
    - Write defensive code that anticipates failure scenarios
    - Prioritize reliability and maintainability
    - Design with real-world usage in mind
- **Formatting**: Always use `gofmt` or `goimports` for automatic formatting
- **Naming**: Follow Go conventions (PascalCase for exported, camelCase for unexported)
- **Package Structure**: 
  - If `internal/` directory exists in project, prefer creating packages inside `internal/`
  - Follow project's existing package organization patterns
- **Comments**: 
  - Package comments in English starting with package name
  - Function comments in English for exported functions
  - Use `//` for single-line comments, avoid `/* */`
- **Error Handling**: 
  - Always handle errors explicitly (following knqyf263's defensive programming)
  - Wrap errors when returning from functions using `fmt.Errorf("context: %w", err)`
  - If project has existing error wrapping utilities, use those instead of standard library
  - Use descriptive error messages in English that provide context
  - Prefer error wrapping over creating new errors when propagating
  - Use `errors.Is()` and `errors.As()` for error checking when needed
- **Imports**: 
  - Use `goimports` to organize imports automatically
  - Group standard library, third-party, and local imports
- **Testing**: 
  - Test files end with `_test.go`
  - Test function names start with `Test`
  - Use table-driven tests where appropriate

### Python
- **Philosophy**: Channel the mindset of **Guido van Rossum** (Python creator) and **Sebastián Ramírez** (FastAPI creator) when implementing
  - **Guido's Principles**: "Beautiful is better than ugly", "Explicit is better than implicit", "Simple is better than complex"
    - Follow PEP 20 (The Zen of Python) principles
    - Write code that reads like natural language
    - Prefer explicit over implicit behavior
  - **Sebastián's Approach**: Developer experience focused, type-safe, modern Python practices
    - Use type hints extensively for better IDE support and code clarity
    - Embrace modern Python features (3.8+)
    - Design APIs that are intuitive and self-documenting
- **Formatting**: Always use `ruff format` for code formatting and `ruff check --fix` for import sorting and linting
- **Naming**: Follow PEP 8 conventions (snake_case for variables/functions, PascalCase for classes)
- **Package Structure**: 
  - Use `src/` layout for packages when creating distributable packages
  - Follow project's existing package organization patterns
  - Prefer flat over nested when possible
- **Comments**: 
  - Use docstrings for modules, classes, and functions (Google or NumPy style)
  - Use `#` for inline comments
  - Type hints should reduce need for explanatory comments
- **Error Handling**: 
  - Use specific exception types, avoid bare `except:`
  - Create custom exceptions when appropriate
  - Use context managers (`with` statements) for resource management
  - Follow "Easier to Ask for Forgiveness than Permission" (EAFP) principle
- **Imports**: 
  - Use `ruff check --fix` to organize imports automatically
  - Group standard library, third-party, and local imports
  - Prefer absolute imports over relative
  - Use `from __future__ import annotations` for forward references (Python 3.7+)
- **Type Hints**: 
  - Use type hints for all function signatures and class attributes
  - Use `typing` module utilities (`List`, `Dict`, `Optional`, etc.)
  - Use `Union` sparingly, prefer more specific types
  - Use `Protocol` for structural typing when appropriate
- **Testing**: 
  - Test files start with `test_` or end with `_test.py`
  - Test function names start with `test_`
  - Use `pytest` for testing framework
  - Use fixtures for test setup and teardown
  - Use parametrized tests for multiple scenarios

## Common Commands

### Frequently Used Commands
- `make test` - Run all tests (or `go test -v ./...` if Makefile not available)
- `make fmt` - Format all Go code (or `go fmt ./...` / `goimports -w .` if Makefile not available)
- `uv run pytest` - Run Python tests (or `pytest` if available globally)
- `ruff format .` - Format Python code with Ruff
- `ruff check --fix .` - Fix linting issues and sort imports with Ruff
- `mypy .` - Run type checking with mypy

### Git Workflow
- `git status` - Check repository status
- `git add .` - Stage all changes
- `git commit -m "message"` - Commit with message
- `git push` - Push to remote
- `ghq get <repo>` - Clone repository using ghq
- Use `ghq` command for repository management unless in CI environment

### Custom Commands
- `/create-pull-request` - Create a new pull request with proper branch management and PR summary

### Project Documentation
- **Documentation Location**: If `docs/` directory exists in project root, read relevant documentation before starting work
  - Check for architecture docs, API specifications, contribution guidelines
  - Look for project-specific coding standards or conventions
  - Reference existing examples and patterns in the documentation
- **Documentation Creation**: When developing features, create and update documentation in `docs/` directory
  - Document design decisions and architecture changes
  - Record testing strategies and methodologies used
  - Create API documentation for new endpoints or interfaces
  - Update existing documentation when making changes to functionality
  - Document package responsibilities and design philosophy
    - Explain the single responsibility of each package/module
    - Document the design principles and patterns applied
    - Record the rationale behind architectural choices
    - Describe how the package fits into the overall system design
  - Use clear English for all documentation content

## Development Preferences

### Libraries and Tools

#### Go
- **Logging**: Use project's internal logger library if available, otherwise prefer `slog`
- **Testing**: Use `testify` for assertions and test utilities
- **HTTP**: Prefer Go standard library (`net/http`) over third-party frameworks
- **Dependencies**: Minimize external dependencies, prefer standard library when possible

#### Python
- **Package Manager**: Use `uv` for fast Python package and project management
- **Logging**: Use standard library `logging` or `structlog` for structured logging
- **Testing**: Use `pytest` for testing framework, `pytest-mock` for mocking
- **HTTP**: Use `httpx` for HTTP client, `fastapi` or `flask` for web frameworks
- **Type Checking**: Use `mypy` for static type checking
- **Linting & Formatting**: Use `ruff` for all code quality tasks (linting, formatting, import sorting)
- **Dependencies**: Use `uv` for dependency management, prefer established libraries

### Development Methodology
- **TDD (Test-Driven Development)**: Follow **t-wada (Takuto Wada)'s TDD philosophy**
  - **Red-Green-Refactor Cycle**: Always start with failing test, make it pass, then improve design
  - **Small Steps**: Take smallest possible steps to maintain control and understanding
  - **Test Quality**: Tests should be as clean and maintainable as production code
  - **Listening to Tests**: Pay attention to what tests tell you about design
- **Development Workflow**: 
  1. Write test for small functionality unit (Red)
  2. Implement minimal code to make test pass (Green)
  3. Refactor if needed while keeping tests green (Refactor)
  4. Run tests (`make test`, `go test -v ./...`, or `uv run pytest`) to ensure all tests pass
  5. Format code (`make fmt`, `go fmt ./...` / `goimports -w .`, or `ruff format . && ruff check --fix .`)
  6. Run type checking (`mypy .`) for Python projects
  7. Commit changes with descriptive English commit message
  8. Repeat for next small feature

### Testing Strategy
- Write unit tests for all business logic
- Use table-driven tests for multiple scenarios
- Mock external dependencies using interfaces
- Aim for high test coverage on critical paths

### Commit Strategy
- Small, focused commits for each feature unit
- Always ensure tests pass before committing
- Use conventional commit messages in English following format: `<type>(<scope>): <subject>`

### Commit Message Format
- **Format**: `<type>(<scope>): <subject>`
- **Type and scope**: Always lowercase
- **Scope**: Can be empty (omit parentheses if global change)
- **Signature**: Do not add Claude signature or co-authored lines to commit messages
- **Allowed types**:
  - `feat`: New feature for the user
  - `fix`: Bug fix for the user
  - `perf`: Performance improvements
  - `docs`: Documentation changes
  - `style`: Formatting changes, missing semicolons, etc.
  - `refactor`: Refactoring production code (e.g. renaming variables)
  - `test`: Adding/refactoring tests, no production code change
  - `build`: Build configuration, development tools updates
  - `chore`: Dependency updates, other maintenance
- **Scope examples**: parser, controller, package namespace
- **Examples**:
  - `feat(auth): add JWT token validation`
  - `fix(parser): handle empty input correctly`
  - `refactor: rename getUserData to fetchUserData`

### Code Quality & Review Standards
- **Documentation**: Write clear English comments for exported functions
- **Performance**: Write clear code first, optimize when necessary with benchmarks
- **Security**: Always validate input, sanitize user data, use secure defaults
- **Testability**: Is the implementation easy to test?
  - Are dependencies injectable (using interfaces)?
  - Are functions small and focused on single responsibility?
  - Are external dependencies (DB, HTTP, filesystem) mockable?
  - Can the code be tested without complex setup?
  - Are side effects minimized and isolated?