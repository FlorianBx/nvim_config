local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "j", "k", { noremap = true })
keymap.set("n", "k", "j", { noremap = true })
keymap.set("v", "j", "k", { noremap = true })
keymap.set("v", "k", "j", { noremap = true })

-- Move selected
keymap.set("n", "J", ":m .+1<CR>==", vim.tbl_extend('force', opts, {desc = "Move current line down in normal mode"}))
keymap.set("n", "K", ":m .-2<CR>==", vim.tbl_extend('force', opts, {desc = "Move current line up in normal mode"}))

keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi", vim.tbl_extend('force', opts, {desc = "Move current line down in insert mode"}))
keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi", vim.tbl_extend('force', opts, {desc = "Move current line up in insert mode"}))

keymap.set("v", "J", ":m '>+1<CR>gv=gv", vim.tbl_extend('force', opts, {desc = "Move selected lines down in visual mode"}))
keymap.set("v", "K", ":m '<-2<CR>gv=gv", vim.tbl_extend('force', opts, {desc = "Move selected lines up in visual mode"}))

---- Quick Actions ----
keymap.set("i", "jj", "<Esc>", opts)
keymap.set("n", "<leader>qq", ":q<CR>", opts)
keymap.set("n", "<leader>ww", ":w<CR>", opts)
-- Search Telescope
keymap.set("n", "sf", ":Telescope find_files<CR>", opts)
-- Increment / Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
-- rename word
keymap.set("n", "<leader>rn", ":IncRename ")
-- Select all
keymap.set("n", "ga", "gg<S-v>G")

---- Windows ----
keymap.set("n", "<Tab>", function()
	print("Tab key pressed in Normal mode")
end, opts)

-- Tab
keymap.set("n", "te", ":tabedit<CR>", opts)
keymap.set("n", "tc", ":tabclose<CR>", opts)
-- keymap.set("n", "<tab>", ":tabnext<CR>", opts)
keymap.set("n", "<S-tab>", ":tabprevious<CR>", opts)

-- Split windows
-- window management
keymap.set("n", "ss", ":split<CR>", opts)
keymap.set("n", "sv", ":vsplit<CR>", opts)
keymap.set("n", "st", ":vsplit | terminal<CR>", opts)
keymap.set("n", "sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Move Windows
keymap.set("n", "<leader>tj", ":wincmd K<CR>", opts)
keymap.set("n", "<leader>tk", ":wincmd J<CR>", opts)
keymap.set("n", "<leader>th", ":wincmd H<CR>", opts)
keymap.set("n", "<leader>tl", ":wincmd L<CR>", opts)

-- local close_windows = require("utils.close_windows")
-- keymap.set("n", "<leader>lq", close_windows.close_left_window, opts)
-- keymap.set("n", "<leader>rq", close_windows.close_right_window, opts)
-- keymap.set("n", "<leader>tq", close_windows.close_top_window, opts)
-- keymap.set("n", "<leader>bq", close_windows.close_bottom_window, opts)

--Move windows
keymap.set("n", "sh", "<C-w>h", opts)
keymap.set("n", "sj", "<C-w>k", opts)
keymap.set("n", "sk", "<C-w>j", opts)
keymap.set("n", "sl", "<C-w>l", opts)

-- Resize windows
keymap.set("n", "<A-h>", "<C-w><", opts)
keymap.set("n", "<A-l>", "<C-w>>", opts)
keymap.set("n", "<A-j>", "<C-w>+", opts)
keymap.set("n", "<A-k>", "<C-w>-", opts)

---- Diagnostics ----
keymap.set("n", "<C-->", function()
	vim.diagnostic.goto_next()
end, opts)
