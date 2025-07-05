return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 2,
      max_width = 90,
      max_height = 30,
    },
    default_file_explorer = false,
    keymaps = {
      ["q"] = "actions.close",
      ["<Esc>"] = "actions.close",
    },
  },
  keys = {
    { "<leader>ee", function() require("oil").open_float() end, desc = "Open Oil file explorer" },
  },
}