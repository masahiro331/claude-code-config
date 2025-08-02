---
description: Perform systematic refactoring of code while maintaining functionality and improving quality
allowed-tools: Read(*), Grep(*), Glob(*), Edit(*), MultiEdit(*), Bash(make test:*), Bash(make fmt:*), Bash(go test -v:*), Bash(go fmt:*), Bash(goimports:*), TodoWrite(*)
---

# Code Refactoring Assistant

Perform systematic refactoring of the specified code while maintaining functionality and improving code quality.

## Target: ${1:file or directory to refactor}

## Refactoring Process

### 1. Current State Analysis
- Understand target code structure and dependencies
- Check existing test cases (create if none exist)
- Identify refactoring targets

### 2. Test Creation (TDD Principles)
- **If no existing tests**: Create tests to guarantee current behavior
- **If existing tests**: Verify test coverage and supplement missing parts
- Ensure all tests pass before refactoring

### 3. Refactoring Planning
Identify improvement points from these perspectives:
- **Readability**: Variable names, function names, comments
- **Maintainability**: Function decomposition, duplicate code removal
- **Performance**: Optimization of unnecessary processing
- **Design**: SOLID principles, dependency injection
- **Testability**: Mockability, single responsibility

### 4. Implementation
1. Confirm tests pass (`make test` or `go test -v ./...`)
2. Execute refactoring in small units
3. Run tests after each step
4. Apply code formatting (`make fmt` or `go fmt ./...` / `goimports -w .`)

### 5. Verification
- Confirm all tests pass
- Verify no performance degradation
- Ensure external interfaces remain unchanged

## Refactoring Guidelines

### Go Language Specific
- **Naming Conventions**: Follow Go conventions (PascalCase/camelCase)
- **Error Handling**: Proper error wrapping
- **Interfaces**: Abstract when necessary
- **Package Structure**: Utilize internal/ directory
- **Test Files**: Create in `*_test.go` format

### General Guidelines
- **Single Responsibility Principle**: Each function has a single responsibility
- **DRY Principle**: Remove duplicate code
- **YAGNI**: Avoid unnecessary complexity
- **Test Coverage**: Maintain coverage after refactoring

## Safety Measures

1. **Test First**: Always create or verify tests before refactoring
2. **Test Execution**: Run `make test` or `go test -v ./...` after each change
3. **Code Formatting**: Run `make fmt` or `go fmt ./...` / `goimports -w .` after each change
4. **Small Changes**: Don't make large changes at once
5. **Functionality Preservation**: Don't change external interfaces

## TDD Philosophy (Following t-wada's Approach)

This refactoring process follows **t-wada (Takuto Wada)'s TDD philosophy**:

### Core Principles
- **Red-Green-Refactor Cycle**: Always start with a failing test (Red), make it pass with minimal code (Green), then improve the design (Refactor)
- **Small Steps**: Take the smallest possible steps to maintain control and understanding
- **Test Quality**: Tests should be as clean and maintainable as production code
- **Triangulation**: Use multiple examples to drive out the correct abstraction
- **Listening to Tests**: Pay attention to what tests tell you about your design

### TDD Workflow Integration

1. 🧪 **Test (Red)**: Create/verify tests for existing functionality - start with failing tests
2. 🛠️ **Refactor (Green)**: Execute refactoring in small units to make tests pass
3. 🔄 **Verify (Refactor)**: Improve design while keeping tests green
4. ✅ **Test**: Run `make test` or `go test -v ./...` for comprehensive testing
5. 🎨 **Format**: Apply `make fmt` or `go fmt ./...` / `goimports -w .` for code formatting
6. 💾 **Commit**: Commit in meaningful units

## Output Format

After refactoring completion, provide:
- Summary of changes made
- Improvements achieved
- Description of tests created
- Future improvement suggestions (if any)