local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "oxfmt" },
    typescript = { "oxfmt" },
    vue = { "oxfmt" },
    css = { "oxfmt" },
  },

  formatters = {
    oxfmt = {
      command = "oxfmt",
      args = { "--stdin-filepath", "$FILENAME" },
      stdin = true,
    },
  },

}

return options
