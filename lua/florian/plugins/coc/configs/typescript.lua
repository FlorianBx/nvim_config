local M = {}

function M.setup()
  local keyset = vim.keymap.set

  -- TypeScript specific keymaps
  keyset("n", "<leader>ti", ":CocCommand tsserver.organizeImports<CR>", { silent = true, desc = "Organize imports" })
  keyset("n", "<leader>tr", ":CocCommand tsserver.restart<CR>", { silent = true, desc = "Restart TS server" })
  keyset("n", "<leader>tf", ":CocCommand tsserver.findReferences<CR>", { silent = true, desc = "Find references" })
  keyset("n", "<leader>tR", ":CocCommand tsserver.rename<CR>", { silent = true, desc = "Rename symbol" })
  keyset("n", "<leader>tI", ":CocCommand tsserver.implementInterface<CR>", { silent = true, desc = "Implement interface" })
  
  -- Snippets TypeScript
  vim.g.coc_user_snippets = {
    typescript = {
      ['int'] = 'interface ${1:name} {\n\t${2}\n}',
      ['type'] = 'type ${1:name} = ${2}',
      ['enum'] = 'enum ${1:name} {\n\t${2}\n}',
      ['class'] = 'class ${1:name} {\n\tconstructor(${2}) {\n\t\t${3}\n\t}\n}',
    }
  }

  -- Auto-import configurations
  vim.g.coc_typescript_prefer_import_from = true
end

return M
