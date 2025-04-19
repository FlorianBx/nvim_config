local M = {}

function M.setup(capabilities)
  local lspconfig = require("lspconfig")

  lspconfig.angularls.setup({
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("angular.json", "project.json"),
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
    settings = {
      angular = {
        enable = true,
        trace = { server = "messages" },
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
      local ng = require("ng");
      local keymap = vim.keymap
      local keymapOptionsWithDesc = function(desc)
        return { buffer = bufnr, noremap = true, silent = true, desc = desc }
      end

      -- Angular-specific KEYMAPS
      keymap.set("n", "<leader>at", ng.goto_template_for_component, keymapOptionsWithDesc("component -> template"))
      keymap.set("n", "<leader>ac", ng.goto_component_with_template_file, keymapOptionsWithDesc("template -> component"))
      keymap.set("n", "<leader>as", ng.get_template_tcb, keymapOptionsWithDesc("Show TCB (Template Type Check Block) for current template"))
    end
  })
end

return M
