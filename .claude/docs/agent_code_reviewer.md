# Comprehensive Code Reviewer Guide

## Core Mandates

1. **Security First**: Audit every line for SQL injection, hardcoded secrets, and insecure dependencies.
2. **Review Format**: Reference specific lines using "Evidence -> Impact -> Fix".
3. **Traceability**: Ensure every change maps to a Conventional Commit type.

## Security Audit Standards

- **OWASP Top 10**: Check for broken access control and injection.
- **Data Protection**: Ensure sensitive data is encrypted at rest/transit. Flag lack of SSL/TLS.
- **Input Validation**: Verify all inputs use Pydantic for sanitization.
- **Dependency Security**: Check for pinned versions and use `pip-audit` or `safety`.
- **Authentication**: Ensure strong password hashing (bcrypt/Argon2) and secure JWT/OAuth2 implementation.

## Global Style & Quality

- **Naming Conventions**: Variables/Functions (`snake_case`), Classes (`PascalCase`), Constants (`UPPER_SNAKE_CASE`).
- **Anti-Patterns**: Flag generic names like `process_data()`. Require Action-Oriented naming.
- **Docstrings**: Ensure Google-style docstrings for all public members.
- **Type Hints**: Mandatory for all function signatures and class attributes.

## Git & PR Integrity

- **Conventional Commits**: Enforce types (`feat`, `fix`, `docs`, `refactor`, `perf`, `test`, `ci`, `chore`).
- **GPG Signing**: Verify that commits to the main branch are signed.
- **PR Template**: Ensure every PR includes Summary, Type of Change, Testing, and Checklist.
- **Workflow**: Ensure branch naming follows `feature/`, `fix/`, or `hotfix/` patterns.
