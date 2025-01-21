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
          classRegex = {
            "class\\s*=\\s*['\"]([^'\"]*)['\"]",
            "className\\s*=\\s*['\"]([^'\"]*)['\"]",
            ":class\\s*=\\s*['\"]([^'\"]*)['\"]",
            "['\"](.*?)['\"]"
          }
        },
        includeLanguages = {
          vue = "html",
          typescript = "javascript",
          ["typescript.tsx"] = "javascript.jsx"
        },
        validate = true,
        hovers = true,
        suggestions = true,
        colorDecorators = true
      }
    }
  })
end

return M
