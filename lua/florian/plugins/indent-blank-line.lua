local indentBlankline = {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = function()
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.SCOPE_ACTIVE, function(bufnr)
      return vim.api.nvim_buf_line_count(bufnr) < 2000
    end)

    local highlight = {
      "RainbowCyan",
      "RainbowGreen",
      "RainbowYellow",
      "RainbowOrange",
      "RainbowBlue",
      "RainbowViolet",
      "RainbowRed",
    }

    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    end)

    return {
      debounce = 200,
      indent = {
        -- char = "|",
        -- tab_char = "",
      },
      scope = {
        injected_languages = true,
        highlight = highlight,
        show_start = true,
        show_end = false,
        char = "",
        -- include = {
        --   node_type = { ["*"] = { "*" } },
        -- },
        -- exclude = {
        --   node_type = { ["*"] = { "source_file", "program" }, python = { "module" }, lua = { "chunk" } },
        -- },
      },
      exclude = {
        filetypes = {
          "help",
          "startify",
          "dashboard",
          "packer",
          "neogitstatus",
          "NvimTree",
          "Trouble",
          "alpha",
          "neo-tree",
        },
        buftypes = {
          "terminal",
          "nofile",
        },
      },
    }
  end,
  main = "ibl",
}

return indentBlankline
