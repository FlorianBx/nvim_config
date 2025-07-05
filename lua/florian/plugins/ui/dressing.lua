return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    require("dressing").setup({
      input = {
        border = "rounded",
        win_options = {
          winblend = 0,
          winhighlight = "NormalFloat:Normal,FloatBorder:FloatBorder",
        },
      },
      select = {
        backend = { "telescope", "builtin" },
        builtin = {
          border = "rounded",
          win_options = {
            winblend = 0,
            winhighlight = "NormalFloat:Normal,FloatBorder:FloatBorder",
          },
        },
      },
    })
  end,
}
