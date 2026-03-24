require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>", { desc = "Escape" })

map("n", "<leader>ew", ":w<CR>", { noremap = true, silent = true, desc = "Save current file" })
map("n", "<leader>r", ":e!<CR>", { noremap = true, silent = true, desc = "Reload buffer" })
map("n", "ga", "gg<S-v>G", { noremap = true, silent = true, desc = "Select all" })

map("n", "ss", ":split<CR> | <C-w>j", { noremap = true, silent = true, desc = "Split horizontal" })
map("n", "sv", ":vsplit<CR> | <C-w>l", { noremap = true, silent = true, desc = "Split vertical" })
map("n", "sx", "<cmd>close<CR>", { noremap = true, silent = true, desc = "Close split" })
map("n", "sw", "<cmd>only<CR>", { noremap = true, silent = true, desc = "Close other splits" })

map("n", "<C-S-l>", "<C-w><5", { noremap = true, silent = true, desc = "Resize window left" })
map("n", "<C-S-h>", "<C-w>>5", { noremap = true, silent = true, desc = "Resize window right" })
map("n", "<C-S-k>", "<C-w>+5", { noremap = true, silent = true, desc = "Resize window up" })
map("n", "<C-S-j>", "<C-w>-5", { noremap = true, silent = true, desc = "Resize window down" })

map("n", "<leader>nh", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear search highlights" })
map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle file explorer" })
map("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { noremap = true, silent = true, desc = "Reveal file in explorer" })

map("n", "<leader>ll", function() require("conform").format({ lsp_fallback = true }) end, { noremap = true, silent = true, desc = "Format buffer" })
