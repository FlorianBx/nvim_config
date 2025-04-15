return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = true,
      highlight = { "Function", "Label" },
    },
    exclude = {
      filetypes = {
        "help",
        "dashboard",
        "mason",
        "lazy",
        "notify",
        "toggleterm",
        "lazyterm",
        "alpha",
      },
      buftypes = {
        "terminal",
        "nofile",
        "quickfix",
        "prompt",
      },
    },
  },
  config = function(_, opts)
    require("ibl").setup(opts)
    
    -- Définir des couleurs plus discrètes pour les lignes d'indentation
    vim.cmd([[
      highlight IndentBlanklineChar guifg=#1e1e1e gui=nocombine
    ]])
    
    -- Si vous voulez que la portée du code soit également plus discrète
    vim.cmd([[
      highlight IndentBlanklineContextChar guifg=#1e1e1e gui=nocombine
    ]])
  end,
}
