-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "j", "k", { noremap = true })
keymap.set("n", "k", "j", { noremap = true })

keymap.set("v", "j", "k", { noremap = true })
keymap.set("v", "k", "j", { noremap = true })

-- Increment / Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "ga", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit<CR>", opts)
keymap.set("n", "tc", ":tabclose<CR>", opts)
keymap.set("n", "<tab>", ":tabnext<CR>", opts)
keymap.set("n", "<S-tab>", ":tabprevious<CR>", opts)

-- Split windows
keymap.set("n", "ss", ":split<CR>", opts)
keymap.set("n", "sv", ":vsplit<CR>", opts)

--Move windows
keymap.set("n", "sh", "<C-w>h", opts)
keymap.set("n", "sj", "<C-w>k", opts)
keymap.set("n", "sk", "<C-w>j", opts)
keymap.set("n", "sl", "<C-w>l", opts)

-- Resize windows
keymap.set("n", "<C-l>", "<C-w><", opts)
keymap.set("n", "<C-h>", "<C-w>>", opts)
keymap.set("n", "<C-j>", "<C-w>+", opts)
keymap.set("n", "<C-k>", "<C-w>-", opts)

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- Search Telescope
keymap.set("n", "sf", ":Telescope find_files<CR>", opts)

-- rename word
-- vim.keymap.set("n", "<leader>rn", function()
keymap.set("n", "<leader>rn", ":IncRename ")
