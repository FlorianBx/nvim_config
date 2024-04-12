local conform_config = {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        vue = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        css = { "eslint_d" },
        html = { "eslint_d" },
        json = { "eslint_d" },
        jsonc = { "eslint_d" },
        yaml = { "eslint_d" },
        markdown = { "eslint_d" },
        graphql = { "eslint_d" },
        lua = { "stylua" },
      },
      format_on_save = false,
      -- format_on_save = {
      --   lsp_fallback = true,
      --   async = false,
      --   timeout_ms = 1000,
      -- },
    })

    vim.keymap.set({ "n", "v" }, "<leader>ff", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}

return conform_config
