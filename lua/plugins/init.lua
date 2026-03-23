return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    config = function()
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
      require("tiny-inline-diagnostic").setup({
        options = {
          show_source = true,
          throttle = 20,
          softwrap = 15,
          multiple_diag_under_cursor = true,
          multilines = {
            enabled = true,
            always_show = true,
          },
        },
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require("configs.conform"),
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        javascript = { "oxlint" },
        typescript = { "oxlint" },
        vue = { "oxlint" },
      }

      lint.linters.oxlint = {
        name = "oxlint",
        cmd = "oxlint",
        stdin = false,
        args = { "--format", "unix" },
        stream = "stdout",
        ignore_exitcode = true,
        parser = require("lint.parser").from_pattern(
          "[^:]+:(%d+):(%d+): (.+) %[(%a+)/",
          { "lnum", "col", "message", "severity" },
          {
            ["Warning"] = vim.diagnostic.severity.WARN,
            ["Error"] = vim.diagnostic.severity.ERROR,
          },
          { source = "oxlint" }
        ),
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vue",
        "typescript",
        "javascript",
        "html",
        "css",
        "lua",
        "vim",
        "vimdoc",
      },
    },
  },
}
