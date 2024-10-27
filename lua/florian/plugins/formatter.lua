local conform_config = {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				prettier = {
					prepend_args = {
						"--single-quote",
						"--jsx-single-quote=false",
						"--tab-width", "2",
						"--use-tabs", "false",
						"--trailing-comma", "es5",
					},
				},
			},
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				vue = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "htmlbeautifier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
			},
			-- format_on_save = {
			--   lsp_fallback = true,
			--   async = false,
			--   timeout_ms = 1000,
			-- },
		})

		vim.keymap.set({ "n", "v" }, "<leader>ll", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}

return conform_config
