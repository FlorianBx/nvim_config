local lspsaga = {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({})
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      prefix = " ",
      scope = "cursor",
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})

vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { noremap = true, desc = "Code action" })
vim.keymap.set("n", "<leader>h", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, desc = "Hover doc" })
vim.keymap.set("n", "<C-f>", "<cmd>Lspsaga lsp_finder<CR>", { noremap = true, desc = "LSP finder" })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { noremap = true, desc = "Rename" })
vim.keymap.set(
  "n",
  "<leader>ds",
  "<cmd>Lspsaga show_line_diagnostics<CR>",
  { noremap = true, desc = "Show line diagnostics" }
)
vim.keymap.set(
  "n",
  "<leader>nd",
  "<cmd>Lspsaga diagnostic_jump_next<CR>",
  { noremap = true, desc = "Show the next diagnostic" }
)
vim.keymap.set(
  "n",
  "<leader>pd",
  "<cmd>Lspsaga diagnostic_jump_prev<CR>",
  { noremap = true, desc = "Show the previous diagnostic" }
)
vim.keymap.set(
  "n",
  "<leader>cd",
  "<cmd>Lspsaga show_cursor_diagnostics<CR>",
  { noremap = true, desc = "Show cursor diagnostics" }
)
-- vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga preview_definition<CR>", { noremap = true, desc = "Preview definition" })

return lspsaga
