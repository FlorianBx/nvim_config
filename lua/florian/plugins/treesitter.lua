return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	lazy_load = true,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		-- Configure Treesitter
		treesitter.setup({
			highlight = {
				enable = true, -- Enable syntax highlighting
			},
			indent = {
				enable = true, -- Enable indentation
			},
			autotag = {
				enable = true, -- Enable autotagging with nvim-ts-autotag plugin
			},
			ensure_installed = {
				"vue",
				"angular",
				"astro",
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"bash",
				"fish",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"c",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "//",
					node_incremental = "//",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})
	end,
}
