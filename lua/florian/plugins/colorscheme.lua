local poimandres = {
  "olivercederborg/poimandres.nvim",
  lazy = false,
  priority = 1000,

  -- poimandres setup
  config = function()
    require("poimandres").setup({
      -- Leave this setup function empty for default configuration
    })
  end,

  -- Optionally set the colorscheme during initialization
  init = function()
    vim.cmd("colorscheme poimandres")
    vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi LineNr guibg=NONE
      hi Folded guibg=NONE
      hi NonText guibg=NONE
      hi SpecialKey guibg=NONE
      hi VertSplit guibg=NONE
      hi SignColumn guibg=NONE
      hi EndOfBuffer guibg=NONE
    ]])
  end,
}

return poimandres
