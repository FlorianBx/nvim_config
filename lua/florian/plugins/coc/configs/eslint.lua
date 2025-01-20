local M = {}

function M.setup()
  -- Configuration ESLint
  vim.g.coc_global_extensions = vim.g.coc_global_extensions or {}
  table.insert(vim.g.coc_global_extensions, 'coc-eslint')

  -- Configuration globale pour ESLint
  local config = {
    ["eslint.enable"] = true,
    ["eslint.autoFixOnSave"] = false,
    ["eslint.quiet"] = true,
    ["eslint.packageManager"] = "pnpm",
    ["eslint.run"] = "onType",
    ["eslint.validateOnType"] = false,
    ["eslint.probe"] = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "html"
    }
  }

  -- Fusionner avec la configuration existante
  for key, value in pairs(config) do
    vim.fn.CocAction("updateConfig", key, value)
  end

  -- Keymaps spécifiques à ESLint
  local keyset = vim.keymap.set
  keyset("n", "<leader>ef", ":CocCommand eslint.executeAutofix<CR>", 
    { silent = true, desc = "ESLint fix current file" })
  keyset("n", "<leader>ed", ":CocCommand eslint.showOutputChannel<CR>", 
    { silent = true, desc = "Show ESLint output" })
end

return M
