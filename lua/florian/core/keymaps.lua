vim.g.mapleader = " "
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "j", "k", { noremap = true })
keymap.set("n", "k", "j", { noremap = true })
keymap.set("v", "j", "k", { noremap = true })
keymap.set("v", "k", "j", { noremap = true })

-- Move selected
keymap.set("n", "J", ":m .+1<CR>==", vim.tbl_extend("force", opts, { desc = "Move current line down in normal mode" }))
keymap.set("n", "K", ":m .-2<CR>==", vim.tbl_extend("force", opts, { desc = "Move current line up in normal mode" }))

keymap.set(
  "i",
  "<C-j>",
  "<Esc>:m .+1<CR>==gi",
  vim.tbl_extend("force", opts, { desc = "Move current line down in insert mode" })
)
keymap.set(
  "i",
  "<C-k>",
  "<Esc>:m .-2<CR>==gi",
  vim.tbl_extend("force", opts, { desc = "Move current line up in insert mode" })
)

keymap.set(
  "v",
  "J",
  ":m '>+1<CR>gv=gv",
  vim.tbl_extend("force", opts, { desc = "Move selected lines down in visual mode" })
)
keymap.set(
  "v",
  "K",
  ":m '<-2<CR>gv=gv",
  vim.tbl_extend("force", opts, { desc = "Move selected lines up in visual mode" })
)

---- Quick Actions ----
keymap.set("i", "jj", "<Esc>", opts)
keymap.set("n", "<leader>eq", ":q<CR>", opts)
keymap.set("n", "<leader>ew", ":w<CR>", opts)

-- Search Telescope
keymap.set("n", "sf", ":Telescope find_files<CR>", opts)

-- rename word
keymap.set("n", "<leader>rn", ":IncRename ")

-- Select all
keymap.set("n", "ga", "gg<S-v>G")

-- Tab
keymap.set("n", "te", ":tabedit<CR>", opts)
keymap.set("n", "tc", ":tabclose<CR>", opts)

-- window management
keymap.set("n", "ss", ":split<CR>", opts)
keymap.set("n", "sv", ":vsplit<CR>", opts)
keymap.set("n", "sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Search
keymap.set("n", "<leader>nh", ":nohlsearch<CR>", opts, { desc = "Clear highlights" })

---- Diagnostics ----
keymap.set("n", "<C-->", function()
  vim.diagnostic.goto_next()
end, opts)
