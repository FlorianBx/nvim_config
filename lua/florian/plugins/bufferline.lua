return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  version = "*",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        indicator = {
          icon = '▎',
          style = 'icon'
        },
        separator_style = "slant",
        modified_icon = '●',
        buffer_close_icon = '',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true
          }
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        persist_buffer_sort = true,
        enforce_regular_tabs = true,
        always_show_bufferline = true,
      },
      highlights = {
        buffer_selected = {
          fg = '#ffffff',
          bg = '#42b883',
          bold = true,
          italic = true,
          underline = true,
        },
        separator = {
          fg = '#1B1E28',
          bg = '#1B1E28',
        },
        separator_selected = {
          fg = '#42b883',
          bg = '#42b883',
        },
        background = {
          fg = '#666666',
          bg = '#1B1E28'
        },
        buffer_visible = {
          fg = '#aaaaaa',
          bg = '#1B1E28',
          italic = false,
        },
        fill = {
          fg = '#1B1E28',
          bg = '#1B1E28',
        },
        close_button = {
          fg = '#666666',
          bg = '#1B1E28',
        },
        close_button_visible = {
          fg = '#aaaaaa',
          bg = '#1B1E28',
        },
        close_button_selected = {
          fg = '#ffffff',
          bg = '#42b883',
        },
        indicator_selected = {
          fg = '#91DDCF',
          bg = '#42b883',
        },
        modified = {
          fg = '#666666',
          bg = '#1B1E28',
        },
        modified_visible = {
          fg = '#aaaaaa',
          bg = '#1B1E28',
        },
        modified_selected = {
          fg = '#91DDCF',
          bg = '#42b883',
        },
        duplicate = {
          fg = '#666666',
          bg = '#1B1E28',
          italic = true
        },
        duplicate_visible = {
          fg = '#aaaaaa',
          bg = '#1B1E28',
          italic = true
        },
        duplicate_selected = {
          fg = '#ffffff',
          bg = '#42b883',
          italic = true
        },
      }
    })

    -- Keymaps
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', opts)
    vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', opts)
  end,
}
