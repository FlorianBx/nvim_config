local conform_config = {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local function has_prettier_config()
			local possible_configs = {
				".prettierrc",
				".prettierrc.json",
				".prettierrc.yaml",
				".prettierrc.yml",
				".prettierrc.js",
				"prettier.config.js",
			}

			for _, config_file in ipairs(possible_configs) do
				local config_path = vim.fn.getcwd() .. "/" .. config_file
				if vim.fn.filereadable(config_path) == 1 then
					return true
				end
			end
			return false
		end

		local default_prettier_args = {
			"--single-quote",
			"--jsx-single-quote=false",
			"--tab-width", "6",
			"--use-tabs", "false",
			"--trailing-comma", "es5",
			"--bracket-spacing", "true",
			"--prose-wrap", "always",
			"--print-width", "120",
			"--single-attribute-per-line", "true",
			"--html-whitespace-sensitivity", "strict",
		}

		conform.setup({
			formatters = {
				prettier = {
					args = function()
						if has_prettier_config() then
							return {
								"--config-precedence",
								"prefer-file",
								"--stdin-filepath",
								"$FILENAME",
							}
						else
							return default_prettier_args
						end
					end,
					env = {
						PRETTIER_DEBUG = "1",
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
				html = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
			},
		})

		vim.api.nvim_create_user_command("PrettierConfigInfo", function()
			if has_prettier_config() then
				print("Using .prettierrc configuration")
			else
				print("Using default configuration")
			end
		end, {})

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
