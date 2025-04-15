local M = {}

function M.setup(capabilities)
  require("lspconfig").tailwindcss.setup({
    capabilities = capabilities,
    filetypes = {
      "vue", "html", "typescript", "javascript",
      "javascriptreact", "typescriptreact", "svelte"
    },
    init_options = {
      userLanguages = { -- Support multilingue
        vue = "html",
        javascript = "javascript",
        typescript = "typescript"
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
