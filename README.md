# ✨ Flbx-nvim

> **Modern, modular Neovim configuration optimized for Vue.js/TypeScript development**

![](https://img.shields.io/badge/Vue%20js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D)
![](https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white)
![](https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white)
![](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)

<img width="1920" height="1020" alt="Screenshot 2025-07-08 at 11 31 14 PM" src="https://github.com/user-attachments/assets/62b2ec4e-1779-4f8f-aa73-18241126a348" />

## 🚀 Features

- **🏗️ Modular Architecture** - Organized plugin categories for maintainability
- **🎯 Vue.js/TypeScript Focus** - Specialized configurations for modern web development
- **🤖 GitHub Copilot Integration** - AI-powered code completion
- **⚡ Performance Optimized** - Smart lazy loading and efficient configurations
- **📁 File Explorer** - Neotree for seamless navigation
- **🔍 Enhanced Git Workflow** - Gitsigns, LazyGit, and Diffview integration
- **💾 Session Management** - Automatic workspace persistence

## 📦 Installation

```sh
git clone https://github.com/FlorianBx/nvim_config ~/.config/nvim
nvim
```

### Requirements
- **Neovim 0.9+** - Required for modern features
- **Git** - Plugin management
- **Node.js** - LSP servers and formatters
- **ripgrep** - Fast searching (`brew install ripgrep`)
- **fd** - Fast file finding (`brew install fd`)

### Optional
- **lazygit** - Git UI (`brew install lazygit`)
- **tmux** - Terminal multiplexing

## ⚡ Key Bindings

> **Leader key:** `<Space>`

### 📝 Essential

| Key | Action |
|-----|---------|
| `jj` | Exit insert mode |
| `<leader>ew` | Save file |
| `<leader>eq` | Quit window |
| `<leader>r` | Reload buffer |
| `ga` | Select all |

### 🪟 Window & Buffer

| Key | Action |
|-----|---------|
| `ss` / `sv` | Split horizontal/vertical |
| `sx` / `sw` | Close split/other splits |
| `<S-h>` / `<S-l>` | Previous/next buffer |
| `<leader>c` | Close buffer |

### 🔍 Navigation (Telescope)

| Key | Action |
|-----|---------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Open buffers |
| `<leader>fr` | Recent files |
| `<leader>ft` | Search TODOs |

### 📁 File Explorers

| Key | Action |
|-----|---------|
| `<leader>ee` | Neotree file explorer |

### 🎯 Harpoon (Quick Navigation)

| Key | Action |
|-----|---------|
| `<leader>ha` | Add file to Harpoon |
| `<leader>hh` | Open Harpoon menu |
| `<leader>1-4` | Jump to Harpoon files |

### 🔧 LSP & Diagnostics

| Key | Action |
|-----|---------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Show hover info |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>ll` | Format buffer |
| `<leader>d` | Show diagnostics |
| `[d` / `]d` | Prev/next diagnostic |

### 🤖 AI Completion (Copilot)

| Key | Mode | Action |
|-----|------|---------|
| `<C-l>` | Insert | Accept suggestion |
| `<C-]>` | Insert | Dismiss suggestion |
| `<C-\>` | Insert | Next suggestion |
| `<C-[>` | Insert | Previous suggestion |

### 📝 Snippets

| Key | Mode | Action |
|-----|------|---------|
| `<Tab>` | Insert | Expand or jump snippet |
| `<S-Tab>` | Insert | Jump back in snippet |
| `<C-e>` | Insert | Change snippet choice |

### 🎨 Vue.js Snippets

| Trigger | Description |
|---------|-------------|
| `vue3` | Vue 3 component template |
| `vref` | Vue ref with TypeScript |
| `vreactive` | Vue reactive with TypeScript |
| `vcomputed` | Vue computed property |
| `vwatch` | Vue watch function |
| `vprops` | Vue props with TypeScript |
| `vemits` | Vue emits with TypeScript |

### 🅰️ Angular Development

| Key | Action |
|-----|---------|
| `<leader>ac` | Go to component.ts |
| `<leader>at` | Go to component.html |
| `<leader>as` | Go to component.spec.ts |
| `<leader>acc` | Go to component.css |
| `<leader>ass` | Go to component.scss |

### 🔀 Git Integration

| Key | Action |
|-----|---------|
| `<leader>gp` | Preview git hunk |
| `<leader>gm` | Toggle line blame |
| `<leader>lg` | Launch LazyGit |
| `<leader>gv` | Git diff view |
| `<leader>gt` | Git file history |

### 🚨 Trouble & TODOs

| Key | Action |
|-----|---------|
| `<leader>xx` | Trouble diagnostics |
| `<leader>xw` | Workspace diagnostics |
| `<leader>xq` | Quickfix list |
| `<leader>nt` / `<leader>pt` | Next/prev TODO |

### 🖥️ TMUX Navigation

| Key | Action |
|-----|---------|
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Navigate panes |
| `<C-\>` | Navigate to previous pane |

### 💾 Session Management

| Key | Action |
|-----|---------|
| `<leader>wr` | Restore workspace |
| `<leader>wl` | Load last session |
| `<leader>we` | Exclude session |

## 🧩 Plugin Architecture

### 📂 Structure
```
lua/florian/plugins/
├── ui/           # Colorscheme, which-key, dressing
├── navigation/   # Telescope, neotree, harpoon, tmux-nav
├── editor/       # Treesitter, formatting, trouble
├── coding/       # Completion, copilot, snippets
├── git/          # Gitsigns, lazygit, diffview
└── lsp/          # LSP configurations
```

### 🎯 Core Plugins
- **Lazy.nvim** - Plugin manager with smart loading
- **Telescope** - Fuzzy finder with fzf integration
- **Neotree** - A file explorer for Neovim
- **Copilot** - AI-powered code completion
- **Conform.nvim** - Modern formatting with Prettier
- **Harpoon** - Quick project navigation
- **Trouble.nvim** - Diagnostics and quickfix
- **LSP** - Native LSP with Mason auto-install

### 🌐 Language Support
- **Vue.js** - Volar LSP with Vue 3 + TypeScript
- **TypeScript/JavaScript** - Advanced IntelliSense
- **Angular** - Component navigation with ng-croissant
- **HTML/CSS** - Tailwind CSS integration
- **Markdown** - Enhanced editing

## 🎨 Customization

### 📝 Key Files
- `lua/florian/core/keymaps.lua` - All keybindings
- `lua/florian/core/options.lua` - Neovim settings
- `lua/florian/plugins/` - Plugin configurations
- `lua/florian/plugins/lsp/configs/` - LSP settings

### 🔧 Performance
- **Lazy loading** - Fast startup (~50ms)
- **Smart formatting** - Excludes node_modules
- **Treesitter optimization** - Large file handling
- **Efficient diagnostics** - Configurable virtual text

## 🆕 Recent Updates

### ✨ Latest Features
- **🤖 GitHub Copilot** - AI-powered code completion
- **🏗️ Modular Architecture** - Organized plugin categories
- **⚡ Performance Optimizations** - Smart lazy loading
- **📝 Vue.js Snippets** - Comprehensive Vue 3 templates
- **🔧 Enhanced LSP** - TypeScript with inlay hints
- **📁 File Explorer** - Neotree integration

## 🙌 Credits

Thanks to the amazing Neovim community and plugin authors:
- **[folke](https://github.com/folke)** - lazy.nvim, trouble.nvim, persistence.nvim
- **[ThePrimeagen](https://github.com/ThePrimeagen)** - Harpoon
- **[stevearc](https://github.com/stevearc)** - conform.nvim
- **[sindrets](https://github.com/sindrets)** - Diffview

---

## ⚖️ License

MIT © FlorianBx
