return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
      },
      window = {
        position = "bottom",
        width = 30,
        mappings = {
          ["<space>"] = "none",
        },
      },
    })
  end,
  keys = {
    { "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
    { "<leader>ef", "<cmd>Neotree reveal<cr>", desc = "Reveal file in explorer" },
  },
}
