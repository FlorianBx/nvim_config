return {
  "echasnovski/mini.indentscope",
  version = false,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    symbol = "│",
    options = { 
      try_as_border = true,
      border = "both",
      indent_at_cursor = true,
    },
    draw = {
      delay = 100,
      animation = function() return 0 end,
      priority = 2,
    },
    mappings = {
      object_scope = "ii",
      object_scope_with_border = "ai",
      goto_top = "[i",
      goto_bottom = "]i",
    },
  },
  init = function()
    vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#ffffff", bold = true })
    
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "Trouble",
        "alpha",
        "dashboard",
        "fzf",
        "help",
        "lazy",
        "mason",
        "NvimTree",
        "notify",
        "snacks_dashboard",
        "snacks_notif",
        "snacks_terminal",
        "snacks_win",
        "trouble",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "SnacksDashboardOpened",
      callback = function(data)
        vim.b[data.buf].miniindentscope_disable = true
      end,
    })
  end,
}
