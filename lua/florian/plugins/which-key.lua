return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
      { "<leader>l", group = "lsp" },
      { "<leader>c", group = "code" },
      { "<leader>e", group = "explorer" },
      { "<leader>w", group = "window" },
      { "<leader>s", group = "search" },
      { "<leader>t", group = "toggle" },
      { "<leader>b", group = "buffer" },
      { "<leader>d", group = "debug" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add(opts.defaults)
  end,
}