return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G", "Gvdiffsplit" },
  keys = {
    { "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Git diff split" },
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
  },
}
