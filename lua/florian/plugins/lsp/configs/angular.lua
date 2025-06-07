local M = {}

function M.setup(capabilities)
  local lspconfig = require("lspconfig")

  lspconfig.angular.setup({
    capabilities = capabilities,
    -- root_dir = lspconfig.util.root_pattern("angular.json", "project.json"),
    filetypes = { "typescript", "html" },
    -- settings = {
    --   angular = {
    --     enable = true,
    --     trace = { server = "messages" },
    --     diagnostics = {
    --       enable = true,
    --       templateErrors = true,
    --     },
    --     suggest = {
    --       fromTripleSlashReference = true,
    --       completeFunctionCalls = true,
    --     },
    --     format = {
    --       enable = true,
    --       insertSpaceAfterCommaDelimiter = true,
    --       insertSpaceAfterSemicolonInForStatements = true,
    --       insertSpaceBeforeAndAfterBinaryOperators = true,
    --       insertSpaceAfterKeywordsInControlFlowStatements = true,
    --       insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
    --       insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
    --       placeOpenBraceOnNewLineForFunctions = false,
    --       placeOpenBraceOnNewLineForControlBlocks = false,
    --     },
    --   }
    -- },
    on_attach = function(_, _)
      local ng = require("ng-croissant");
      local keymap = vim.keymap

      -- Angular-specific KEYMAPS
      keymap.set("n", "<leader>ac", ng.goto_component_ts, { desc = "All -> component.ts" })
      keymap.set("n", "<leader>at", ng.goto_component_html, { desc = "All -> component.html" })
      keymap.set("n", "<leader>as", ng.goto_component_spec, { desc = "All -> component.spec.ts" })
      keymap.set("n", "<leader>acc", ng.goto_component_css, { desc = "All -> component.css" })
      keymap.set("n", "<leader>ass", ng.goto_component_scss, { desc = "All -> component.scss" })
    end
  })
end

return M
