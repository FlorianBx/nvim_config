return {
  "FlorianBx/flbx-colorscheme",
  lazy = false,
  priority = 1000,
  config = function()
    -- The theme's setup is handled by its own files,
    -- we just need to set it.
    vim.cmd.colorscheme("flbx")
  end,
}
