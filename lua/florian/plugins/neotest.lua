local neotest = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
  },
  config = function()
    require("neotest").setup({
      enable_autosave = true,
      adapters = {
        require("neotest-vitest"),
      },
      on_open = function()
        vim.cmd("wincmd p")
      end,
    })
  end,
}

-- return neotest
return {} 
