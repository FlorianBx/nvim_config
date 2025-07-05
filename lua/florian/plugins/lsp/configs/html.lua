local M = {}

function M.setup()
  local capabilities = require("florian.plugins.lsp.configs.common").setup()

  vim.lsp.config.html = {
    capabilities = capabilities,
    filetypes = { "html", "vue", "angular" },
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true,
      },
    },
    settings = {
      html = {
        format = {
          indentInnerHtml = true,
          wrapLineLength = 120,
          wrapAttributes = "auto",
          templating = true,
          unformatted = nil,
        },
        hover = {
          documentation = true,
          references = true,
        },
        completion = {
          attributeDefaultValue = "doublequotes",
        },
        validate = {
          scripts = true,
          styles = true,
        },
      },
    },
  }
  
  vim.lsp.enable('html')

  vim.g.user_emmet_leader_key = '<C-e>'
  vim.g.user_emmet_settings = {
    html = {
      snippets = {
        ['!'] = "!!!+html[lang=${lang}]>(head>(meta[charset=${charset}]+title{${1:Document}})+body",
      }
    }
  }
end

return M
