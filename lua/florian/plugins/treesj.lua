local treesj = {
  "Wansmer/treesj",
  keys = { { "<leader>op", "<CMD>TSJToggle<CR>" } },
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  opts = { use_default_keymaps = false },
}

return treesj
