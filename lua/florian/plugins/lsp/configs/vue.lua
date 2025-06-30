local M = {}

function M.setup(capabilities)
  local lspconfig = require("lspconfig")
  
  vim.diagnostic.config({
    virtual_text = {
      severity = { min = vim.diagnostic.severity.WARN },
      prefix = "●",
    },
    virtual_lines = true,
    signs = true, 
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  })

  lspconfig.volar.setup({
    capabilities = capabilities,
    filetypes = { "vue", "typescript", "javascript" },
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "vue.config.js", "vite.config.js", "vite.config.ts", "nuxt.config.js", "nuxt.config.ts", ".git"),
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
      local keymap = vim.keymap
      local opts = { buffer = bufnr, silent = true }

      keymap.set("n", "<leader>tr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
      keymap.set("n", "<leader>ta", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code actions" }))
      keymap.set("n", "<leader>tf", vim.lsp.buf.format, vim.tbl_extend("force", opts, { desc = "Format" }))
      keymap.set("n", "<leader>td", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
      keymap.set("n", "<leader>tR", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "References" }))
      
      -- Vue-specific keymaps
      keymap.set("n", "<leader>vr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Vue rename" }))
      keymap.set("n", "<leader>va", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Vue actions" }))

      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    end,
  })
end

return M
