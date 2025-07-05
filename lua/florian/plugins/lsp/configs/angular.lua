local M = {}

function M.setup(capabilities)

  local function is_angular_project(root_dir)
    if not root_dir then return false end
    return vim.uv.fs_stat(root_dir .. "/angular.json") or
           vim.uv.fs_stat(root_dir .. "/project.json") or
           vim.uv.fs_stat(root_dir .. "/nx.json")
  end

  vim.lsp.config.angularls = {
    capabilities = capabilities,
    root_dir = function(fname)
      local root = vim.fs.root(fname, { "angular.json", "project.json", "nx.json" })
      if root and is_angular_project(root) then
        return root
      end
      return nil
    end,
    filetypes = { "html", "typescript" },
    single_file_support = false,
    settings = {
      angular = {
        enable = true,
        diagnostics = {
          enable = true,
          templateErrors = true,
        },
      }
    },
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = nil
      client.server_capabilities.documentRangeFormattingProvider = nil
      
      local ng = require("ng-croissant")
      local keymap = vim.keymap
      local opts = { buffer = bufnr, silent = true }

      keymap.set("n", "<leader>ac", ng.goto_component_ts, vim.tbl_extend("force", opts, { desc = "Go to component.ts" }))
      keymap.set("n", "<leader>at", ng.goto_component_html, vim.tbl_extend("force", opts, { desc = "Go to component.html" }))
      keymap.set("n", "<leader>as", ng.goto_component_spec, vim.tbl_extend("force", opts, { desc = "Go to component.spec.ts" }))
      keymap.set("n", "<leader>acc", ng.goto_component_css, vim.tbl_extend("force", opts, { desc = "Go to component.css" }))
      keymap.set("n", "<leader>ass", ng.goto_component_scss, vim.tbl_extend("force", opts, { desc = "Go to component.scss" }))
    end,
  }
  
  vim.lsp.enable('angularls')
end

return M