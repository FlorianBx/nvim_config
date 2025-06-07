local M = {}


function M.setup()

  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  })

  -- require("lspconfig").typescript_tools.setup({
  --   capabilities = capabilities,
  -- })

  -- local keymap = vim.keymap
  -- local keymapOptionsWithDesc = function(desc)
  --   return { noremap = true, silent = true, desc = desc }
  -- end

--   keymap.set("n", "<leader>to", "<cmd>TSToolsOrganizeImports<CR>", keymapOptionsWithDesc("Organize imports"))
--   keymap.set("n", "<leader>ts", "<cmd>TSToolsSortImports<CR>", keymapOptionsWithDesc("Sort imports"))
--   keymap.set("n", "<leader>tu", "<cmd>TSToolsRemoveUnusedImports<CR>", keymapOptionsWithDesc("Remove unused imports"))
--   keymap.set("n", "<leader>tU", "<cmd>TSToolsRemoveUnused<CR>", keymapOptionsWithDesc("Remove all unused statements"))
--   keymap.set("n", "<leader>tm", "<cmd>TSToolsAddMissingImports<CR>", keymapOptionsWithDesc("Add missing imports"))
--   keymap.set("n", "<leader>tf", "<cmd>TSToolsFixAll<CR>", keymapOptionsWithDesc("Fix all fixable errors"))
--   keymap.set("n", "<leader>tg", "<cmd>TSToolsGoToSourceDefinition<CR>", keymapOptionsWithDesc("Go to source definition"))
--   keymap.set("n", "<leader>tr", "<cmd>TSToolsRenameFile<CR>", keymapOptionsWithDesc("Rename file and update references"))
--   keymap.set("n", "<leader>tR", "<cmd>TSToolsFileReferences<CR>", keymapOptionsWithDesc("Find file references"))
end

return M

