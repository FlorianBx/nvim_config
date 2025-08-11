local keymap = vim.keymap
local keymapOptionsWithDesc = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape" })
keymap.set("n", "<leader>ew", ":w<CR>", keymapOptionsWithDesc("Save current file"))

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

keymap.set("n", "<leader>nh", ":nohlsearch<CR>", keymapOptionsWithDesc("Clear search highlights"))


keymap.set("n", "<S-h>", "<Cmd>bprevious<CR>", keymapOptionsWithDesc("Previous buffer"))
keymap.set("n", "<S-l>", "<Cmd>bnext<CR>", keymapOptionsWithDesc("Next buffer"))


keymap.set("n", "-", "<CMD>Oil<CR>", keymapOptionsWithDesc("Open parent directory"))
