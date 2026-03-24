local vue_plugin_path = vim.fn.stdpath("data")
  .. "/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin"

vim.lsp.config("vue_ls", {
  filetypes = { "vue" },
  init_options = {
    vue = { hybridMode = true },
  },
})

vim.lsp.config("vtsls", {
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_plugin_path,
            languages = { "vue" },
            configNamespace = "typescript",
            enableForWorkspaceTypeScriptVersions = true,
          },
        },
      },
    },
  },
})

vim.lsp.enable({ "html", "cssls", "vtsls", "vue_ls" })
