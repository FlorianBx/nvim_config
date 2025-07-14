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
      require("florian.plugins.lsp.configs.typescript").setup(capabilities)
      
      vim.lsp.config.emmet_language_server = {
        capabilities = capabilities,
        filetypes = { "css", "html", "javascript", "javascriptreact", "less", "sass", "scss", "typescriptreact", "vue" },
        init_options = {
          includeLanguages = {
            ["vue-html"] = "html",
            ["vue"] = "html"
          },
          showAbbreviationSuggestions = true,
          showExpandedAbbreviation = "always",
        },
      }
      vim.lsp.enable('emmet_language_server')
    end
  },

}
