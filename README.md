# ✨ Flbx-nvim

> **Minimal, modern & developer-centric Neovim config for web development (JS, TS, Vue, Angular, and more...)**

> [![Neovim](https://img.shields.io/badge/NVIM-0.9+-17A2B8?style=flat&logo=neovim)](https://neovim.io/)
[![Lazy.nvim](https://img.shields.io/badge/Plugin_Manager-Lazy.nvim-17A2B8?style=flat)](https://github.com/folke/lazy.nvim)
[![ng-croissant](https://img.shields.io/badge/Angular-cursor?style=flat&logo=%F0%9F%A5%90&label=ng-croissant&color=red)](https://github.com/FlorianBx/ng-croissant/tree/main)
 ![](https://img.shields.io/badge/Vue%20js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D)
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

- Native LSP & auto-completion (nvim-lspconfig, nvim-cmp, luasnip)
- Blazing fast search & file navigation (Telescope, NvimTree)
- Integrated Git (Gitsigns, LazyGit)
- Visual TODOs & diagnostics (todo-comments, trouble.nvim)
- One-key Angular file jumps via [ng-croissant](https://github.com/FlorianBx/ng-croissant) (optional)
- Logical, discoverable keymaps

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

> _Press `<Space>` (leader key) for more.  
> Most shortcuts are logical and grouped:_

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

### Window & Buffer

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `ss`          | Normal | Split window horizontally           |
| `sv`          | Normal | Split window vertically             |
| `sx`          | Normal | Close split                         |
| `sw`          | Normal | Close other splits                  |
| `<S-h>`/`<S-l>` | Normal | Resize window left/right         |
| `<S-j>`/`<S-k>` | Normal | Resize window down/up           |
| `<A-h>`       | Normal | Previous buffer                     |
| `<A-l>`       | Normal | Next buffer                         |
| `<leader>c`   | Normal | Close buffer                        |

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
| `<leader>ll`  | Normal | Format buffer (LSP)                 |

### Navigation & Search (Telescope)

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<leader>ff`  | Normal | Find files                          |
| `<leader>fg`  | Normal | Live grep                           |
| `<leader>fs`  | Normal | Grep string under cursor            |
| `<leader>fr`  | Normal | Recent files / Telescope refs       |
| `<leader>fb`  | Normal | Open buffers list                   |
| `<leader>ft`  | Normal | Search TODOs                        |
| `<leader>nh`  | Normal | Clear search highlights             |

### File Explorer (NvimTree)

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<leader>ee`  | Normal | Toggle file explorer                |
| `<leader>ef`  | Normal | Find file in explorer               |
| `<leader>ec`  | Normal | Collapse explorer tree              |
| `<leader>er`  | Normal | Refresh explorer                    |

### Git

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<leader>gp`  | Normal | Preview git hunk                    |
| `<leader>gm`  | Normal | Toggle line blame                   |
| `<leader>lg`  | Normal | Launch LazyGit                      |

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

### Snippets & Completion

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<C-Space>`   | Insert | Trigger completion                  |
| `<CR>`        | Insert | Confirm selected suggestion         |
| `<Tab>`/`<S-Tab>` | Insert | Next/previous item            |

### Angular (with [ng-croissant](https://github.com/FlorianBx/ng-croissant) 🥐)

> *Seamless Angular navigation (if plugin installed):*

| Key           | Mode   | Action                              |
| ------------- | ------ | ----------------------------------- |
| `<leader>ac`  | Normal | Go to component.ts                  |
| `<leader>at`  | Normal | Go to component.html                |
| `<leader>as`  | Normal | Go to component.spec.ts             |

---
&nbsp;
## 🧩 Plugins

- **LSP**: `nvim-lspconfig`, `nvim-cmp`, `luasnip`
- **Navigation**: `telescope.nvim`, `nvim-tree`
- **Git**: `gitsigns.nvim`, `lazygit.nvim`
- **UI & Workflow**: `todo-comments.nvim`, `trouble.nvim`
- **Angular**: [`ng-croissant`](https://github.com/FlorianBx/ng-croissant) _(optional)_

_Modular plugin setup in [`lua/plugins/`](./lua/plugins/)_

---
&nbsp;
## 🛠️ Usage & customization

- All settings and keymaps are in `lua/core/keymaps.lua`.
- Edit plugins/features as you like in `lua/plugins/`.
- Works with [which-key.nvim](https://github.com/folke/which-key.nvim) for keymap discovery. ⚠️ ***WIP***

---
&nbsp;
## 🙌 Credits

To the awesome [Neovim](https://neovim.io/) community & every plugin author!  
_Angular file jumping powered by [ng-croissant](https://github.com/FlorianBx/ng-croissant)._

---
&nbsp;
## ⚖️ License

MIT © FlorianBx
