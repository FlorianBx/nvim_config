return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
  keys = {
    { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Git Diff View" },
    { "<leader>gt", "<cmd>DiffviewFileHistory %<cr>", desc = "Git File History" },
    { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Diff View" },
    { "<leader>gr", "<cmd>DiffviewRefresh<cr>", desc = "Refresh Diff View" },
  },
  opts = {
    enhanced_diff_hl = true,
    use_icons = true,
    view = {
      default = {
        layout = "diff2_horizontal",
        winbar_info = true,
      },
      merge_tool = {
        layout = "diff3_horizontal",
        disable_diagnostics = true,
      },
    },
    file_panel = {
      listing_style = "list",
      win_config = {
        width = 35,
      },
    },
  },
  config = function(_, opts)
    require("diffview").setup(opts)
    
    vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#032e15", fg = "#a6e3a1" })
    vim.api.nvim_set_hl(0, "DiffChange", { bg = "#2a2416", fg = "#fab387" })
    vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#82181a", fg = "#f38ba8" })
    vim.api.nvim_set_hl(0, "DiffText", { bg = "#3a2416", fg = "#fff9e6", bold = true })
  end,
}