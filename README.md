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

## Fish Functions Reference

### `join-videos`

Joins two or more video files into a single output file using FFmpeg's stream copy (no re-encoding, lossless and fast).

#### Prerequisites

```bash
sudo pacman -S ffmpeg
```

#### Usage

```fish
join-videos video1.mp4 video2.mp4 [video3.mp4 ...] output.mp4
```

- Pass **at least two input files** followed by the **output filename** as the last argument.
- Uses `ffmpeg -f concat -c copy` under the hood — no quality loss, near-instant concatenation.

#### Example

```fish
join-videos part1.mp4 part2.mp4 part3.mp4 full_video.mp4
```

---

## Scalability & Maintenance

- **Modularity:** Python code is organized into a proper package (`src/cachy_utils`), allowing for easy testing and expansion.
- **Decoupling:** Shell logic is kept thin; heavy lifting is delegated to Python scripts.
- **Maintainability:** New features can be added by creating new Python modules in `src/` and new shell wrappers in `fish/functions/`.
