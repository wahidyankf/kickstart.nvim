# wkf-devbox Neovim Configuration

## Introduction

This is my personal Neovim configuration, forked from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and customized for my development workflow. The configuration has been restructured to be:

- Modular and well-organized
- Fully documented
- Easy to maintain and extend

## Structure

The configuration is organized into the following structure:

```
nvim/
├── init.lua                 # Main entry point
├── lua/
│   └── wahidyankf/         # Personal configuration namespace
│       ├── core/           # Core Neovim settings
│       ├── plugins/        # Plugin-specific configurations
│       └── lazy.lua        # Plugin management
```

## Features

- Modular configuration split into logical components
- Lazy-loaded plugins for fast startup
- Carefully curated set of plugins for optimal development experience
- Personal customizations while maintaining kickstart.nvim's core functionality

## Installation

### Prerequisites

External Requirements:

- Neovim (latest stable or nightly version)
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation) for file searching
- Clipboard tool (xclip/xsel/win32yank depending on platform)
- [Nerd Font](https://www.nerdfonts.com/) for icons (required - enabled by default)

### Install Steps

1. Backup your existing Neovim configuration if you have one:

   ```sh
   # On Unix systems (Linux/macOS)
   mv ~/.config/nvim ~/.config/nvim.bak
   mv ~/.local/share/nvim ~/.local/share/nvim.bak
   mv ~/.local/state/nvim ~/.local/state/nvim.bak
   mv ~/.cache/nvim ~/.cache/nvim.bak
   ```

2. Clone this repository:

   ```sh
   # On Unix systems (Linux/macOS)
   git clone https://github.com/wahidyankf/nvim.git ~/.config/nvim
   ```

3. Start Neovim:
   ```sh
   nvim
   ```

The first time you start Neovim, it will automatically:

1. Install the lazy.nvim plugin manager
2. Install all configured plugins
3. Set up all plugin configurations

## Customization

The configuration is organized into modules under the `lua/wahidyankf/` directory:

- `core/`: Contains core Neovim settings and basic configurations
- `plugins/`: Individual plugin configurations
- `lazy.lua`: Plugin definitions and lazy.nvim setup

To add or modify plugins, edit the appropriate files in the `plugins/` directory.

## Acknowledgments

This configuration is built upon [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), an excellent starting point for Neovim configuration. While maintaining its core principles, this version has been reorganized into a more modular structure for better maintainability.

## License

This configuration is available under the same license as kickstart.nvim. See [LICENSE.md](LICENSE.md) for more details.
