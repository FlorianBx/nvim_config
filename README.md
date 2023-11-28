# NeoVim Configuration for VueJS/TailwindCSS/TypeScript Web Development

This project contains a customized NeoVim setup, tailored for web development with VueJS, TailwindCSS, TypeScript, Prettier, and ESLint.

## Key Features

- Full support for VueJS, TailwindCSS, TypeScript
- Integration with Prettier and ESLint for standardized and clean code
- Custom keyboard shortcuts for efficient navigation and editing

## Installation

1. Clone this repository into your NeoVim configuration directory.
2. Install the required plugins using your preferred NeoVim plugin manager.
3. Restart NeoVim to apply the changes.

## Keyboard Shortcuts

The following shortcuts have been configured to enhance your development efficiency:

- `j` / `k` : Swap navigation commands (j becomes k and vice versa)
- `+` / `-` : Increment / Decrement values
- `dw` : Delete a word backwards
- `ga` : Select all text
- `te` : Open a new tab
- `tc` : Close the current tab
- `Tab` : Navigate to the next tab
- `Shift+Tab` : Navigate to the previous tab
- `ss` / `sv` : Split window horizontally / vertically
- `sh` / `sj` / `sk` / `sl` : Move window
- `Ctrl+[h,j,k,l]` : Resize window
- `sf` : Find files with Telescope
- `Leader+rn` : Rename a symbol

### Diagnostics

- `Ctrl+j` : Go to next diagnostic

## Customization

To add or modify shortcuts, edit the shortcut configuration file (`keymaps.lua`). Default shortcuts are loaded on the `VeryLazy` event.

## Contributing

Contributions to this configuration are welcome. If you have suggestions or improvements, feel free to create an issue or a pull request.

## License

This project is licensed under the MIT License. For more details, see the `LICENSE` file.
