local M = {}

function M.setup()
  local keyset = vim.keymap.set

  -- JavaScript specific keymaps
  keyset("n", "<leader>ji", ":CocCommand tsserver.organizeImports<CR>", { silent = true, desc = "Organize imports" })
  keyset("n", "<leader>jf", ":CocCommand eslint.executeAutofix<CR>", { silent = true, desc = "ESLint autofix" })
  keyset("n", "<leader>jp", ":CocCommand prettier.formatFile<CR>", { silent = true, desc = "Prettier format" })
  
  -- Snippets communs
  vim.g.coc_user_snippets = {
    javascript = {
      ['cl'] = 'console.log(${1})',
      ['fn'] = 'function ${1:name}(${2}) {\n\t${3}\n}',
      ['af'] = '(${1}) => ${2}',
      ['des'] = 'describe(\'${1}\', () => {\n\t${2}\n})',
      ['it'] = 'it(\'${1}\', () => {\n\t${2}\n})',
    }
  }

  -- Auto-import on completion
  vim.g.coc_js_import_on_completion = true
end

return M
