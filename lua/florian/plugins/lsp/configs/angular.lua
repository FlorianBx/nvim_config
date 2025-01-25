local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local capabilities = require("florian.plugins.lsp.configs.common").setup()

  lspconfig.angularls.setup({
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("angular.json", "project.json"),
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
    settings = {
      angular = {
        enable = true,
        trace = {
          server = "messages"
        },
        diagnostics = {
          enable = true,
          templateErrors = true,
        },
        suggest = {
          fromTripleSlashReference = true,
          completeFunctionCalls = true,
        },
        format = {
          enable = true,
          insertSpaceAfterCommaDelimiter = true,
          insertSpaceAfterSemicolonInForStatements = true,
          insertSpaceBeforeAndAfterBinaryOperators = true,
          insertSpaceAfterKeywordsInControlFlowStatements = true,
          insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
          insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
          placeOpenBraceOnNewLineForFunctions = false,
          placeOpenBraceOnNewLineForControlBlocks = false,
        },
      }
    },
    on_attach = function(client, bufnr)
      -- Keymaps spécifiques à Angular
      local opts = { buffer = bufnr }
      vim.keymap.set("n", "<leader>at", ":AngularGoToTemplateForComponent<CR>", opts)
      vim.keymap.set("n", "<leader>ac", ":AngularGoToComponentWithTemplateFile<CR>", opts)
      vim.keymap.set("n", "<leader>as", ":AngularGoToSpec<CR>", opts)
      vim.keymap.set("n", "<leader>ag", ":AngularGoToDefinition<CR>", opts)
    end
  })
end

return M
