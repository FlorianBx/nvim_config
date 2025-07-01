return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local common = require("florian.plugins.lsp.configs.common")
      local capabilities = common.setup()

      require("florian.plugins.lsp.configs.vue").setup(capabilities)
    end
  },

  {
    "florianbx/ng-croissant",
    ft = { "typescript", "javascript", "html" },
    cond = function()
      return vim.fn.glob("**/angular.json") ~= ""
    end,
  },
}