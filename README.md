# FBNeoVim Configuration for VueJS/TailwindCSS/TypeScript Web Development

![Nvim Preview](https://raw.githubusercontent.com/BFlorian91/nvim_config/dev/nvim_prev_new.png)

This project contains a customized NeoVim setup, tailored for web development with VueJS, TailwindCSS, TypeScript, Prettier, and ESLint.

## Key Features

- Full support for: ![](https://img.shields.io/badge/Vue%20js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D)
  ![](https://img.shields.io/badge/Vite-B73BFE?style=for-the-badge&logo=vite&logoColor=FFD62E)
  ![](https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white)
  ![](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)
  ![](https://img.shields.io/badge/pnpm-yellow?style=for-the-badge&logo=pnpm&logoColor=white)
  
- Integration with Prettier and ESLint for standardized and clean code
- Custom keyboard shortcuts for efficient navigation and editing

## Installation

1. Clone this repository into your NeoVim configuration directory.
2. Install the required plugins using [lazy.nvim](https://github.com/folke/lazy.nvim) plugins manager.
3. Restart NeoVim to apply the changes.

## Keyboard Shortcuts

Enhance your development efficiency with these intuitive shortcuts:

### NeoVim Keymaps

- **Navigation Swaps**:
  - `j` and `k` have swapped roles for more intuitive movement for me.
- **Move Selected Lines**:
  - `J` and `K` in normal and visual modes to move lines up and down.
- **Quick Actions**:
  - `jj` in insert mode to escape to normal mode.
  - `<leader>eq` to quit and `<leader>ew` to save.
- **Tabs and Window Management**:
  - `te` to open a new tab, `tc` to close the current tab.
  - `ss` for horizontal split, `sv` for vertical split.
- **Search and Rename**:
  - `sf` to search files with Telescope.
  - `<leader>rn` to rename symbols.
- **Treesitter Keymaps**:
  - Custom text objects like `e=`, `n=`, `a:`, `aa`, etc. for enhanced code manipulation.
- **Maximizer**:
  - `<leader>sm` to toggle maximizer.

### tmux Keybindings

- **Window and Pane Management**:
  - `C-a` as the prefix.
  - `|` and `-` to split windows horizontally and vertically.
  - `r` to reload tmux configuration.
  - `j`, `k`, `l`, `h` to resize panes.
  - `m` to toggle pane zoom.
- **Mouse Support**:
  - Mouse mode enabled for easy window and pane management.
- **Copy Mode**:
  - `v` to start selection and `y` to copy in vi mode.
- **TMUX Plugins**:
  - Plugins like `vim-tmux-navigator`, and `tmux-continuum` for enhanced functionality.

## Customization

Feel free to add or modify shortcuts in the `keymaps.lua` file. Default shortcuts are loaded on the `VeryLazy` event.

## Contributing

Your ideas and contributions are welcome! Create an issue or a pull request with your suggestions.

## License

Licensed under the MIT License. See [LICENCE](LICENSE) for details.
