-- Dans typescript.lua
local M = {}

function M.setup(capabilities)
  require("typescript-tools").setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      vim.keymap.set("n", "gd", "<cmd>TSToolsGoToSourceDefinition<cr>", { buffer = bufnr })
      vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr })
      vim.keymap.set("n", "K", "<cmd>TSToolsHover<cr>", { buffer = bufnr })
      vim.keymap.set("n", "<leader>ca", "<cmd>TSToolsFixAll<cr>", { buffer = bufnr })
      vim.keymap.set("n", "<leader>rn", "<cmd>TSToolsRename<cr>", { buffer = bufnr })
    end,
    settings = {
      tsserver_path = os.getenv("HOME") .. ".local/share/fnm/node-versions/v22.13.1/installation/lib/node_modules/typescript/lib",
      complete_function_calls = true,
      include_completions_with_insert_text = true,
      tsserver_plugins = {},
      tsserver_max_memory = "auto",
      tsserver_format_options = {
        allowIncompleteCompletions = true,
        allowRenameOfImportPath = true,
      },
    }
  })
end

return M
