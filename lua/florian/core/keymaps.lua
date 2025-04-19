vim.g.mapleader = " "

local keymap = vim.keymap
local keymapOptionsWithDesc = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

-- Quick Actions
keymap.set("i", "jj", "<Esc>", keymapOptionsWithDesc("Exit insert mode quickly"))
keymap.set("n", "<leader>eq", ":q<CR>", keymapOptionsWithDesc("Quit current window"))
keymap.set("n", "<leader>ew", ":w<CR>", keymapOptionsWithDesc("Save current file"))
-- Paste from yank register (register 0) with Shift+P
keymap.set("n", "P", '"0p', keymapOptionsWithDesc("Paste from yank register"))
-- En mode visuel aussi
keymap.set("v", "P", '"0p', keymapOptionsWithDesc("Paste from yank register"))
-- Reload the actual page
keymap.set("n", "<Leader>r", ":e!<CR>", keymapOptionsWithDesc("Reload the current page"))

-- Select all
keymap.set("n", "ga", "gg<S-v>G", keymapOptionsWithDesc("Select all text in the file"))

-- Window Management
keymap.set("n", "ss", ":split<CR>", keymapOptionsWithDesc("Split window horizontally"))
keymap.set("n", "sv", ":vsplit<CR>", keymapOptionsWithDesc("Split window vertically"))
keymap.set("n", "sx", "<cmd>close<CR>", keymapOptionsWithDesc("Close current split"))
keymap.set("n", "sw", "<cmd>only<CR>", keymapOptionsWithDesc("Close all other splits"))

-- Resize window
keymap.set("n", "<S-l>", "<C-w><5", keymapOptionsWithDesc("Resize window left"))
keymap.set("n", "<S-h>", "<C-w>>5", keymapOptionsWithDesc("Resize window right"))
keymap.set("n", "<S-k>", "<C-w>+5", keymapOptionsWithDesc("Resize window up"))
keymap.set("n", "<S-j>", "<C-w>-5", keymapOptionsWithDesc("Resize window down"))

-- LSP keymaps
keymap.set("n", "gd", vim.lsp.buf.definition, keymapOptionsWithDesc("Go to definition"))
keymap.set("n", "gi", vim.lsp.buf.implementation, keymapOptionsWithDesc("Go to implementation"))
keymap.set("n", "gr", vim.lsp.buf.references, keymapOptionsWithDesc("Go to references"))
keymap.set("n", "K", vim.lsp.buf.hover, keymapOptionsWithDesc("Show hover information"))
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, keymapOptionsWithDesc("Code actions"))
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, keymapOptionsWithDesc("Rename symbol"))

-- Diagnostic keymaps
keymap.set("n", "<leader>d", vim.diagnostic.open_float, keymapOptionsWithDesc("Show diagnostics"))
keymap.set("n", "[d", vim.diagnostic.goto_prev, keymapOptionsWithDesc("Previous diagnostic"))
keymap.set("n", "]d", vim.diagnostic.goto_next, keymapOptionsWithDesc("Next diagnostic"))

-- Search
keymap.set("n", "<leader>nh", ":nohlsearch<CR>", keymapOptionsWithDesc("Clear search highlights"))

-- Fix Eslint
-- local eslint_utils = require('utils.eslint')
-- vim.keymap.set('n', '<leader>kk', eslint_utils.eslint_fix_and_refresh, { noremap = true, silent = true, desc = "ESLint fix and refresh" })

-- Format
keymap.set("n", "<leader>ll", vim.lsp.buf.format, keymapOptionsWithDesc("Format file"))

-- Buffers
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<leader><Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)
map("n", "<leader><S-Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)


-- Re-order to previous/next
map("n", "<leader><A>", "<Cmd>BufferMoveNext<CR>", opts)
map("n", "<leader><S-A>", "<Cmd>BufferMovePrevious<CR>", opts)

-- Buffer Management
vim.keymap.set("n", "<leader>c", "<cmd>Bdelete<CR>", { desc = "Close current buffer" })
