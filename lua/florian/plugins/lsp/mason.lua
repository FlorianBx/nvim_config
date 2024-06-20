return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					server_installed = "✓",
					server_pending = "➜",
					server_uninstalled = "✗",
				},
			},
		})
		mason_lspconfig.setup({
			ensure_installed = {
				"vtsls",
				"volar",
				"angularls",
				"svelte",
				"emmet_ls",
				"prismals",
				"tailwindcss",
				"rust_analyzer",
				"html",
				"cssls",
				"jsonls",
				"lua_ls",
			},
			automatic_installation = true,
		})
	end,
}
