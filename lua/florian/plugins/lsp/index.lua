return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "pmizio/typescript-tools.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      -- Configuration de base
      local status_ok, common = pcall(require, "florian.plugins.lsp.configs.common")
      if status_ok then
        common.setup()
      else
        vim.notify("LSP common config not found!", vim.log.levels.ERROR)
        return
      end
      
      -- Configuration par langage
      local configs = {
        "angular",
        "vue",
        "html",
        "css",
        "tailwind"
      }

      for _, config in ipairs(configs) do
        local status_ok, module = pcall(require, "florian.plugins.lsp.configs." .. config)
        if status_ok then
          module.setup()
        else
          vim.notify("Failed to load LSP config: " .. config, vim.log.levels.WARN)
        end
      end
    end
  }
}
