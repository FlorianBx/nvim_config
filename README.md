# ✨ Flbx-nvim

> **Modern, performance-focused Neovim configuration for full-stack web development**
<br />

 > ![](https://img.shields.io/badge/Vue%20js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D)
  ![](https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white)
  ![](https://img.shields.io/badge/Vite-B73BFE?style=for-the-badge&logo=vite&logoColor=FFD62E)
  ![](https://img.shields.io/badge/vitest-6E9F18?style=for-the-badge&logo=vitest&logoColor=white)
  ![](https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white)
  ![](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)

&nbsp;

<p align="center">
  <img src="https://raw.githubusercontent.com/BFlorian91/nvim_config/dev/nvim_prev_new.png" alt="Nvim Preview" width="100%" />
</p>


## 🚀 Features

- **Native LSP & Completion**: Full LSP support with nvim-lspconfig, nvim-cmp, and LuaSnip
- **AI-Powered Coding**: Supermaven AI completion for intelligent code suggestions
- **Advanced File Management**: Dual file explorers (Oil.nvim & Yazi) with seamless navigation
- **Git Integration**: Enhanced Git workflow with Gitsigns, LazyGit, and Diffview
- **Session Management**: Automatic session persistence and restoration
- **Project Navigation**: Harpoon for quick file jumping and project bookmarks
- **Smart Search**: Telescope with fzf integration and live grep
- **Performance Optimized**: Smooth scrolling, efficient treesitter, and lazy loading
- **Documentation Generation**: Auto-generate JSDoc/TSDoc with Neogen
- **TMUX Integration**: Seamless navigation between Neovim and TMUX panes
- **Visual Enhancements**: Beautiful Poimandres theme with transparent backgrounds
- **Angular Support**: One-key Angular file jumps via [ng-croissant](https://github.com/FlorianBx/ng-croissant)
- **Typing Practice**: Built-in typing practice with Typr
- **Smart Diagnostics**: Enhanced diagnostic display with lsp_lines.nvim

---
&nbsp;
## 📦 Installation

<details open>
<summary><b>One-step setup (with <a href="https://github.com/folke/lazy.nvim">lazy.nvim</a>):</b></summary>

```sh
git clone https://github.com/FlorianBx/nvim_config ~/.config/nvim
nvim
```
- All plugins are automatically installed via [lazy.nvim](https://github.com/folke/lazy.nvim) on first launch.
- For best experience: [ripgrep](https://github.com/BurntSushi/ripgrep) installed (`brew install ripgrep` or your package manager). (optional)
- Requires: Neovim **0.9 or later**.
</details>

---
&nbsp;
## ⚡ Keymaps Cheat Sheet

> _Press `<Space>` (leader key). Most shortcuts are logical and grouped by functionality:_

### General

| Key         | Mode   | Action                              |
| ----------- | ------ | ----------------------------------- |
| `jj`        | Insert | Exit insert mode (quickly)          |
| `<leader>ew`| Normal | Save file                           |
| `<leader>eq`| Normal | Quit window                         |
| `<leader>r` | Normal | Reload current buffer               |
| `ga`        | Normal | Select all                          |
| `P`         | Normal | Paste from yank register            |
| `P`         | Visual | Paste from yank register            |

### Window & Buffer Management

| Key             | Mode   | Action                              |
| --------------- | ------ | ----------------------------------- |
| `ss`            | Normal | Split window horizontally           |
| `sv`            | Normal | Split window vertically             |
| `sx`            | Normal | Close split                         |
| `sw`            | Normal | Close other splits                  |
| `<C-S-h>/<C-S-l>` | Normal | Resize window left/right         |
| `<C-S-j>/<C-S-k>` | Normal | Resize window down/up           |
| `<S-h>/<S-l>`   | Normal | Previous/next buffer                |
| `<leader>c`     | Normal | Close buffer                        |

### TMUX Navigation

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<C-h>`       | Normal | Navigate left (TMUX aware)          |
| `<C-j>`       | Normal | Navigate down (TMUX aware)          |
| `<C-k>`       | Normal | Navigate up (TMUX aware)            |
| `<C-l>`       | Normal | Navigate right (TMUX aware)         |
| `<C-\>`       | Normal | Navigate to previous pane           |

### LSP & Diagnostics

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `gd`          | Normal | Go to definition                    |
| `gi`          | Normal | Go to implementation                |
| `gr`          | Normal | Go to references                    |
| `K`           | Normal | Hover info (documentation)          |
| `<leader>ca`  | Normal | Code actions                        |
| `<leader>rn`  | Normal | Rename symbol                       |
| `<leader>d`   | Normal | Show diagnostics (float)            |
| `[d`/`]d`     | Normal | Prev/next diagnostic                |
| `<leader>ll`  | Normal | Format buffer                       |

### Navigation & Search (Telescope)

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<leader>ff`  | Normal | Find files                          |
| `<leader>fg`  | Normal | Live grep                           |
| `<leader>fs`  | Normal | Grep string under cursor            |
| `<leader>fr`  | Normal | Recent files                        |
| `<leader>fb`  | Normal | Open buffers list                   |
| `<leader>ft`  | Normal | Search TODOs                        |
| `<leader>nh`  | Normal | Clear search highlights             |

### File Explorers

#### Oil.nvim (Primary)
| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<leader>ee`  | Normal | Open Oil file explorer (float)      |

#### Yazi (Advanced)
| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<leader>-`   | Normal/Visual | Open Yazi at current file      |
| `<leader>cw`  | Normal | Open Yazi in working directory      |
| `<C-Up>`      | Normal | Resume last Yazi session           |

### Harpoon (Quick Navigation)

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<leader>ha`  | Normal | Add file to Harpoon                 |
| `<leader>hh`  | Normal | Open Harpoon menu                   |
| `<leader>1`   | Normal | Jump to Harpoon file 1              |
| `<leader>2`   | Normal | Jump to Harpoon file 2              |
| `<leader>3`   | Normal | Jump to Harpoon file 3              |
| `<leader>4`   | Normal | Jump to Harpoon file 4              |

### Git Integration

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<leader>gp`  | Normal | Preview git hunk                    |
| `<leader>gm`  | Normal | Toggle line blame                   |
| `<leader>lg`  | Normal | Launch LazyGit                      |
| `<leader>gv`  | Normal | Git Diff View                       |
| `<leader>gt`  | Normal | Git File History                    |
| `<leader>gc`  | Normal | Close Diff View                     |
| `<leader>gr`  | Normal | Refresh Diff View                   |

### Session Management (Persistence)

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<leader>wr`  | Normal | Restore workspace session           |
| `<leader>wl`  | Normal | Load last session                   |
| `<leader>we`  | Normal | Exclude current session             |

### AST Navigation (Treewalker)

| Key           | Mode      | Action                              |
| ------------- | --------- | ----------------------------------- |
| `<A-k>`       | Normal/Visual | Navigate up in syntax tree      |
| `<A-j>`       | Normal/Visual | Navigate down in syntax tree    |
| `<A-h>`       | Normal/Visual | Navigate left in syntax tree    |
| `<A-l>`       | Normal/Visual | Navigate right in syntax tree   |

### Documentation Generation

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<leader>ng`  | Normal | Generate documentation (Neogen)     |

### TODO & Trouble

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<leader>nt`  | Normal | Next TODO comment                   |
| `<leader>pt`  | Normal | Previous TODO comment               |
| `<leader>xx`  | Normal | Trouble main                        |
| `<leader>xw`  | Normal | Workspace diagnostics               |
| `<leader>xd`  | Normal | Document diagnostics                |
| `<leader>xq`  | Normal | Quickfix list                       |
| `<leader>xl`  | Normal | Loclist                             |
| `<leader>xt`  | Normal | TODOs in Trouble                    |

### AI Completion (Supermaven)

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<Tab>`       | Insert | Accept AI suggestion                |
| `<C-]>`       | Insert | Clear AI suggestion                 |

### Snippets & Completion

| Key             | Mode   | Action                              |
| --------------- | ------ | ----------------------------------- |
| `<C-Space>`     | Insert | Trigger completion                  |
| `<CR>`          | Insert | Confirm selected suggestion         |
| `<Tab>/<S-Tab>` | Insert | Next/previous completion item       |

### Typing Practice

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `:Typr`       | Command | Start typing practice               |
| `:TyprStats`  | Command | View typing statistics              |

### Angular Development

> *Seamless Angular navigation (auto-enabled in Angular projects):*

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<leader>ac`  | Normal | Go to component.ts                  |
| `<leader>at`  | Normal | Go to component.html                |
| `<leader>as`  | Normal | Go to component.spec.ts             |

---
&nbsp;
## 🧩 Plugins

- **LSP**: `nvim-lspconfig`, `nvim-cmp`, `luasnip`
- **Navigation**: `telescope.nvim`, `nvim-tree`, `treewalker.nvim`
- **Git**: `gitsigns.nvim`, `lazygit.nvim`
- **UI & Workflow**: `todo-comments.nvim`, `trouble.nvim`
- **Angular**: [`ng-croissant`](https://github.com/FlorianBx/ng-croissant) _(optional)_

_Modular plugin setup in [`lua/plugins/`](./lua/plugins/)_

---
&nbsp;
## 🛠️ Usage & customization

- All settings and keymaps are in `lua/core/keymaps.lua`.
- Edit plugins/features as you like in `lua/plugins/`.

---
&nbsp;
## 🙌 Credits

To the awesome [Neovim](https://neovim.io/) community & every plugin author!  
_Angular file jumping powered by [ng-croissant](https://github.com/FlorianBx/ng-croissant)._

---
&nbsp;
## ⚖️ License

MIT © FlorianBx
