return {
  "aaronik/treewalker.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    { "<A-k>", "<cmd>Treewalker Up<cr>", mode = { "n", "v" }, desc = "Treewalker Up" },
    { "<A-j>", "<cmd>Treewalker Down<cr>", mode = { "n", "v" }, desc = "Treewalker Down" },
    { "<A-h>", "<cmd>Treewalker Left<cr>", mode = { "n", "v" }, desc = "Treewalker Left" },
    { "<A-l>", "<cmd>Treewalker Right<cr>", mode = { "n", "v" }, desc = "Treewalker Right" },
  },
  opts = {
    highlight = true,
    highlight_duration = 250,
  },
}
