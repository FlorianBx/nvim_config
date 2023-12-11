# FBNeoVim Configuration for VueJS/TailwindCSS/TypeScript Web Development

![NVim Preview]([https://raw.githubusercontent.com/BFlorian91/nvim_config/main/nvim_prev.png?raw=true](https://github.com/BFlorian91/nvim_config/blob/dev/nvim_prev_new.png?raw=true))

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
2. Install the required plugins using your preferred NeoVim plugin manager.
3. Restart NeoVim to apply the changes.

## Keyboard Shortcuts

Enhance your development efficiency with these intuitive shortcuts:

- **Navigation Swaps**:

  - `j` and `k` have swapped roles. Now, `j` moves up, and `k` moves down. This can be a game-changer for your muscle memory!

- **Quick Actions**:

  - `<leader>qq` - Quickly close the current window.
  - `<leader>ww` - Save your work in a snap.

- **Editing**:

  - `+` / `-` - Easily increment/decrement values.
  - `ga` - Select all text with ease.

- **Tabs and Windows**:

  - `te` / `tc` - Open/close tabs.
  - `Tab` / `Shift+Tab` - Navigate through tabs.
  - `ss` / `sv` / `st` - Split windows to organize your workspace.
  - `sh` / `sj` / `sk` / `sl` - Move between windows.
  - `Ctrl+[h,j,k,l]` - Resize windows for optimal viewing.

- **Diagnostics**:

  - `Ctrl+j` - Jump to the next diagnostic message.

- **Search and Rename**:

  - `sf` - Find files using Telescope.
  - `Leader+rn` - Rename symbols with precision.

- **Window Management**:

  - `<leader>[direction]q` - Close windows in different directions (`lq`, `rq`, `tq`, `bq`).

- **Layout Terminal**:
  - `<leader>tt` - Set up a layout with multiple terminals.

## Customization

Feel free to add or modify shortcuts in the `keymaps.lua` file. Default shortcuts are loaded on the `VeryLazy` event.

## Contributing

Your ideas and contributions are welcome! Create an issue or a pull request with your suggestions.

## License

Licensed under the MIT License. See [LICENCE](LICENSE) for details.
