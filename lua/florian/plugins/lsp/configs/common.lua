local M = {}

function M.setup()
  -- Configuration Mason
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
      "volar",           -- Vue
      "tailwindcss",     -- Tailwind CSS
      "html",            -- HTML
      "cssls",           -- CSS
    },
    automatic_installation = true
  })

  -- Configuration simplifiée des diagnostics
  -- vim.diagnostic.config({
  --   virtual_text = true,
  --   float = {
  --     border = "rounded",
  --     source = "always",
  --   },
  --   signs = true,
  --   underline = true,
  --   update_in_insert = false,
  --   severity_sort = true,
  -- })
  --
  -- -- Configuration des icônes de diagnostic
  -- local signs = {
  --   Error = " ",
  --   Warn = " ",
  --   Hint = " ",
  --   Info = " "
  -- }
  --
  -- for type, icon in pairs(signs) do
  --   local hl = "DiagnosticSign" .. type
  --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  -- end

  -- Keymaps LSP unifiées
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      local opts = { buffer = ev.buf }

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    end
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  
  return capabilities
end

return M
