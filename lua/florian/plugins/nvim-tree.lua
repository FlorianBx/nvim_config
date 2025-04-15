return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree")

    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Custom color for arrows in tree
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#42b883 ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#42b883 ]])

    -- NvimTree setup
    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = false,
      },
      renderer = {
        indent_markers = {
          enable = false,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    -- Key mappings for NvimTree
    local keymap = vim.keymap
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
  end,
}
