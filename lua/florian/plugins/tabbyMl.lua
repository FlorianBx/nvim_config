return {
  "TabbyML/vim-tabby",
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  init = function()
    vim.g.tabby_agent_start_command = {"npx", "tabby-agent", "--stdio"}
    vim.g.tabby_inline_completion_trigger = "auto"
  end,
}
