local toggleTerm = {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = 10,
      open_mapping = [[<leader>tt]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 1,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
    })

    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    keymap("n", "<leader>tr", ":1TermExec cmd='pnpm run dev'<CR>", opts)
    keymap("n", "<leader>ty", ":2TermExec cmd='pnpm run test'<CR>", opts)
    keymap("n", "<leader>tg", ":3TermExec cmd='' <CR>", opts)

    keymap("t", "<Esc>", "<C-\\><C-n>", opts)

    keymap("n", "<leader><Tab>", "<C-w>w", opts)
    keymap("n", "<leader><S-Tab>", "<C-w>W", opts)
  end,
}

return toggleTerm
