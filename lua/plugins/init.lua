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

      -- prefer the project binary, fall back to a global install
      local function oxlint_cmd()
        local local_bin = vim.fs.find("node_modules/.bin/oxlint", {
          upward = true,
          path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
        })[1]
        if local_bin then return local_bin end
        if vim.fn.executable("oxlint") == 1 then return "oxlint" end
        return nil
      end

      lint.linters.oxlint = {
        name = "oxlint",
        cmd = function() return oxlint_cmd() or "oxlint" end,
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
          -- skip silently when no oxlint binary is available
          local uses_oxlint = vim.tbl_contains(lint.linters_by_ft[vim.bo.filetype] or {}, "oxlint")
          if uses_oxlint and not oxlint_cmd() then return end
          lint.try_lint()
        end,
      })
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        side = "right",
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
      git = {
        enable = true,
        ignore = false,
      },
    },
  },

  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- branch "main" requires Neovim 0.12, keep "master" while on 0.11
    branch = "master",
    opts = {
      ensure_installed = {
        "vue",
        "typescript",
        "javascript",
        "html",
        "css",
        "scss",
        "lua",
        "vim",
        "vimdoc",
      },
    },
  },
}
