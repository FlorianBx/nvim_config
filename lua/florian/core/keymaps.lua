vim.g.mapleader = " "

local keymap = vim.keymap
local keymapOptionsWithDesc = function(desc)
  return { noremap = true, silent = true, desc = desc }
end

-- Move lines and selections
keymap.set("n", "J", ":m .+1<CR>==", keymapOptionsWithDesc("Move current line down in normal mode"))
keymap.set("n", "K", ":m .-2<CR>==", keymapOptionsWithDesc("Move current line up in normal mode"))
keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi", keymapOptionsWithDesc("Move current line down in insert mode"))
keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi", keymapOptionsWithDesc("Move current line up in insert mode"))
keymap.set("v", "J", ":m '>+1<CR>gv=gv", keymapOptionsWithDesc("Move selected lines down in visual mode"))
keymap.set("v", "K", ":m '<-2<CR>gv=gv", keymapOptionsWithDesc("Move selected lines up in visual mode"))

-- Quick Actions
keymap.set("i", "jj", "<Esc>", keymapOptionsWithDesc("Exit insert mode quickly"))
keymap.set("n", "<leader>eq", ":q<CR>", keymapOptionsWithDesc("Quit current window"))
keymap.set("n", "<leader>ew", ":w<CR>", keymapOptionsWithDesc("Save current file"))

-- Search Telescope
keymap.set("n", "sf", ":Telescope find_files<CR>", keymapOptionsWithDesc("Open Telescope file search"))

-- Rename Word
keymap.set("n", "<leader>rn", ":IncRename ", keymapOptionsWithDesc("Rename word under cursor"))

-- Select all
keymap.set("n", "ga", "gg<S-v>G", keymapOptionsWithDesc("Select all text in the file"))

-- Tab Management
keymap.set("n", "te", ":tabedit<CR>", keymapOptionsWithDesc("Open new tab"))
keymap.set("n", "tc", ":tabclose<CR>", keymapOptionsWithDesc("Close current tab"))

-- Window Management
keymap.set("n", "ss", ":split<CR>", keymapOptionsWithDesc("Split window horizontally"))
keymap.set("n", "sv", ":vsplit<CR>", keymapOptionsWithDesc("Split window vertically"))
keymap.set("n", "sx", "<cmd>close<CR>", keymapOptionsWithDesc("Close current split"))
keymap.set("n", "sw", "<cmd>only<CR>", keymapOptionsWithDesc("Close all other splits"))

-- Search
keymap.set("n", "<leader>nh", ":nohlsearch<CR>", keymapOptionsWithDesc("Clear search highlights"))

keymap.set("n", "mp", ":MarkdownPreviewToggle<CR>", keymapOptionsWithDesc("Open markdown preview"))

-- Diagnostics
keymap.set("n", "<C-->", function()
  vim.diagnostic.goto_next()
end, keymapOptionsWithDesc("Go to next diagnostic message"))
