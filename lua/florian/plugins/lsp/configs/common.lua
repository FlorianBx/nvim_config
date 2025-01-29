local M = {}

function M.setup()
  -- Setup Mason de base
  require("mason").setup({
    ui = { border = "rounded" }
  })

  -- Configuration des diagnostics
  vim.diagnostic.config({
    virtual_text = true,  -- Messages inline
    signs = true,         -- Icônes dans la gutter
    underline = true,     -- Soulignement des erreurs
    update_in_insert = false,
    severity_sort = true,
    float = { border = "rounded" }
  })

  -- Capabilités LSP de base
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  return capabilities
end

return M
