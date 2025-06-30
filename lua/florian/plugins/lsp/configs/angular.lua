local M = {}

function M.setup(capabilities)
  local lspconfig = require("lspconfig")

  local function is_angular_project(root_dir)
    if not root_dir then return false end
    local util = lspconfig.util
    return util.path.exists(util.path.join(root_dir, "angular.json")) or
           util.path.exists(util.path.join(root_dir, "project.json")) or
           util.path.exists(util.path.join(root_dir, "nx.json"))
  end

  lspconfig.angularls.setup({
    capabilities = capabilities,
    root_dir = function(fname)
      local util = lspconfig.util
      local root = util.root_pattern("angular.json", "project.json", "nx.json")(fname)
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
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      
      local ng = require("ng-croissant")
      local keymap = vim.keymap
      local opts = { buffer = bufnr, silent = true }

      keymap.set("n", "<leader>ac", ng.goto_component_ts, vim.tbl_extend("force", opts, { desc = "Go to component.ts" }))
      keymap.set("n", "<leader>at", ng.goto_component_html, vim.tbl_extend("force", opts, { desc = "Go to component.html" }))
      keymap.set("n", "<leader>as", ng.goto_component_spec, vim.tbl_extend("force", opts, { desc = "Go to component.spec.ts" }))
      keymap.set("n", "<leader>acc", ng.goto_component_css, vim.tbl_extend("force", opts, { desc = "Go to component.css" }))
      keymap.set("n", "<leader>ass", ng.goto_component_scss, vim.tbl_extend("force", opts, { desc = "Go to component.scss" }))
    end,
  })
end

return M