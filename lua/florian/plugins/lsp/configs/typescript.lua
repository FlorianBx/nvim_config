local M = {}

function M.setup(capabilities)
  require("typescript-tools").setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      -- Keymaps unifiées avec Telescope
      vim.keymap.set("n", "gd", "<cmd>TSToolsGoToSourceDefinition<cr>", { buffer = bufnr })
      vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr })
    end,
    settings = {
      tsserver_path = os.getenv("HOME") .. ".local/share/fnm/node-versions/v22.13.1/installation/lib/node_modules/typescript/lib"
    }
  })
end

return M
