local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local capabilities = require("florian.plugins.lsp.configs.common").setup()

  lspconfig.volar.setup({
    capabilities = capabilities,
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
    init_options = {
      typescript = {
        tsdk = vim.fn.expand("$HOME/node_modules/typescript/lib")
        -- ou si typescript est installé globalement :
        -- tsdk = vim.fn.expand("$HOME/.pnpm/global/5/node_modules/typescript/lib")
      },
      languageFeatures = {
        implementation = true,
        references = true,
        definition = true,
        typeDefinition = true,
        callHierarchy = true,
        hover = true,
        rename = true,
        signatureHelp = true,
        codeAction = true,
        diagnostics = true,
        documentHighlight = true,
        documentLink = true,
        workspaceSymbol = true,
        codeLens = true,
        completion = {
          defaultTagNameCase = 'both',
          defaultAttrNameCase = 'kebabCase',
          getDocumentNameCasesRequest = false,
          getDocumentSelectionRequest = false,
        }
      }
    }
  })
end

return M
