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
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
      vim.fn.CocAction("format")
    end,
  })

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
end

return M
