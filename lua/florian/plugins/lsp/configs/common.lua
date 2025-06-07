local M = {}

function M.setup()
  require("mason").setup({
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })

  require("mason-lspconfig").setup({
    ensure_installed = {
      -- "volar",           -- Vue
      "tailwindcss",     -- Tailwind CSS
      "html",            -- HTML
      "cssls",           -- CSS
    },
    automatic_installation = true
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  return capabilities
end

return M
