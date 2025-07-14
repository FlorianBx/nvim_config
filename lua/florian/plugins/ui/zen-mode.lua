return {
  "folke/zen-mode.nvim",
  keys = {
    { "<leader>zm", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" }
  },
  opts = {
    window = {
      backdrop = 0.95,
      width = 1,
      height = 1,
      options = {
        signcolumn = "no",
        number = false,
        relativenumber = false,
        cursorline = false,
        cursorcolumn = false,
        foldcolumn = "0",
        list = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
        laststatus = 0,
      },
      twilight = { enabled = true },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
      kitty = {
        enabled = false,
        font = "+4",
      },
    },
  }
}
