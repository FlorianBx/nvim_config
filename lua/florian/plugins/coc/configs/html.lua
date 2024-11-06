local M = {}

function M.setup()
  local keyset = vim.keymap.set

  -- HTML specific keymaps
  keyset("n", "<leader>hp", ":CocCommand html.preview<CR>", { silent = true, desc = "Preview HTML" })
  
  -- Emmet shortcuts
  vim.g.user_emmet_mode = 'inv'  -- Enable all functions in all modes
  vim.g.user_emmet_leader_key = '<C-e>'
  vim.g.user_emmet_settings = {
    html = {
      ['extends'] = 'html',
      snippets = {
        ['!'] = '!!!+html[lang=${lang}]>(head>(meta[charset=${charset}]+title{${1:Document}})+body',
        ['meta:vp'] = 'meta[name="viewport" content="width=device-width,initial-scale=1.0"]',
      }
    }
  }

  -- Auto-close tags
  vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue,*.component.html'
end

return M
