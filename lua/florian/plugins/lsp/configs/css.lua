local M = {}

function M.setup()
  local capabilities = require("florian.plugins.lsp.configs.common").setup()

  vim.lsp.config.cssls = {
    capabilities = capabilities,
    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = "ignore"
        },
        hover = {
          documentation = true,
          references = true
        },
        completion = {
          triggerPropertyValueCompletion = true,
          completePropertyWithSemicolon = true
        },
      },
      scss = {
        validate = true,
        lint = {
          unknownAtRules = "ignore"
        }
      },
      less = {
        validate = true,
        lint = {
          unknownAtRules = "ignore"
        }
      }
    },
    filetypes = { "css", "scss", "less", "vue", "angular" },
  }
  
  vim.lsp.enable('cssls')

  vim.g.user_emmet_settings = vim.g.user_emmet_settings or {}
  vim.g.user_emmet_settings.css = {
    snippets = {
      ['@m'] = '@media screen and (min-width: ${1:320px}) {\n\t${2}\n}',
      ['@i'] = '@import url(${1});',
      ['@f'] = '@font-face {\n\tfont-family: ${1};\n\tsrc: url(${2});\n}',
    }
  }
end

return M
