return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    vim.diagnostic.config({
      virtual_text = false,
      underline = true,
      signs = true,
      update_in_insert = false,
      severity_sort = true,
    })

    require('tiny-inline-diagnostic').setup({
      preset = "powerline",
      transparent_bg = true,
      options = {
        throttle = 0,
        show_all_diags_on_cursorline = true,
        enable_on_insert = false,
      },
    })
  end
}
