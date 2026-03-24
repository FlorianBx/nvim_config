# Flbx-nvim

Neovim configuration for Vue.js/TypeScript development. Uses Rust-based tooling (oxfmt, oxlint) and a dual LSP setup for full Vue 3 + TypeScript support.

![](https://img.shields.io/badge/Vue%20js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D)
![](https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white)
![](https://img.shields.io/badge/NeoVim-57A143?style=for-the-badge&logo=neovim&logoColor=white)

## Installation

```sh
git clone https://github.com/FlorianBx/nvim_config ~/.config/nvim
nvim
```

Mason auto-installs LSP servers on first launch.

### Requirements

| Tool | Purpose | Install |
|------|---------|---------|
| Neovim 0.12+ | `vim.lsp.config` API | — |
| Node.js | vue_ls, vtsls | — |
| ripgrep | Live grep | `brew install ripgrep` |
| fd | File search | `brew install fd` |
| oxfmt | Formatter (JS/TS/Vue/CSS) | `cargo install oxfmt` |
| oxlint | Linter (JS/TS/Vue) | `npm install -g oxlint` |

## Language Support

| Language | LSP | Formatter | Linter |
|----------|-----|-----------|--------|
| Vue.js | vue_ls + VTSLS + `@vue/typescript-plugin` | oxfmt | oxlint |
| TypeScript | VTSLS | oxfmt | oxlint |
| JavaScript | VTSLS | oxfmt | oxlint |
| CSS | cssls | oxfmt | — |
| HTML | html | — | — |
| Lua | — | stylua | — |

## Key Bindings

Leader key: `<Space>`

### Editor

| Key | Mode | Action |
|-----|------|--------|
| `jj` | insert | Exit insert mode |
| `;` | normal | Enter command mode |
| `<leader>ew` | normal | Save file |
| `<leader>r` | normal | Reload buffer |
| `<leader>nh` | normal | Clear search highlights |
| `ga` | normal | Select all |
| `<leader>/` | normal/visual | Toggle comment |

### Windows & Splits

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate between windows |
| `ss` / `sv` | Split horizontal / vertical |
| `sx` / `sw` | Close split / close others |
| `<C-S-h/j/k/l>` | Resize window |

### Buffers

| Key | Action |
|-----|--------|
| `<Tab>` / `<S-Tab>` | Next / previous buffer |
| `<leader>x` | Close buffer |

### File Explorer (nvim-tree)

| Key | Action |
|-----|--------|
| `<leader>ee` | Toggle explorer |
| `<leader>ef` | Reveal current file |

### Telescope

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fw` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fo` | Recent files |
| `<leader>fa` | Find all files (incl. hidden) |

### LSP

| Key | Action |
|-----|--------|
| `gd` / `gD` | Definition / declaration |
| `grr` / `gri` | References / implementation |
| `K` | Hover info |
| `gra` | Code actions |
| `<leader>ra` | Rename symbol |
| `<leader>ll` | Format buffer |
| `[d` / `]d` | Prev / next diagnostic |

## Plugins

| Plugin | Purpose |
|--------|---------|
| nvim-lspconfig | LSP server configuration |
| conform.nvim | Format on save |
| nvim-lint | Async linting via oxlint |
| nvim-treesitter | Syntax highlighting |
| tiny-inline-diagnostic | Inline diagnostic rendering |
| telescope.nvim | Fuzzy finder |
| nvim-tree | File explorer |
| gitsigns.nvim | Git diff in gutter |
| nvim-cmp + LuaSnip | Completion engine + snippets |

## Structure

```
lua/
├── mappings.lua
├── options.lua
├── configs/
│   ├── lspconfig.lua
│   ├── conform.lua
│   └── lazy.lua
└── plugins/
    └── init.lua
```

## License

MIT © FlorianBx
