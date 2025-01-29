local M = {}

function M.setup(capabilities)
  require("lspconfig").tailwindcss.setup({
    capabilities = capabilities,
    filetypes = { "vue", "html", "typescript" },
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            "tw`([^`]*)",
            "className:\\s*\"([^\"]*)",
            "class:\\s*\"([^\"]*)"
          }
        }
      }
    },
    on_attach = function(client, bufnr)
      -- Focus sur la documentation avec K
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { buffer = bufnr })
    end
  })
end

return M
