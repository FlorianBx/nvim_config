return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		vim.o.updatetime = 100

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- Keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gr", vim.lsp.buf.references, opts)

				opts.desc = "Show LSP declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definition"
				keymap.set("n", "gd", vim.lsp.buf.definition, opts)

				opts.desc = "Show LSP implementation"
				keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

				opts.desc = "Show LSP type definition"
				keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

				opts.desc = "Show LSP Diagnostic"
				keymap.set("n", "ge", ":lua ToggleQuickfix()<CR>", opts)
			end,
		})

		function ToggleQuickfix()
			local qf_exists = false
			for _, win in ipairs(vim.fn.getwininfo()) do
				if win["quickfix"] == 1 then
					qf_exists = true
					break
				end
			end
			if qf_exists then
				vim.cmd("cclose")
			else
				vim.diagnostic.setqflist()
				vim.cmd("copen")
			end
		end

		-- Function for displaying LSP diagnostics in a floating window
		function _G.show_diagnostics()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
			}
			vim.diagnostic.open_float(nil, opts)
		end

		-- Associate diagnostics to CursorHold
		vim.cmd([[
      augroup ShowDiagnostics
        autocmd!
        autocmd CursorHold * lua _G.show_diagnostics()
      augroup END
    ]])

		-- Desactivate virtual text
		vim.diagnostic.config({
			virtual_text = false,
		})

		-- LSP handlers
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
		})

		-- Add additional capabilities supported by nvim-cmp
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup({
			ensure_installed = { "tsserver", "emmet_ls", "volar" },
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["volar"] = function()
				local volar = require("lspconfig").volar
				volar.setup({
					capabilities = capabilities,
					filetypes = { "vue" },
				})
			end,
			["tsserver"] = function()
				local tsserver = require("lspconfig").tsserver
				tsserver.setup({
					capabilities = capabilities,
				})
			end,
			["emmet_ls"] = function()
				local emmet_ls = require("lspconfig").emmet_ls
				emmet_ls.setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"css",
						"scss",
						"javascript",
						"typescriptreact",
						"javascriptreact",
						"vue",
						"angular",
						"svelte",
					},
					init_options = {},
				})
			end,
			["eslint"] = function()
				local eslint = require("lspconfig").eslint
				eslint.setup({
					capabilities = capabilities,
					on_attach = function(client)
						client.resolved_capabilities.document_formatting = true
						vim.cmd([[autocmd BufWritePre <buffer> EslintFixAll]])
					end,
					settings = {
						eslint = {
							enable = true,
							packageManager = "npm",
							format = { enable = true },
							configFile = ".eslintrc.json",
						},
					},
				})
			end,
			-- ["unocss"] = function()
			-- 	if vim.fn.glob(vim.loop.cwd() .. "/node_modules/unocss") ~= "" then
			-- 		lspconfig.unocss.setup({
			-- 			capabilities = capabilities,
			-- 			filetypes = { "html", "javascriptreact", "rescript", "typescriptreact", "vue", "svelte" },
			-- 		})
			-- 	end
			-- end,
		})
	end,
}
