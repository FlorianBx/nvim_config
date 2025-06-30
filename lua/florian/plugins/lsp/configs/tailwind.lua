local M = {}

function M.setup(capabilities)
  local lspconfig = require("lspconfig")

  lspconfig.tailwindcss.setup({
    capabilities = capabilities,
    filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            "tw`([^`]*)",
            "tw=\"([^\"]*)",
            "tw={\"([^\"}]*)",
            "tw\\.\\w+`([^`]*)",
            "tw\\(.*?\\)`([^`]*)",
          },
        },
      },
    },
  })

  lspconfig.html.setup({
    capabilities = capabilities,
    filetypes = { "html" },
  })

  lspconfig.cssls.setup({
    capabilities = capabilities,
    filetypes = { "css", "scss", "less" },
  })
end

return M