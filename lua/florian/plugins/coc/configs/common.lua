local M = {}

function M.setup()
  -- Configuration générale de l'UI
  vim.opt.updatetime = 300
  vim.opt.signcolumn = "yes"

  -- Highlight des symboles
  vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
      vim.fn["CocActionAsync"]("highlight")
    end,
  })

  -- Format on save
  -- vim.api.nvim_create_autocmd("BufWritePre", {
  --   pattern = "*",
  --   callback = function()
  --     vim.fn.CocAction("format")
  --   end,
  -- })

  -- Colors pour les diagnostics
  vim.cmd([[
    hi! CocErrorSign guifg=#D76C82
    hi! CocWarningSign guifg=#FBD288
    hi! CocInfoSign guifg=#A2D2DF
    hi! CocHintSign guifg=#15aabf
    hi! CocErrorFloat guifg=#D76C82
    hi! CocWarningFloat guifg=#FBD288
    hi! CocInfoFloat guifg=#A2D2DF
    hi! CocHintFloat guifg=#15aabf
    hi! CocHighlightText guibg=#2E3440
  ]])

  -- Keymaps communs pour tous les langages
  local keyset = vim.keymap.set

  -- Lists
  keyset("n", "<leader>dl", ":CocList diagnostics<CR>", { silent = true, desc = "List diagnostics" })
  keyset("n", "<leader>ol", ":CocList outline<CR>", { silent = true, desc = "List outline" })
  keyset("n", "<leader>sl", ":CocList -I symbols<CR>", { silent = true, desc = "List symbols" })

  -- Utilities
  keyset("n", "<leader>cl", ":CocList<CR>", { silent = true, desc = "Open CocList" })
  keyset("n", "<leader>cr", ":CocRestart<CR>", { silent = true, desc = "Restart COC" })
  keyset("n", "<leader>cd", ":CocDiagnostics<CR>", { silent = true, desc = "Show diagnostics" })

	-- Code navigation
	keyset("n", "gt", ":call CocAction('jumpDefinition')<CR>", { silent = true, desc = "Go to definition" })
	keyset("n", "gy", ":call CocAction('jumpTypeDefinition')<CR>", { silent = true, desc = "Go to type definition" })
	keyset("n", "gi", ":call CocAction('jumpImplementation')<CR>", { silent = true, desc = "Go to implementation" })
	keyset("n", "gr", ":call CocAction('jumpReferences')<CR>", { silent = true, desc = "Go to references" })

	-- Error diagnostics navigation
	keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true, desc = "Previous diagnostic" })
	keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true, desc = "Next diagnostic" })

	-- Optionnel : raccourci pour voir la liste des diagnostics
	keyset("n", "<leader>d", ":CocList diagnostics<CR>", { silent = true, desc = "Show diagnostics list" })

	-- Optionnel : voir les détails de l'erreur
	keyset("n", "K", ":call CocAction('doHover')<CR>", { silent = true, desc = "Show error details" })
end

return M
