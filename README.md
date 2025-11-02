# Neovim Configuration

A modern, modular Lua-based Neovim configuration optimized for Java and Lua development with comprehensive language server support, fuzzy finding, git integration, and a beautiful dark theme.

## 🎯 Features

- **Modern Lua Configuration** - Clean, modular setup using Lua and lazy.nvim plugin manager
- **Language Server Protocol (LSP)** - Built-in support for Java (JDTLS) and Lua (Lua-LS)
- **Java Development** - Comprehensive JDTLS configuration with Maven/Gradle support
- **Syntax Highlighting** - Treesitter-based syntax highlighting for 13+ languages
- **Fuzzy Finder** - Telescope for quick file, buffer, and content navigation
- **File Explorer** - Neo-tree for intuitive file and directory navigation
- **Git Integration** - Gitsigns for visual git change indicators
- **Auto-completion** - LSP-based completion with nvim-cmp
- **Auto-pairing** - Intelligent bracket and quote auto-pairing with treesitter awareness
- **Statusline** - Lualine with mode, file info, and git status
- **Beautiful Theme** - Catppuccin color scheme for pleasant coding experience

## 📁 Directory Structure

```
~/.config/nvim/
├── init.lua                 # Entry point - loads all configurations
├── lazy-lock.json          # Plugin version lock file (managed by lazy.nvim)
├── lsp/                    # Language server configurations
│   ├── jdtls.lua          # Java Language Server configuration
│   └── lua_ls.lua         # Lua Language Server configuration
└── lua/
    ├── config/            # Core configuration modules
    │   ├── global.lua     # Global editor settings
    │   ├── keymap.lua     # Key bindings and mappings
    │   ├── lazy.lua       # Plugin manager setup
    │   └── lsp.lua        # LSP configuration and diagnostics
    └── plugins/           # Individual plugin configurations
        ├── autopairs.lua  # Auto-closing brackets and quotes
        ├── catppuccin.lua # Color scheme setup
        ├── gitsigns.lua   # Git change indicators
        ├── lualine.lua    # Status line configuration
        ├── mason.lua      # LSP/formatter package manager
        ├── neo-tree.lua   # File explorer
        ├── telescope.lua  # Fuzzy finder
        └── treesitter.lua # Syntax highlighting and parsing
```

## ⚙️ Configuration Overview

### Global Settings (`lua/config/global.lua`)

Core editor settings:
- **Indentation:** 4 spaces
- **UI:** Line numbers enabled
- **Leader Keys:**
  - Space (`<leader>`) - Main leader key
  - Backslash (`<localleader>`) - Local leader key

### Key Bindings (`lua/config/keymap.lua`)

#### Telescope (Fuzzy Finder)
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files in project |
| `<leader>fg` | Live grep (search file contents) |
| `<leader>fb` | Search open buffers |
| `<leader>fh` | Search help tags |

#### Neo-tree (File Explorer)
| Key | Action |
|-----|--------|
| `<C-n>` | Toggle file explorer on left side |

#### LSP Features
- `<C-Space>` - Trigger auto-completion
- Hover documentation and diagnostics available via LSP

## 🔧 Language Server Setup

### Java Development (JDTLS)

Full-featured Java development environment:

**Configuration:**
- **Memory:** 1GB minimum, 2GB maximum heap
- **Features:**
  - Source code downloading
  - Code lenses for implementations and references
  - Decompiled source viewing
  - Interactive build configuration
  - Code formatting support
- **Build Systems:** Maven (`pom.xml`), Gradle (`build.gradle`, `build.gradle.kts`)
- **Workspace:** `~/.cache/jdtls-workspace`
- **Special Support:** Lombok annotation support for reduced boilerplate

**Quick Start for Java Projects:**
1. Open a Java file in your project
2. JDTLS will auto-initialize with project detection
3. Use `<leader>ff` to find files in your project
4. Hover over code for documentation
5. Use `<C-Space>` for completion

### Lua Development (Lua-LS)

Configuration for Neovim plugin development:

**Configuration:**
- **Runtime:** LuaJIT
- **Globals:** Vim API recognized
- **Root Detection:** `.luarc.json`, `.luarc.jsonc`, `.git`
- **Workspace:** Includes Neovim runtime files

## 📦 Plugin Management

Uses **lazy.nvim** for efficient plugin management with automatic bootstrapping.

### Installed Plugins

| Plugin | Purpose | Lazy Load |
|--------|---------|-----------|
| **mason.nvim** | LSP/formatter package manager | No |
| **telescope.nvim** | Fuzzy finder for files and content | Yes |
| **neo-tree.nvim** | File explorer | No |
| **nvim-treesitter** | Syntax highlighting & parsing | Yes |
| **catppuccin** | Color scheme | No |
| **lualine.nvim** | Statusline | Yes |
| **nvim-autopairs** | Auto-closing brackets | Yes |
| **gitsigns.nvim** | Git change indicators | Yes |
| **nvim-cmp** | Auto-completion engine | Yes |
| **plenary.nvim** | Utility library | Yes |
| **nui.nvim** | UI components | Yes |
| **nvim-web-devicons** | File icons | Yes |

### Treesitter Languages

Automatic syntax highlighting for:
- Java, C, Lua, Vim
- JavaScript, TypeScript, HTML, XML, JSON
- SQL, Markdown, Query

## 🎨 UI & UX Enhancements

### Diagnostics Display

Visual indicators for code issues:
- **Errors:** ✘ in red
- **Warnings:** ⚠ in yellow
- **Hints:** 💡 in blue
- **Info:** ℹ in gray

Displayed as:
- Virtual text after code
- Sign column indicators
- Underlined problematic code

### Git Integration (Gitsigns)

Visual git status indicators:
- `│` - Added lines
- `│` - Modified lines
- `_` - Deleted lines
- Line count limit: 40,000 lines per file

### Statusline (Lualine)

Shows:
- Current mode (Normal, Insert, Visual, etc.)
- File name and path
- File type
- Git branch and status
- Cursor position

## 🚀 Getting Started

### Prerequisites

- Neovim 0.9.0 or later
- Git (for version control features)
- Java JDK (for Java development)
- curl or wget (for plugin downloads)

### Installation

1. **Clone or place configuration:**
   ```bash
   git clone <your-repo> ~/.config/nvim
   # or use an existing directory
   ```

2. **Start Neovim:**
   ```bash
   nvim
   ```

3. **lazy.nvim will auto-bootstrap** and install all plugins on first run

4. **Install LSP servers via Mason:**
   ```vim
   :Mason
   ```
   Then install `jdtls` for Java and `lua-language-server` for Lua

### First Time Setup

1. Open Neovim: `nvim`
2. Run `:Mason` to open the package manager
3. Navigate with arrow keys and press `i` to install:
   - `jdtls` (Java Language Server)
   - `lua-language-server` (Lua)
4. Press `q` to close Mason

## 📚 Usage Examples

### Finding and Opening Files
```
<leader>ff    # Find any file in project
<leader>fg    # Search for text across all files
<leader>fb    # Switch between open buffers
```

### Editing Java Code
1. Open a `.java` file
2. Start typing and use `<C-Space>` for auto-completion
3. Hover over functions/classes for documentation
4. JDTLS will automatically format on save

### Navigating Large Projects
1. Press `<C-n>` to open file explorer
2. Use arrow keys to navigate directories
3. Press `Enter` to open files
4. Use `<leader>ff` to quickly jump to specific files

## 🔍 Customization

### Adding New Plugins

1. Create a new file in `lua/plugins/my_plugin.lua`
2. Define the plugin spec using lazy.nvim format
3. The plugin will auto-load on next Neovim start

Example:
```lua
-- lua/plugins/my_plugin.lua
return {
  "author/my-plugin",
  event = "VeryLazy",
  config = function()
    require("my_plugin").setup()
  end
}
```

### Modifying Key Bindings

Edit `lua/config/keymap.lua` to add or change mappings:

```lua
vim.keymap.set('n', '<leader>xx', '<cmd>MyCommand<cr>', { noremap = true })
```

### Changing Color Scheme

Edit `lua/plugins/catppuccin.lua` to modify theme colors or switch to another colorscheme.

### Adjusting Editor Settings

Edit `lua/config/global.lua` to modify:
- Indentation size
- Line number settings
- Tab behavior
- Other global options

## 🐛 Troubleshooting

### JDTLS Not Starting
- Ensure Java JDK is installed: `java -version`
- Check Maven/Gradle is available in PATH
- Run `:Mason` and verify `jdtls` is installed

### Lua-LS Not Working
- Verify `lua-language-server` is installed via `:Mason`
- Check that `.luarc.json` exists in your Lua project root

### Plugin Loading Issues
- Delete `lazy-lock.json` to reset plugin versions
- Run `:Lazy` to open the plugin manager UI
- Check for any error messages in logs

### Performance Issues
- Reduce treesitter parser count if too slow
- Disable gitsigns for very large files (auto-disabled at 40k lines)
- Use `:Lazy` to profile plugin loading times

## 📖 Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [lazy.nvim Guide](https://github.com/folke/lazy.nvim)
- [LSP Configuration](https://github.com/neovim/nvim-lspconfig)
- [Treesitter Documentation](https://github.com/nvim-treesitter/nvim-treesitter)
- [Telescope.nvim Guide](https://github.com/nvim-telescope/telescope.nvim)

## 🔄 Recent Updates

- Configure gitsigns plugin
- Add auto-pairs functionality
- Add Java Language Server (JDTLS) support
- Add LSP configuration framework
- Refactor configuration structure

## 📝 License

This configuration is provided as-is for personal use.

## 💡 Tips & Tricks

1. **Fast Navigation:** Use `<leader>ff` then start typing to fuzzy-find any file
2. **Smart Search:** `<leader>fg` to search for text patterns across your entire project
3. **Quick Edits:** Keep file explorer open with `<C-n>` for quick switching between files
4. **Git Context:** Check gitsigns indicators to see what's changed at a glance
5. **Documentation:** Hover over any symbol with LSP to see inline documentation

---

**Last Updated:** November 2, 2025

For issues or improvements, check the git history or modify as needed for your workflow.
