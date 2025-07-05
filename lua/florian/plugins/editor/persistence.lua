return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {},
  keys = {
    { "<leader>wr", function() require("persistence").load() end, desc = "Workspace Restore" },
    { "<leader>wl", function() require("persistence").load({ last = true }) end, desc = "Workspace Last" },
    { "<leader>we", function() require("persistence").stop() end, desc = "Workspace Exclude" },
  },
}