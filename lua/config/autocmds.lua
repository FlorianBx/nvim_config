-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Dans init.lua
local autocmd = vim.api.nvim_create_autocmd

autocmd("WinEnter", {
	pattern = "*",
	command = "set cursorline",
})

autocmd("WinLeave", {
	pattern = "*",
	command = "set nocursorline",
})

-- Hilgiht Eslint errors
vim.cmd([[
highlight LspDiagnosticsDefaultError guifg=Red ctermfg=Red
highlight LspDiagnosticsUnderlineError gui=undercurl guisp=Red cterm=undercurl
]])
