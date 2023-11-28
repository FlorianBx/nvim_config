return {
  "akinsho/bufferline.nvim",
  key = {
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous tab" },
  },
  opts = {
    options = {
      mode = "tabs",
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  },

  -- Statusline
  {
    event = "veryLazy",
    opts = {
      options = {
        theme = "onedark",
        section_separators = { "", "" },
        component_separators = { "", "" },
        icons_enabled = true,
      },
    },
  },

  -- Logo
  {
    "nvimdev/dashboard-nvim",
    exent = "VimEnter",
    opts = function(_, opts)
      local logo = [[
      
██████  ███████╗██████╗ ██████╗ ██   ╗██╗███████╗██       ██████  ██████╗ 
██╔════╝██╔══██╗██╔══██╗██╔════╝██║   ██║██╔════╝██║     ██╔═══██╗██╔══██╗
█████╗  ██████╔╝██║  ██║█████╗  ██║   ██║█████╗  ██║     ██║   ██║██████╔╝
██╔══╝  ██╔══██╗██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██╔═══╝ 
██║     ██████╔╝██████╔╝███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝██║     
╚═╝     ╚═════╝ ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝     

]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
