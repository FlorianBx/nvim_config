local M = {}

function M.setup()
  -- Angular specific keymaps
  local keyset = vim.keymap.set
  
  -- Navigation dans les templates
  keyset("n", "<leader>at", ":CocCommand angular.goToTemplateForComponent<CR>", { silent = true, desc = "Go to template" })
  keyset("n", "<leader>ac", ":CocCommand angular.goToComponentWithTemplateFile<CR>", { silent = true, desc = "Go to component" })
  
  -- Génération de code Angular
  keyset("n", "<leader>ag", ":CocCommand angular.generator<CR>", { silent = true, desc = "Angular generator" })
  
  -- Switch entre les fichiers spec et implementation
  keyset("n", "<leader>as", ":CocCommand angular.switchToSpec<CR>", { silent = true, desc = "Switch to spec" })
  keyset("n", "<leader>ai", ":CocCommand angular.switchToImplementation<CR>", { silent = true, desc = "Switch to implementation" })
end

return M
