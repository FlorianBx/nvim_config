local nvim_lint_config = {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Check if an ESLint config file exists in the current project
    local function eslint_config_exists()
      local eslint_config_files = { ".eslintrc", ".eslintrc.js", ".eslintrc.json" }
      for _, filename in ipairs(eslint_config_files) do
        if vim.fn.filereadable(vim.fn.getcwd() .. "/" .. filename) == 1 then
          return true
        end
      end
      return false
    end

    if not eslint_config_exists() then
      print("eslint_d is not installed")
      return
    end

    -- Define linters for specific file types
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      vue = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }

    -- Create an autocommand group for linting
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- Automatically lint on certain events
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        if eslint_config_exists() then
          lint.try_lint()
        else
          print("eslint_d is not installed")
        end
      end,
    })

    -- Keybinding to trigger linting manually
    vim.keymap.set("n", "<leader>l", function()
      if eslint_d_installed() then
        lint.try_lint()
      else
        print("eslint_d is not installed")
      end
    end, { desc = "Trigger linting for current file" })
  end,
}

return nvim_lint_config
