return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local autopairs = require("nvim-autopairs")

    autopairs.setup({
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        java = false,
      },
      disable_filetype = { "TelescopePrompt" },
      fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
      },
    })
    
    -- Si vous voulez intégrer autopairs avec coc.nvim
    local handlers = require('nvim-autopairs.completion.handlers')
    
    vim.g.completion_confirm_key = ""
    
    -- Cette fonction sera appelée quand COC confirme une completion
    _G.MUtils= {}
    MUtils.completion_confirm=function()
      if vim.fn.pumvisible() ~= 0  then
        return vim.fn['coc#_select_confirm']()
      else
        return autopairs.autopairs_cr()
      end
    end
    
    -- Map la touche Enter pour utiliser la fonction ci-dessus
    vim.api.nvim_set_keymap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', 
      { expr = true, noremap = true })
  end,
}
