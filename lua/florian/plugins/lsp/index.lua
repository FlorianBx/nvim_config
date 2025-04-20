return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "pmizio/typescript-tools.nvim",
      "nvim-lua/plenary.nvim",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local common = require("florian.plugins.lsp.configs.common")
      local capabilities = common.setup()

      require("florian.plugins.lsp.configs.vue").setup(capabilities)
      require("florian.plugins.lsp.configs.tailwind").setup(capabilities)
      require("florian.plugins.lsp.configs.typescript").setup(capabilities)
      require("florian.plugins.lsp.configs.angular").setup(capabilities)
    end
  },

  {
    "florianbx/ng-croissant",
    lazy = false,
  },
}
