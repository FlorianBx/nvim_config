local M = {}

function M.setup(capabilities)
  
  vim.diagnostic.config({
    virtual_text = {
      prefix = "●",
      severity = { min = vim.diagnostic.severity.WARN },
    },
    signs = true, 
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      max_width = 80,
      max_height = 20,
      pad_top = 1,
      pad_bottom = 1,
      source = "always",
      header = "",
      prefix = "",
    },
  })
  
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    max_width = 80,
    max_height = 20,
    pad_top = 1,
    pad_bottom = 1,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
  })
  
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    max_width = 80,
    max_height = 15,
    pad_top = 1,
    pad_bottom = 1,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
  })

  vim.lsp.config.vue_ls = {
    capabilities = capabilities,
    filetypes = { "vue", "typescript", "javascript" },
    root_dir = function(fname)
      return vim.fs.root(fname, { "package.json", "tsconfig.json", "vue.config.js", "vite.config.js", "vite.config.ts", "nuxt.config.js", "nuxt.config.ts", ".git" })
    end,
    init_options = {
      vue = {
        hybridMode = false,
      },
      typescript = {
        tsdk = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/typescript/lib",
      },
    },
    settings = {
      vue = {
        inlayHints = {
          missingProps = true,
          optionsWrapper = true,
        },
        complete = {
          casing = {
            tags = "kebab",
            props = "camel",
          },
        },
      },
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
        },
      },
    },
    on_attach = function(client, bufnr)
      if client.server_capabilities.inlayHintProvider then
        vim.defer_fn(function()
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end, 500)
      end
    end,
  }
  
  vim.lsp.enable('vue_ls')
end

return M
