return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
				},
				file_ignore_patterns = {
					"node_modules",
					".git/",
					"dist/",
					"build/",
					"*.lock",
				},
				mappings = {
					i = {
						["<C-n>"] = actions.move_selection_next,
						["<C-p>"] = actions.move_selection_previous,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<Esc>"] = actions.close,
					},
					n = {
						["<Esc>"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		})

		telescope.load_extension("fzf")

		local keymap = vim.keymap

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", { desc = "Grep String" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope Oldfiles<cr>", { desc = "Find in Recent Files" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find Todos" })
	end,
}
