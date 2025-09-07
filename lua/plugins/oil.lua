return {
    "stevearc/oil.nvim",
    cond = function() return not vim.g.vscode end,
    opts = {},
    dependencies = {
      "echasnovski/mini.surround"
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
