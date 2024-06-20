return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		animation = true,
		-- insert_at_start = true,
	},
  highlights = {
      fill = {
        fg = '#ff0000',
        bg = '#1B1E28',
      },
      tab_selected = {
        fg = '#ff0000',
        bg = '#91DDCF',
      },
      buffer_visible = {
        fg = '#ff0000',
        bg = '#91DDCF',
      },
      buffer_selected = {
        fg = '#ffffff',
        bg = '#638889',
        bold = true,
        italic = true,
      },
      close_button = {
        fg = '#ff0000',
        bg = '#91DDCF',
      },
      close_button_visible = {
        fg = '#ff0000',
        bg = '#91DDCF',
      },
      close_button_selected = {
        fg = '#ffffff',
        bg = '#638889',
      },
    },
	version = "^1.0.0",
}

