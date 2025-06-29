return {
  "aaronik/treewalker.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    highlight = true,
    highlight_duration = 250,
  },
  config = function(_, opts)
    local treewalker = require("treewalker")
    treewalker.setup(opts)

    local keymap = vim.keymap

    keymap.set({ "n", "v" }, "<A-k>", "<cmd>Treewalker Up<cr>", { desc = "Treewalker Up" })
    keymap.set({ "n", "v" }, "<A-j>", "<cmd>Treewalker Down<cr>", { desc = "Treewalker Down" })
    keymap.set({ "n", "v" }, "<A-h>", "<cmd>Treewalker Left<cr>", { desc = "Treewalker Left" })
    keymap.set({ "n", "v" }, "<A-l>", "<cmd>Treewalker Right<cr>", { desc = "Treewalker Right" })

    -- keymap.set({ "n", "v" }, "<C-k>", function() treewalker.move_up() end, { desc = "Treewalker Up" })
    -- keymap.set({ "n", "v" }, "<C-j>", function() treewalker.move_down() end, { desc = "Treewalker Down" })
    -- keymap.set({ "n", "v" }, "<C-h>", function() treewalker.move_out() end, { desc = "Treewalker Left" })
    -- keymap.set({ "n", "v" }, "<C-l>", function() treewalker.move_in() end, { desc = "Treewalker Right" })
  end,
}
