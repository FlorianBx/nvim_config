return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()

    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = { "vtsls", "vue_ls" },
      automatic_enable = { 
        exclude = { "vue_ls" }
      },
    })

    local lspconfig = require('lspconfig')

    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, silent = true }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end

    local vue_language_server_path = vim.fn.stdpath('data') .. 
    "/mason/packages/vue-language-server/node_modules/@vue/language-server"

    lspconfig.vtsls.setup({
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      on_attach = function(client, bufnr)
        if vim.bo.filetype == 'vue' then
          client.server_capabilities.semanticTokensProvider.full = false
        end
        on_attach(client, bufnr)
      end,
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                languages = { "vue" },
                configNamespace = "typescript",
                enableForWorkspaceTypeScriptVersions = true,
              },
            },
          },
        },
      },
    })

    lspconfig.vue_ls.setup({
      on_attach = on_attach,
      on_init = function(client)
        client.handlers['tsserver/request'] = function(_, result, context)
          local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })
          if #clients == 0 then
            vim.notify('Could not find vtsls lsp client, required by vue_ls', vim.log.levels.ERROR)
            return
          end

          local ts_client = clients[1]
          local param = unpack(result)
          local id, command, payload = unpack(param)

          ts_client:exec_cmd({
            title = 'vue_request_forward',
            command = 'typescript.tsserverRequest',
            arguments = { command, payload },
          }, { bufnr = context.bufnr }, function(_, r)
            local response_data = { { id, r.body } }
            client:notify('tsserver/response', response_data)
          end)
        end
      end,
      settings = {
        vue = {
          inlayHints = {
            missingProps = { enabled = true },
            optionsWrapper = { enabled = true },
            vBindShorthand = { enabled = true },
          },
        },
      },
    })

    vim.lsp.enable({ 'vue_ls', 'lua_ls' })

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end
}
