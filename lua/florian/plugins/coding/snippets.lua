return {
  "dcampos/nvim-snippy",
  event = "InsertEnter",
  config = function()
    require('snippy').setup({
      mappings = {
        is = {
          ['<Tab>'] = 'expand_or_advance',
          ['<S-Tab>'] = 'previous',
        },
      },
      snippet_dirs = { vim.fn.stdpath('config') .. '/snippets' },
    })
  end,
}