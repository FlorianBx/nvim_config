local M = {}

function M.setup(capabilities)
  vim.lsp.config.ts_ls = {
    capabilities = capabilities,
    filetypes = { "typescript", "javascript" },
    root_dir = function(fname)
      return vim.fs.root(fname, { "package.json", "tsconfig.json", "jsconfig.json", ".git" })
    end,
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
        preferences = {
          importModuleSpecifier = "relative",
          includePackageJsonAutoImports = "auto",
          quotePreference = "double",
        },
        suggest = {
          autoImports = true,
          completeFunctionCalls = true,
          includeCompletionsForModuleExports = true,
        },
      },
      javascript = {
        preferences = {
          importModuleSpecifier = "relative",
          includePackageJsonAutoImports = "auto",
          quotePreference = "double",
        },
        suggest = {
          autoImports = true,
          completeFunctionCalls = true,
          includeCompletionsForModuleExports = true,
        },
      },
    },
  }
  
  vim.lsp.enable('ts_ls')
end

return M