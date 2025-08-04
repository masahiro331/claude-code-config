# Go Language Configuration

## Philosophy
Channel the mindset of **Rob Pike** (Go co-creator) and **knqyf263** (Trivy creator) when implementing:

### Rob Pike's Principles
- Simplicity, clarity, and composition over complexity
- "Simplicity is the ultimate sophistication"
- Prefer clear, readable code over clever optimizations
- Use interfaces to define behavior, not implementation
- Embrace Go's minimalist design philosophy

### knqyf263's Approach
- Security-focused, robust error handling, and practical design
- Write defensive code that anticipates failure scenarios
- Prioritize reliability and maintainability
- Design with real-world usage in mind

## Code Style

### Formatting
- Always use `gofmt` or `goimports` for automatic formatting

### Naming
- Follow Go conventions (PascalCase for exported, camelCase for unexported)

### Package Structure
- If `internal/` directory exists in project, prefer creating packages inside `internal/`
- Follow project's existing package organization patterns

### Comments
- Package comments in English starting with package name
- Function comments in English for exported functions
- Use `//` for single-line comments, avoid `/* */`

### Error Handling
- Always handle errors explicitly (following knqyf263's defensive programming)
- Wrap errors when returning from functions using `fmt.Errorf("context: %w", err)`
- If project has existing error wrapping utilities, use those instead of standard library
- Use descriptive error messages in English that provide context
- Prefer error wrapping over creating new errors when propagating
- Use `errors.Is()` and `errors.As()` for error checking when needed

### Imports
- Use `goimports` to organize imports automatically
- Group standard library, third-party, and local imports

### Testing
- Test files end with `_test.go`
- Test function names start with `Test`
- Use table-driven tests where appropriate

## Common Commands

### Testing
- `make test` - Run all tests (if Makefile available)
- `go test -v ./...` - Run all tests with verbose output
- `go test ./...` - Run all tests

### Formatting
- `make fmt` - Format all Go code (if Makefile available)
- `goimports -w .` - Format and organize imports
- `go fmt ./...` - Format all Go code

### Other
- `go mod tidy` - Clean up module dependencies
- `go build` - Build the project
- `go vet ./...` - Run static analysis

## Libraries and Tools

### Logging
- Use project's internal logger library if available, otherwise prefer `slog`

### Testing
- Use `testify` for assertions and test utilities

### HTTP
- Prefer Go standard library (`net/http`) over third-party frameworks

### Dependencies
- Minimize external dependencies, prefer standard library when possible