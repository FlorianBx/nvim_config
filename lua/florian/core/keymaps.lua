vim.g.mapleader = " "

local keymap = vim.keymap
local keymapOptionsWithDesc = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

keymap.set("i", "jj", "<Esc>", keymapOptionsWithDesc("Exit insert mode quickly"))
keymap.set("n", "<leader>eq", ":q<CR>", keymapOptionsWithDesc("Quit current window"))
keymap.set("n", "<leader>ew", ":w<CR>", keymapOptionsWithDesc("Save current file"))
keymap.set("n", "P", '"0p', keymapOptionsWithDesc("Paste from yank register"))
keymap.set("v", "P", '"0p', keymapOptionsWithDesc("Paste from yank register"))
keymap.set("n", "<Leader>r", ":e!<CR>", keymapOptionsWithDesc("Reload the current page"))

keymap.set("n", "ga", "gg<S-v>G", keymapOptionsWithDesc("Select all text in the file"))

keymap.set("n", "ss", ":split<CR>", keymapOptionsWithDesc("Split window horizontally"))
keymap.set("n", "sv", ":vsplit<CR>", keymapOptionsWithDesc("Split window vertically"))
keymap.set("n", "sx", "<cmd>close<CR>", keymapOptionsWithDesc("Close current split"))
keymap.set("n", "sw", "<cmd>only<CR>", keymapOptionsWithDesc("Close all other splits"))

keymap.set("n", "<C-S-l>", "<C-w><5", keymapOptionsWithDesc("Resize window left"))
keymap.set("n", "<C-S-h>", "<C-w>>5", keymapOptionsWithDesc("Resize window right"))
keymap.set("n", "<C-S-k>", "<C-w>+5", keymapOptionsWithDesc("Resize window up"))
keymap.set("n", "<C-S-j>", "<C-w>-5", keymapOptionsWithDesc("Resize window down"))

keymap.set("n", "gd", vim.lsp.buf.definition, keymapOptionsWithDesc("Go to definition"))
keymap.set("n", "gi", vim.lsp.buf.implementation, keymapOptionsWithDesc("Go to implementation"))
keymap.set("n", "gr", vim.lsp.buf.references, keymapOptionsWithDesc("Go to references"))
keymap.set("n", "K", vim.lsp.buf.hover, keymapOptionsWithDesc("Show hover information"))
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, keymapOptionsWithDesc("Code actions"))
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, keymapOptionsWithDesc("Rename symbol"))

keymap.set("n", "<leader>d", vim.diagnostic.open_float, keymapOptionsWithDesc("Show diagnostics"))
keymap.set("n", "[d", vim.diagnostic.goto_prev, keymapOptionsWithDesc("Previous diagnostic"))
keymap.set("n", "]d", vim.diagnostic.goto_next, keymapOptionsWithDesc("Next diagnostic"))

keymap.set("n", "<leader>nh", ":nohlsearch<CR>", keymapOptionsWithDesc("Clear search highlights"))


keymap.set("n", "<S-h>", "<Cmd>bprevious<CR>", keymapOptionsWithDesc("Previous buffer"))
keymap.set("n", "<S-l>", "<Cmd>bnext<CR>", keymapOptionsWithDesc("Next buffer"))


keymap.set("n", "-", "<CMD>Oil<CR>", keymapOptionsWithDesc("Open parent directory"))
