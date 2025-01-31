return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local colors = {
      bg = "#1a1e29",
      fg = "#6e738d",
      active = "#42b883",  -- Couleur Vue.js
      yellow = "#e5c07b",
      red = "#cf5d5d",
      cyan = "#56b6c2"
    }

    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = { "", "" },      -- Séparateurs invisibles
        indicator = {
          style = "underline",
          icon = "▎"
        },
        show_buffer_icons = false,        -- Désactive les icônes de type fichier
        show_close_icon = false,           -- Cache l'icône de fermeture
        show_duplicate_prefix = false,     -- Ne montre pas les noms de fichiers dupliqués
        max_name_length = 24,
        tab_size = 24,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " "..count or level:match("warning") and " "..count or ""
          return icon
        end,
        groups = {
          items = {
            require("bufferline.groups").builtin.pinned:with({ 
              auto_close = false 
            })
          }
        },
        hover = {
          enabled = true,
          delay = 150,
          reveal = { "close" }
        }
      },
      highlights = {
        fill = { bg = colors.bg },
        background = { fg = colors.fg, bg = colors.bg },
        buffer_selected = {
          fg = "#ffffff",
          bg = colors.active,
          bold = true,
          italic = false
        },
        separator = { bg = colors.bg, fg = colors.bg },
        indicator_selected = { fg = colors.active, bg = colors.bg },
        modified_selected = { fg = colors.yellow, bg = colors.active },
        tab = { fg = colors.fg, bg = colors.bg },
        tab_selected = { fg = colors.active, bg = colors.bg, bold = true }
      }
    })

    -- Navigation améliorée
    vim.keymap.set("n", "<S-Right>", "<cmd>BufferLineCycleNext<CR>")
    vim.keymap.set("n", "<S-Left>", "<cmd>BufferLineCyclePrev<CR>")
    vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", { desc = "Toggle pin" })
  end
}
