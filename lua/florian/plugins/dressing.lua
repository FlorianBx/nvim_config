return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    require("dressing").setup({
      border = "rounded",
      builtin = {
        border = "rounded",
        winhighlight = "Normal:Normal,FloatBorder:BorderBG",
      },
      hover = {
        border = "rounded",
      },
    })
  end,
}
