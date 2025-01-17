return {
  "TabbyML/vim-tabby",
  event = "VeryLazy",
  config = function()
    vim.g.tabby_trigger_mode = 'auto' -- || 'manual'
    vim.g.tabby_keybinding_accept = '<Tab>'
    vim.g.tabby_keybinding_reject = '<C-]>'
    
    vim.g.tabby_language_server = {
      typescript = true,
      javascript = true,
      vue = true,
			html = true,
			angular = true,
			python = true
    }
    
    -- URL du serveur Tabby (par défaut)
    vim.g.tabby_server_url = 'http://localhost:8080'
  end,
}
