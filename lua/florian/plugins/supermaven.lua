return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  opts = {
    keymaps = {
      accept_suggestion = "<Tab>",
      clear_suggestion = "<C-]>",
    },
    ignore_filetypes = { "bigfile", "neo-tree", "oil" },
    log_level = "off",
  },
}