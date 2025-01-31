return {
  -- {
  --   "TabbyML/vim-tabby",
  --   event = "InsertEnter",
  --   build = [[
  --     curl -sSL https://tabbyml.com/downloads/tabby-macOS-x86_64 \
  --     -o /usr/local/bin/tabby && chmod +x /usr/local/bin/tabby
  --   ]],
  --   config = function()
  --     -- Configuration minimale
  --     vim.g.tabby_keybinding_trigger = "<C-l>"
  --     vim.g.tabby_enable_auto_trigger = true  -- Complétion contextuelle
  --     
  --     -- Optimisation pour Vue.js (optionnel)
  --     vim.api.nvim_create_autocmd('FileType', {
  --       pattern = 'vue',
  --       callback = function()
  --         vim.b.tabby_filecontext = { 
  --           max_prefix_lines = 15,
  --           max_suffix_lines = 5 
  --         }
  --       end
  --     })
  --   end,
  --   enabled = true
  -- }
}
