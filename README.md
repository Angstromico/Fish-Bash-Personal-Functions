# CachyOS Automation Suite

This repository provides modular automations for the Fish shell and Python utilities tailored for CachyOS and development workflows.

## Architecture

We use a decoupled architecture to ensure scalability:

- `fish/`: Contains shell-specific functions and configuration.
  - `functions/`: Reusable Fish functions.
  - `conf.d/`: Initialization scripts.
- `python/`: Contains core business logic and CLI entry points.
  - `src/cachy_utils/`: The core Python package containing internal utilities.
  - `bin/`: Executable CLI entry points that utilize the `cachy_utils` library.

## Getting Started

### Fish Functions
Add the `fish/functions` directory to your `$fish_function_path` or source them directly in your `config.fish`.

```fish
set -g fish_function_path $fish_function_path /path/to/Repos/Automatations/fish/functions
```

### Python Utilities
The Python tools are modular. Simply run the scripts in `python/bin/`:

```bash
./python/bin/cachy-helper.py
```

## Scalability & Maintenance

- **Modularity:** Python code is organized into a proper package (`src/cachy_utils`), allowing for easy testing and expansion.
- **Decoupling:** Shell logic is kept thin; heavy lifting is delegated to Python scripts.
- **Maintainability:** New features can be added by creating new Python modules in `src/` and new shell wrappers in `fish/functions/`.
