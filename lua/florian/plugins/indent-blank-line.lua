local indentBlankline = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPost",
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = { enabled = true },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
  main = "ibl",
}

return indentBlankline
