local M = {}

function M.setup()
  local keyset = vim.keymap.set

  -- Tailwind specific keymaps
  keyset("n", "<leader>ti", ":CocCommand tailwindCSS.showOutput<CR>", { silent = true, desc = "Tailwind CSS info" })
  
  -- Configuration pour l'autocomplétion Tailwind
  vim.g.coc_tailwind_intellisense = true
  
  -- Support des classes personnalisées
  vim.g.coc_tailwind_custom_classes = {
    ['container'] = true,
    ['btn'] = true,
    ['card'] = true,
  }
  
  -- Configuration des couleurs Tailwind dans Vim
  vim.cmd([[
    hi! TailwindBlue guifg=#3B82F6
    hi! TailwindGreen guifg=#10B981
    hi! TailwindRed guifg=#EF4444
    hi! TailwindYellow guifg=#F59E0B
  ]])
end

return M
