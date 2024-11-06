local M = {}

function M.setup()
  local keyset = vim.keymap.set

  -- CSS specific keymaps
  keyset("n", "<leader>cp", ":CocCommand css.lint.propertyIgnoredDueToDisplay<CR>", { silent = true, desc = "Check CSS property" })
  
  -- Emmet shortcuts pour CSS
  vim.g.user_emmet_settings = {
    css = {
      ['extends'] = 'css',
      snippets = {
        ['@m'] = '@media screen and (min-width: ${1:320px}) {\n\t${2}\n}',
        ['@i'] = '@import url(${1});',
        ['@f'] = '@font-face {\n\tfont-family: ${1};\n\tsrc: url(${2});\n}',
      }
    }
  }

  -- Auto-complétion des unités CSS
  vim.g.coc_css_units = {
    'px', 'em', 'rem', '%', 'vw', 'vh', 'deg', 'rad', 'ms', 's'
  }
end

return M
