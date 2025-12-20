# Project - General Standards

## Core Philosophy

- **KISS (Keep It Simple, Stupid)**: Favor straightforward solutions over clever abstractions.
- **YAGNI (You Aren't Gonna Need It)**: Do not implement features until required.
- **Fail Fast**: Implement robust validation at the boundaries using Pydantic v2.

## Global Technical Standards

- **Python Version**: 3.11+ is mandatory for all modules.
- **Tooling**: `uv` is the exclusive manager for packages, environments, and tool execution.
- **Linting & Style**: Ruff for all linting and formatting (100-character line limit).
- **Validation**: Strict Pydantic v2 for data structures and configuration.
- **Testing**: `pytest` with TDD workflow; 80% minimum coverage required.

## Agent Delegation

For specialized tasks, use the appropriate agent persona and strictly follow their comprehensive manual:

- **@python-developer** For complex backend logic, FastAPI architecture, database/ORM performance, and testing strategies.
- **@devops-engineer** For infrastructure, Docker containerization, CI/CD pipelines, UV dependency management, and configuration.
- **@code-reviewer** For security audits, code quality checks, Git standards, and PR reviews.
- **@devnet-engineer** For network automation, multi-vendor abstraction, hardware safety, and deployment logic.

## Mandatory Workflows

### 1. Dependency Management

- Initialize: `uv init`
- Add Packages: `uv add <package>`
- Sync Environment: `uv sync --frozen`

### 2. Code Quality

- Lint: `ruff check . --fix`
- Format: `ruff format .`
- Test: `uv run pytest`

### 3. Git Standards

- Use **Conventional Commits** (`feat:`, `fix:`, `docs:`, etc.).
- Branching: `feature/`, `fix/`, or `hotfix/` followed by issue number.
- Commit signing via GPG is required for the `main` branch.

## Command Shortcuts

- **Build/Sync**: `uv sync`
- **Run Tests**: `uv run pytest`
- **Lint & Fix**: `ruff check . --fix && ruff format .`
- **Security Check**: `uv run pip-audit`
