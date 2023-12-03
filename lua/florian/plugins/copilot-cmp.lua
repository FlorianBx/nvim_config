local copilot = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = { enabled = true },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}

return copilot
