local iceberg = {
  "cocopon/iceberg.vim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme iceberg")
    vim.api.nvim_set_hl(0, 'CursorLineNr', {
      fg   = '#0084d1',
      bold = true,
    })

    vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi StatusLine guibg=NONE guifg=#6b7089 ctermbg=NONE
      hi StatusLineNC guibg=NONE guifg=#444b5c ctermbg=NONE
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
      hi DiagnosticFloating guibg=NONE

      " Soulignements plus subtils
      hi DiagnosticUnderlineError guisp=#e6a2a2 gui=undercurl
      hi DiagnosticUnderlineWarn guisp=#e6c99e gui=undercurl
      hi DiagnosticUnderlineInfo guisp=#9ec3e6 gui=undercurl
      hi DiagnosticUnderlineHint guisp=#9ee6b8 gui=undercurl

      hi NormalFloat guibg=NONE guifg=#c6c8d1
      hi FloatBorder guifg=#6b7089 guibg=NONE
      hi FloatTitle guifg=#84a0c6 guibg=NONE
      
      hi LspFloatWinNormal guibg=NONE guifg=#c6c8d1
      hi LspFloatWinBorder guifg=#6b7089 guibg=NONE

      " Telescope consistent colors
      hi TelescopeNormal guibg=NONE guifg=#c6c8d1
      hi TelescopeBorder guifg=#6b7089 guibg=NONE
      hi TelescopePromptNormal guibg=NONE guifg=#c6c8d1
      hi TelescopePromptBorder guifg=#6b7089 guibg=NONE
      hi TelescopePromptTitle guifg=#84a0c6 guibg=NONE
      hi TelescopePreviewTitle guifg=#84a0c6 guibg=NONE
      hi TelescopeResultsTitle guifg=#84a0c6 guibg=NONE
      hi TelescopeSelection guibg=NONE guifg=#c6c8d1

      " Oil file manager colors - match main editor
      hi OilDir guifg=#c6c8d1
      hi OilDirIcon guifg=#c6c8d1
      hi OilFile guifg=#c6c8d1
      hi OilFileIcon guifg=#c6c8d1
      hi OilPermissionNone guifg=#6b7089
      hi OilPermissionRead guifg=#c6c8d1
      hi OilPermissionWrite guifg=#c6c8d1
      hi OilPermissionExecute guifg=#c6c8d1
      hi OilCursor guibg=NONE

      " Much darker statusline and bufferline
      hi WinBar guibg=NONE guifg=NONE
      hi WinBarNC guibg=NONE guifg=NONE
      hi MsgArea guibg=NONE guifg=#c6c8d1
      hi CmdLine guibg=NONE guifg=#c6c8d1
      hi WildMenu guibg=NONE guifg=#c6c8d1

      

      hi OilFloat guibg=NONE guifg=#c6c8d1
      hi OilFloatBorder guifg=#6b7089 guibg=NONE
      
      autocmd FileType oil hi OilFile guifg=#c6c8d1
      autocmd FileType oil hi OilDir guifg=#c6c8d1
      
      hi TabLine guibg=NONE ctermbg=NONE guifg=#6b7089
      hi TabLineFill guibg=NONE ctermbg=NONE
      hi TabLineSel guibg=NONE ctermbg=NONE guifg=#ffffff
      ]])
    
    vim.schedule(function()
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#6b7089" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#444b5c" })
      vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE", fg = "#6b7089" })
      vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE", fg = "#ffffff" })
    end)
    
  end,
}

return iceberg
