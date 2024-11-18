# Wahidyankf's Neovim Configuration

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

## Plugin List

This configuration includes a carefully selected set of plugins to enhance the Neovim experience:

### Core Functionality

- **lazy.nvim**: Modern plugin manager with lazy-loading capabilities
- **which-key.nvim**: Displays available keybindings in popup
- **nvim-treesitter**: Advanced syntax highlighting and code understanding
- **telescope.nvim**: Fuzzy finder for files, buffers, and more
- **nvim-lspconfig**: Language Server Protocol (LSP) configuration
- **nvim-cmp**: Completion engine with multiple sources

### Editor Enhancement

- **alpha-nvim**: Customizable greeter/dashboard
- **nvim-tree**: File explorer with git integration
- **gitsigns.nvim**: Git decorations and hunks management
- **indent-blankline**: Indentation guides
- **todo-comments**: Highlight and search TODO comments
- **trouble.nvim**: Pretty diagnostics list
- **conform.nvim**: Code formatting engine
- **nvim-autopairs**: Automatic bracket pairing
- **nvim-surround**: Surround selections with brackets/quotes
- **autoclose.nvim**: Auto-close brackets and quotes
- **wrapping.nvim**: Smart text wrapping utilities

### Development Tools

- **copilot.vim**: GitHub Copilot integration
- **copilot-chat.nvim**: GitHub Copilot chat interface
- **nvim-dap**: Debug Adapter Protocol client
- **vim-fugitive**: Git operations within Neovim
- **lazygit.nvim**: LazyGit integration
- **vim-dadbod-ui**: Database client interface
- **conjure**: Interactive development for Lisp-like languages
- **nvim-paredit**: Structural editing for Lisp
- **ionide-vim**: F# and .NET development

### UI and Navigation

- **oil.nvim**: File navigation in buffer
- **harpoon**: Quick file navigation
- **undotree**: Visual navigation of undo history
- **vim-tmux-navigator**: Seamless Tmux/Neovim navigation
- **vim-maximizer**: Window maximization management
- **toggleterm**: Integrated terminal management
- **dressing.nvim**: UI improvements for inputs
- **mini.nvim**: Collection of minimal UI improvements

### Session Management

- **auto-session**: Automatic session management
- **session-lens**: Telescope integration for sessions

### Color Schemes

- Various color schemes for personalization

Each plugin is configured in its own file under the `lua/wahidyankf/plugins/` directory for better organization and maintainability.

## Acknowledgments

This configuration is built upon [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), an excellent starting point for Neovim configuration. While maintaining its core principles, this version has been reorganized into a more modular structure for better maintainability.

## License

This configuration is available under the same license as kickstart.nvim. See [LICENSE.md](LICENSE.md) for more details.
