return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "pmizio/typescript-tools.nvim",
      "nvim-lua/plenary.nvim",
      "nvimdev/lspsaga.nvim", -- Pour l'UI améliorée
      "L3MON4D3/LuaSnip" -- Snippets
    },
    config = function()
      -- Configuration commune
      local common = require("florian.plugins.lsp.configs.common")
      local capabilities = common.setup()

      -- Chargement des configs spécifiques
      require("florian.plugins.lsp.configs.vue").setup(capabilities)
      require("florian.plugins.lsp.configs.tailwind").setup(capabilities)
      require("florian.plugins.lsp.configs.typescript").setup(capabilities)
    end
  }
}
