# Development Workflow Configuration

## Development Methodology

### TDD (Test-Driven Development)
Follow **t-wada (Takuto Wada)'s TDD philosophy**:

#### Red-Green-Refactor Cycle
- Always start with failing test, make it pass, then improve design

#### Small Steps
- Take smallest possible steps to maintain control and understanding

#### Test Quality
- Tests should be as clean and maintainable as production code

#### Listening to Tests
- Pay attention to what tests tell you about design

### Development Workflow
1. Write test for small functionality unit (Red)
2. Implement minimal code to make test pass (Green)
3. Refactor if needed while keeping tests green (Refactor)
4. Run tests (see `tools/commands.md` and `languages/*.md`)
5. Format code (see `tools/commands.md` and `languages/*.md`)  
6. Run type checking if applicable (see `languages/*.md`)
7. Commit changes with descriptive English commit message
8. Repeat for next small feature

## Testing Strategy

### General Principles
- Write unit tests for all business logic
- Use table-driven tests for multiple scenarios
- Mock external dependencies using interfaces
- Aim for high test coverage on critical paths

Language-specific testing details are available in:
- Go: See `languages/go.md` for Go testing conventions
- Python: See `languages/python.md` for Python testing frameworks

## Project Documentation

### Documentation Location
If `docs/` directory exists in project root, read relevant documentation before starting work:
- Check for architecture docs, API specifications, contribution guidelines
- Look for project-specific coding standards or conventions
- Reference existing examples and patterns in the documentation

### Documentation Creation
When developing features, create and update documentation in `docs/` directory:
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