-- Configuration pour 'neovim/nvim-lspconfig'
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

    -- Function called when a LSP server is attached to a buffer
    local on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Keymaps for various LSP features
      vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
      vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    -- Configuration for capabilities for integration with nvim-cmp
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.diagnostic.config({
      virtual_text = false, -- Desactivate virtual text for diagnostics
      signs = true, -- Activate signs in the margin
      update_in_insert = true, -- Update diagnostics insert mode
      underline = true, -- Underline the text where a diagnostic is present
      severity_sort = true, -- Sort diagnostics by severity
    })

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Define colors for diagnostic underlines
    vim.cmd("highlight DiagnosticUnderlineError gui=underline guisp=#FF9592")
    vim.cmd("highlight DiagnosticUnderlineWarn gui=underline guisp=#FFA057")
    vim.cmd("highlight DiagnosticUnderlineInfo gui=underline guisp=#75C7F0")
    vim.cmd("highlight DiagnosticUnderlineHint gui=underline guisp=#71D083")

    local servers = { "html", "tsserver", "cssls", "tailwindcss", "volar", "emmet_ls", "lua_ls" }
    for _, lsp in ipairs(servers) do
      local config = { capabilities = capabilities, on_attach = on_attach }
      if lsp == "volar" then
        config.filetypes = { "vue" }
      elseif lsp == "emmet_ls" then
        config.filetypes = { "html", "vue", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" }
      elseif lsp == "lua_ls" then
        config.settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        }
      end
      lspconfig[lsp].setup(config)
    end
  end,
}

return lspconfig_setup
