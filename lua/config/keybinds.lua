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


keymap.set("n", "<C-h>", "<C-w>h", keymapOptionsWithDesc("Move to left split"))
keymap.set("n", "<C-j>", "<C-w>j", keymapOptionsWithDesc("Move to bottom split"))
keymap.set("n", "<C-k>", "<C-w>k", keymapOptionsWithDesc("Move to top split"))
keymap.set("n", "<C-l>", "<C-w>l", keymapOptionsWithDesc("Move to right split"))

keymap.set("n", "<C-S-l>", "<C-w><5", keymapOptionsWithDesc("Resize window left"))
keymap.set("n", "<C-S-h>", "<C-w>>5", keymapOptionsWithDesc("Resize window right"))
keymap.set("n", "<C-S-k>", "<C-w>+5", keymapOptionsWithDesc("Resize window up"))
keymap.set("n", "<C-S-j>", "<C-w>-5", keymapOptionsWithDesc("Resize window down"))

keymap.set("n", "<leader>nh", ":nohlsearch<CR>", keymapOptionsWithDesc("Clear search highlights"))


keymap.set("n", "<S-h>", "<Cmd>bprevious<CR>", keymapOptionsWithDesc("Previous buffer"))
keymap.set("n", "<S-l>", "<Cmd>bnext<CR>", keymapOptionsWithDesc("Next buffer"))


keymap.set("n", "-", "<CMD>Oil<CR>", keymapOptionsWithDesc("Open parent directory"))

keymap.set("n", "<leader>th", ":split | terminal<CR>", keymapOptionsWithDesc("Open horizontal terminal"))
keymap.set("n", "<leader>ty", ":vsplit | wincmd l | terminal<CR>", keymapOptionsWithDesc("Open vertical terminal"))
keymap.set("n", "<leader>tt", ":tabnew | terminal<CR>", keymapOptionsWithDesc("Open terminal in new tab"))
keymap.set("n", "<leader>tf", ":terminal<CR>", keymapOptionsWithDesc("Open terminal in current buffer"))
keymap.set("n", "tx", ":q<CR>", keymapOptionsWithDesc("Close current terminal/window"))

keymap.set("n", "<leader>ll", function() require("conform").format({ lsp_fallback = true }) end, keymapOptionsWithDesc("Format buffer with Prettier"))
