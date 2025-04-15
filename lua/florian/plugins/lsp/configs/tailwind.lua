local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local capabilities = require("florian.plugins.lsp.configs.common").setup()

  lspconfig.tailwindcss.setup({
    capabilities = capabilities,
    filetypes = { 
      "html", 
      "javascript", 
      "javascriptreact", 
      "typescript", 
      "typescriptreact", 
      "vue",
      "angular"
    },
    init_options = {
      userLanguages = {
        vue = "html"
      }
    },
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = { -- Patterns améliorés
            { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
            "tw`([^`]*)",
            "class:\\s*\"([^\"]*)"
          }
        }
      }
    }
  })
end

return M
