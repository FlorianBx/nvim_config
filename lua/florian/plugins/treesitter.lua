return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			ensure_installed = {
				"vue",
				"angular", 
				"astro",
				"json",
				"javascript",
				"typescript",
				"html",
				"css",
				"scss",
				"markdown",
				"yaml",
				"bash",
				"lua",
				"dockerfile",
			},
			auto_install = true,
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

		vim.filetype.add({
			extension = {
				vue = "vue",
			},
		})
	end,
}
