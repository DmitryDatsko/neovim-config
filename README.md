# neovim-config

Personal Neovim configuration written in Lua, managed with [lazy.nvim](https://github.com/folke/lazy.nvim). Built primarily around **.NET/C# development** (Roslyn LSP, `netcoredbg` debugging, `neotest-vstest` test running), with general-purpose support for Lua, Rust, C, web, and markdown.

- Colorscheme: [everforest](https://github.com/sainnhe/everforest)
- Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim)
- LSP/DAP/formatter installation: [mason.nvim](https://github.com/mason-org/mason.nvim)
- Leader key: `<Space>`

## Dependencies

Not bundled with the config — need to be present on the system for everything to work.

| Tool | Used for |
|---|---|
| Neovim ≥ 0.10 | the editor itself |
| git | cloning the config and plugins |
| Nerd Font | icons in `mini.icons`, `lualine`, `telescope`, `incline` |
| ripgrep (`rg`) | `telescope` live grep |
| fd | fast file search in `telescope` |
| make + C compiler (gcc/clang) | building `telescope-fzf-native`, treesitter parsers |
| unzip, curl, wget | required by `mason.nvim` to download LSP/DAP servers |
| .NET SDK | building/running C# projects, required by `roslyn.nvim`, `csharpier`, `netcoredbg` |

Rust toolchain (`rustc`/`cargo`) is **not** required — `blink.cmp`'s fuzzy matcher and `rust_analyzer` both use prebuilt binaries fetched by their installers, not a local Rust build.

Bootstrap command (`lua/config/lazy.lua`) clones `lazy.nvim` itself on first launch; no manual step needed there.

## Layout

```
.
├── init.lua                 # entry point
├── lua/
│   ├── current-theme.lua    # active colorscheme
│   ├── config/
│   │   ├── autocmds.lua     # autocommands
│   │   ├── keymaps.lua      # global keymaps
│   │   ├── lazy.lua         # lazy.nvim bootstrap
│   │   └── options.lua      # vim.opt settings
│   └── plugins/             # one spec file per plugin
└── lazy-lock.json           # pinned plugin versions
```

## Plugins

### Core

| Plugin | Description |
|---|---|
| [folke/lazy.nvim](https://github.com/folke/lazy.nvim) | plugin manager, lazy-loading |

### Appearance

| Plugin | Description |
|---|---|
| [sainnhe/everforest](https://github.com/sainnhe/everforest) | colorscheme |
| [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | statusline |
| [b0o/incline.nvim](https://github.com/b0o/incline.nvim) | floating winbar with filename and diagnostics |
| [Bekaboo/dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim) | breadcrumbs / symbol navigation (`enabled = false` in this config) |
| [echasnovski/mini.icons](https://github.com/echasnovski/mini.icons) | file/filetype icons, mocked as `nvim-web-devicons` |
| [folke/noice.nvim](https://github.com/folke/noice.nvim) | UI overhaul for cmdline, messages, search |
| [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) | notification popups (noice dependency) |
| [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim) | UI component library (noice dependency) |

### Navigation & search

| Plugin | Description |
|---|---|
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | fuzzy finder — files, grep, buffers, git, LSP symbols |
| [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | native fzf sorter for telescope |
| [nvim-telescope/telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim) | routes `vim.ui.select` through telescope |
| [andrew-george/telescope-themes](https://github.com/andrew-george/telescope-themes) | colorscheme switcher via telescope |
| [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | shared Lua utility library, dependency of several plugins |
| [nvim-mini/mini.files](https://github.com/nvim-mini/mini.files) | buffer-based file explorer |
| [rmagatti/auto-session](https://github.com/rmagatti/auto-session) | per-directory session save/restore |

### LSP, completion, formatting

| Plugin | Description |
|---|---|
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configs |
| [mason-org/mason.nvim](https://github.com/mason-org/mason.nvim) | LSP/DAP/formatter installer |
| [mason-org/mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) | bridges mason and lspconfig |
| [WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | auto-installs the configured tools on startup |
| [seblyng/roslyn.nvim](https://github.com/seblyng/roslyn.nvim) | C# LSP client (Roslyn) |
| [saghen/blink.cmp](https://github.com/Saghen/blink.cmp) | completion engine (LSP, path, snippets, buffer) |
| [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | snippet collection |
| [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | format-on-save (C# via `csharpier`) |
| [rachartier/tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim) | compact inline diagnostics, replaces default virtual text |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | AST-based syntax highlighting and indentation |

### Debugging & testing

| Plugin | Description |
|---|---|
| [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client |
| [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | UI for nvim-dap (stack, scopes, watches) |
| [nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio) | async library, dependency of dap-ui/neotest |
| [ramboe/ramboe-dotnet-utils](https://github.com/ramboe/ramboe-dotnet-utils) | locates the built `.dll` for launching the .NET debugger |
| [nvim-neotest/neotest](https://github.com/nvim-neotest/neotest) | test runner framework |
| [nsidorenco/neotest-vstest](https://github.com/nsidorenco/neotest-vstest) | neotest adapter for .NET tests (vstest) |
| [antoinemadec/FixCursorHold.nvim](https://github.com/antoinemadec/FixCursorHold.nvim) | fixes `CursorHold` event delay, required by neotest |

### Editing

| Plugin | Description |
|---|---|
| [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) | auto-closes brackets/quotes |
| [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | highlights and lists `TODO`/`FIXME`/`NOTE` comments |
| [folke/which-key.nvim](https://github.com/folke/which-key.nvim) | popup with available keybindings |

## Keymaps

Leader is `<Space>`. Full list via which-key (`<Space>`, wait for popup, or `<Space>?` for buffer-local maps).

| Key | Action |
|---|---|
| `<leader>ff` / `<leader>fw` / `<leader>fb` | find files / live grep / buffers (telescope) |
| `<leader>e` | open file explorer (mini.files) |
| `gd` / `gr` / `gi` / `gt` | go to definition / references / implementation / type definition |
| `K` | hover documentation |
| `<leader>ca` | code action |
| `<leader>fm` | format file |
| `<F5>` / `<F9>` / `<F10>` / `<F11>` | debug: continue / breakpoint / step over / step into |
| `<leader>dt` / `<leader>du` | debug nearest test / toggle DAP UI |
| `<leader>sr` / `<leader>ss` | restore / save session |
