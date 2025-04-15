local poimandres = {
  "olivercederborg/poimandres.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("poimandres").setup({})
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
