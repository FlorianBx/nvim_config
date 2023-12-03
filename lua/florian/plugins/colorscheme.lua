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
  end,
}

return poimandres
