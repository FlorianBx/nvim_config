local lspconfig_setup = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    local on_attach = function(client, bufnr)
      opts.buffer = bufnr
      -- Set various keybindings for LSP functionalities
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
      -- additional keybindings follow...

      -- Restart LSP mapping
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change Diagnostic symbols
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Server configurations
    lspconfig["html"].setup({ capabilities = capabilities, on_attach = on_attach })
    lspconfig["tsserver"].setup({ capabilities = capabilities, on_attach = on_attach })
    lspconfig["cssls"].setup({ capabilities = capabilities, on_attach = on_attach })
    lspconfig["tailwindcss"].setup({ capabilities = capabilities, on_attach = on_attach })
    lspconfig["volar"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "vue" },
    })
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "vue", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
    })
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}

return lspconfig_setup
