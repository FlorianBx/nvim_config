return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "dcampos/nvim-snippy",
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "dcampos/cmp-snippy",
    "hrsh7th/cmp-emoji",
  },
  config = function()
    local cmp = require("cmp")
    
    cmp.setup({
      snippet = {
        expand = function(args)
          require('snippy').expand_snippet(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "snippy", priority = 750 },
        { name = "path", priority = 500 },
      }, {
        { name = "buffer", priority = 250 },
        { name = "emoji", priority = 100 },
      }),
      formatting = {
        format = require("lspkind").cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
        })
      }
    })
  end
}
