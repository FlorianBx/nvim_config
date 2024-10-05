vim.g.mapleader = " "

local keymap = vim.keymap
local keymapOptionsWithDesc = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

-- Quick Actions
keymap.set("i", "jj", "<Esc>", keymapOptionsWithDesc("Exit insert mode quickly"))
keymap.set("n", "<leader>eq", ":q<CR>", keymapOptionsWithDesc("Quit current window"))
keymap.set("n", "<leader>ew", ":w<CR>", keymapOptionsWithDesc("Save current file"))

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

-- Search
keymap.set("n", "<leader>nh", ":nohlsearch<CR>", keymapOptionsWithDesc("Clear search highlights"))

-- Fix Eslint
local eslint_utils = require('utils.eslint')

vim.keymap.set('n', '<leader>ll', eslint_utils.eslint_fix_and_refresh, { noremap = true, silent = true, desc = "ESLint fix and refresh" })

-- Buffers
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<leader><Tab>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<leader><S-Tab>", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next
map("n", "<leader><A>", "<Cmd>BufferMoveNext<CR>", opts)
map("n", "<leader><S-A>", "<Cmd>BufferMovePrevious<CR>", opts)

-- Close buffer
map("n", "<leader>c", "<Cmd>BufferClose<CR>", opts)
