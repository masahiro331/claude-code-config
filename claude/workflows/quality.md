# Code Quality & Review Standards

## Code Quality Standards

### Documentation
- Write clear English comments for exported functions
- Use consistent naming conventions across languages

### Performance
- Write clear code first, optimize when necessary with benchmarks

### Security  
- Always validate input, sanitize user data, use secure defaults

### Testability
Is the implementation easy to test?
- Are dependencies injectable (using interfaces)?
- Are functions small and focused on single responsibility?
- Are external dependencies (DB, HTTP, filesystem) mockable?
- Can the code be tested without complex setup?
- Are side effects minimized and isolated?

## Important Instructions
- Do what has been asked; nothing more, nothing less
- NEVER create files unless they're absolutely necessary for achieving your goal
- ALWAYS prefer editing an existing file to creating a new one
- NEVER proactively create documentation files (*.md) or README files. Only create documentation files if explicitly requested by the User