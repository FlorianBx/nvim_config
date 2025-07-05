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
				disable = function(lang, buf)
					local max_filesize = 100 * 1024
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = false,
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
