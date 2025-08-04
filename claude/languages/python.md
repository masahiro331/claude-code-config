# Python Language Configuration

## Philosophy
Channel the mindset of **Guido van Rossum** (Python creator) and **Sebastián Ramírez** (FastAPI creator) when implementing:

### Guido's Principles
- "Beautiful is better than ugly", "Explicit is better than implicit", "Simple is better than complex"
- Follow PEP 20 (The Zen of Python) principles
- Write code that reads like natural language
- Prefer explicit over implicit behavior

### Sebastián's Approach
- Developer experience focused, type-safe, modern Python practices
- Use type hints extensively for better IDE support and code clarity
- Embrace modern Python features (3.8+)
- Design APIs that are intuitive and self-documenting

## Code Style

### Formatting
- Always use `ruff format` for code formatting and `ruff check --fix` for import sorting and linting

### Naming
- Follow PEP 8 conventions (snake_case for variables/functions, PascalCase for classes)

### Package Structure
- Use `src/` layout for packages when creating distributable packages
- Follow project's existing package organization patterns
- Prefer flat over nested when possible

### Comments
- Use docstrings for modules, classes, and functions (Google or NumPy style)
- Use `#` for inline comments
- Type hints should reduce need for explanatory comments

### Error Handling
- Use specific exception types, avoid bare `except:`
- Create custom exceptions when appropriate
- Use context managers (`with` statements) for resource management
- Follow "Easier to Ask for Forgiveness than Permission" (EAFP) principle

### Imports
- Use `ruff check --fix` to organize imports automatically
- Group standard library, third-party, and local imports
- Prefer absolute imports over relative
- Use `from __future__ import annotations` for forward references (Python 3.7+)

### Type Hints
- Use type hints for all function signatures and class attributes
- Use `typing` module utilities (`List`, `Dict`, `Optional`, etc.)
- Use `Union` sparingly, prefer more specific types
- Use `Protocol` for structural typing when appropriate

### Testing
- Test files start with `test_` or end with `_test.py`
- Test function names start with `test_`
- Use `pytest` for testing framework
- Use fixtures for test setup and teardown
- Use parametrized tests for multiple scenarios

## Common Commands

### Testing
- `uv run pytest` - Run Python tests (preferred)
- `pytest` - Run tests (if available globally)
- `pytest -v` - Run tests with verbose output

### Formatting and Linting
- `ruff format .` - Format Python code with Ruff
- `ruff check --fix .` - Fix linting issues and sort imports with Ruff
- `ruff check .` - Check for linting issues

### Type Checking
- `mypy .` - Run type checking with mypy
- `uv run mypy .` - Run type checking via uv

### Package Management
- `uv add <package>` - Add a dependency
- `uv remove <package>` - Remove a dependency
- `uv sync` - Sync dependencies
- `uv run <command>` - Run command in virtual environment

## Libraries and Tools

### Package Manager
- Use `uv` for fast Python package and project management

### Logging
- Use standard library `logging` or `structlog` for structured logging

### Testing
- Use `pytest` for testing framework, `pytest-mock` for mocking

### HTTP
- Use `httpx` for HTTP client, `fastapi` or `flask` for web frameworks

### Type Checking
- Use `mypy` for static type checking

### Linting & Formatting
- Use `ruff` for all code quality tasks (linting, formatting, import sorting)

### Dependencies
- Use `uv` for dependency management, prefer established libraries