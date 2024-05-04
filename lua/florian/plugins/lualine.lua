local function clock()
  return os.date("%H:%M")
end

local lualine = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", { "diagnostics", sources = { "nvim_diagnostic" } } },
        lualine_c = { { "filename", file_status = true } },
        lualine_x = { "encoding", "filetype" },
        lualine_y = { clock },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = { "test" },
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive", "nvim-tree" },
    })
  end,
}

return lualine
