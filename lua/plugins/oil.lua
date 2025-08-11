return {
    "stevearc/oil.nvim",
    opts = {},
    depedencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<C-r>"] = "actions.refresh",
        }
      })
    end
  }