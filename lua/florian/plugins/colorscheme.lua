local poimandres = {
  "olivercederborg/poimandres.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("poimandres").setup({})
    vim.cmd("colorscheme poimandres")
    vim.api.nvim_set_hl(0, 'CursorLineNr', {
      fg   = '#5de4c7',
      bold = true,
    })

    vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi LineNr guibg=NONE
      hi Folded guibg=NONE
      hi NonText guibg=NONE
      hi SpecialKey guibg=NONE
      hi VertSplit guibg=NONE
      hi SignColumn guibg=NONE
      hi EndOfBuffer guibg=NONE

      " Couleurs plus douces pour les diagnostics
      hi DiagnosticError guifg=#e6a2a2 guibg=NONE
      hi DiagnosticWarn guifg=#e6c99e guibg=NONE
      hi DiagnosticInfo guifg=#9ec3e6 guibg=NONE
      hi DiagnosticHint guifg=#9ee6b8 guibg=NONE

      " Fond légèrement teinté pour la fenêtre flottante des diagnostics
      hi DiagnosticFloating guibg=#1e2030

      " Soulignements plus subtils
      hi DiagnosticUnderlineError guisp=#e6a2a2 gui=undercurl
      hi DiagnosticUnderlineWarn guisp=#e6c99e gui=undercurl
      hi DiagnosticUnderlineInfo guisp=#9ec3e6 gui=undercurl
      hi DiagnosticUnderlineHint guisp=#9ee6b8 gui=undercurl

      " Bordures plus douces pour les fenêtres flottantes
      hi FloatBorder guifg=#42b883 guibg=NONE
      hi FloatTitle guifg=#42b883 guibg=NONE
      ]])
  end,
}

return poimandres
