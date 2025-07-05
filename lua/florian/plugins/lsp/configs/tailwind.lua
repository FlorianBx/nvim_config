local M = {}

function M.setup(capabilities)

  vim.lsp.config.tailwindcss = {
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
  }
  
  vim.lsp.enable('tailwindcss')
  
  vim.lsp.config.html = {
    capabilities = capabilities,
    filetypes = { "html" },
  }
  
  vim.lsp.enable('html')
  
  vim.lsp.config.cssls = {
    capabilities = capabilities,
    filetypes = { "css", "scss", "less" },
  }
  
  vim.lsp.enable('cssls')
end

return M