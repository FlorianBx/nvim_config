vim.g.mapleader = " "
vim.g.maplocalleader = " "

if vim.g.vscode then
  require('vsconfig.options')
  require('vsconfig.keymaps')
  require('vsconfig.plugins')
else
  require('config.options')
  require('config.keybinds')
  require('config.lazy')
end