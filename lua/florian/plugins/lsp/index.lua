return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      server = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }
              },
            }
          }
        },
        vtsls = {
          filetypes = { "javascript", "typescript", "vue" },
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                  entriesLimit = 50
                }
              },
              tsserver = {
                globalPlugins = {
                  {
                    name = "@vue/typescript-plugin",
                    location = vim.fn.stdpath('data') .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
                    languages = { "vue" },
                    configNamespace = "typescript",
                    enableForWorkspaceTypeScriptVersions = true,
                  },
                },
                maxTsServerMemory = 3072,
                watchOptions = {
                  excludeDirectories = { "**/node_modules", "**/.git" }
                }
              }
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
                includeCompletionsForModuleExports = false,
                includeAutomaticOptionalChainCompletions = false
              },
              preferences = {
                includePackageJsonAutoImports = "off"
              },
              surveys = {
                enabled = false
              }
            },
            javascript = {
              suggest = {
                names = false
              }
            }
          }
        },
        emmet_ls = {
          filetypes = { "html", "typescript", "javascript", "vue" },
          init_options = {
            html = {
              options = {
                ["vue.enabled"] = true
              }
            }
          }
        },
        cssls = {},
        oxlint = {},
        jsonls = {},
        tailwindcss = {}
      }
    },
    config = function(_, opts)
      require("mason").setup()

      require("mason-lspconfig").setup({
          ensure_installed = { "lua_ls", "vtsls", "vue-language-server", "html", "cssls", "jsonls", "tailwindcss", "emmet_ls" },
      })

      vim.diagnostic.config({
        virtual_text = {
          spacing = 2,
          severity = { min = vim.diagnostic.severity.WARN }
        },
        virtual_lines = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          source = "if_many",
          border = "rounded"
        }
      })

      for server, config in pairs(opts.server) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end

    end
  }
}
