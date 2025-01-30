return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  version = "*", 
  config = function()
    local colors = {
      bg = "#1A1E29",
      fg = "#6E738D", -- <-- Ajouté
      active = "#42B883",
      yellow = "#FAB795",
      red = "#E95678"
    }

    require("bufferline").setup({
      options = {
        mode = "buffers",
        indicator = {
          icon = "▌",
          style = "underline"
        },
        separator_style = "slant",
        modified_icon = "  ",
        buffer_close_icon = "",
        close_icon = "",
        max_name_length = 24,
        tab_size = 24,
        diagnostics = "nvim_lsp",
        -- UNE SEULE DÉFINITION DES DIAGNOSTICS --
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " "..count
                     or level:match("warning") and " "..count
          return icon
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "  Explorer",
            highlight = "Directory",
            separator = true
          }
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = {"close"}
        },
        groups = {
          items = {
            require("bufferline.groups").builtin.pinned:with({ 
              icon = "󰐃",
              auto_close = false 
            })
          }
        },
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = false,
      },
      highlights = {
        fill = { bg = colors.bg },
        background = { bg = colors.bg, fg = colors.fg },
        buffer_selected = {
          bg = colors.active, 
          fg = "#FFFFFF",
          bold = true,
          italic = false
        },
        separator = { bg = colors.bg, fg = colors.bg },
        indicator_selected = { bg = colors.bg, fg = colors.active },
        modified_selected = { fg = colors.yellow, bg = colors.active },
      }
    })

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', opts)
    vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', opts)
  end,
}
