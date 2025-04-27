return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local colors = {
      bg = "#181a26",
      fg = "#848bb8",
      fg_dark = "#62688f",
      selected = "#91b4d5",
      modified = "#fab387",
    }

    require("bufferline").setup({
      options = {
        mode = "buffers",
        always_show_bufferline = true,
        separator_style = "thin",
        show_close_icon = false,
        show_buffer_close_icons = false,
        show_buffer_icons = false,
        show_tab_indicators = false,
        max_name_length = 18,
        tab_size = 18,
        indicator = {
          style = "underline",
          icon = "",
        },
        diagnostics = false,
        offsets = {},
        hover = { enabled = false },
      },
      highlights = {
        fill = { bg = colors.bg },
        background = { fg = colors.fg_dark, bg = colors.bg },
        buffer_selected = { fg = colors.selected, bg = colors.bg, bold = true },
        buffer_visible = { fg = colors.fg, bg = colors.bg },
        tab = { fg = colors.fg_dark, bg = colors.bg },
        tab_selected = { fg = colors.selected, bg = colors.bg, bold = true },
        separator = { fg = colors.bg, bg = colors.bg },
        separator_selected = { fg = colors.bg, bg = colors.bg },
        modified = { fg = colors.modified, bg = colors.bg },
        modified_selected = { fg = colors.modified, bg = colors.bg },
        indicator_selected = { fg = colors.selected, bg = colors.bg },
      },
    })
  end
}
