local barbar = {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    animation = true,
    -- insert_at_start = true,
  },
  version = "^1.0.0",
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<leader><Tab>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<leader><S-Tab>", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next
map("n", "<leader><A>", "<Cmd>BufferMoveNext<CR>", opts)
map("n", "<leader><S-A>", "<Cmd>BufferMovePrevious<CR>", opts)

return barbar
