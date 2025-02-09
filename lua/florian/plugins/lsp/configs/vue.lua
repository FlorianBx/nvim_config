local M = {}

function M.setup(capabilities)
  local lspconfig = require("lspconfig")
  local util = require("lspconfig/util")

  lspconfig.volar.setup({
    capabilities = capabilities,
    filetypes = { "vue" },
    on_attach = function(client, bufnr)
      -- Keymaps spécifiques à Vue
      vim.keymap.set("n", "gD", vim.lsp.buf.definition, { buffer = bufnr })
      vim.keymap.set("n", "gT", "<cmd>TSToolsGoToSourceDefinition<cr>", { buffer = bufnr })
    end,
    init_options = {
      vue = {
        hybridMode = false,
        typescript = {
          tsdk = util.path.join(vim.env.HOME, ".local/share/fnm/node-versions/v22.13.1/installation/lib/node_modules/typescript/lib")
        }
      }
    }
  })
end

return M
