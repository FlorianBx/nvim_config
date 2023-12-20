-- Disable default <tab> and <s-tab> behavior

local luaSnip = {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")
    local function load_my_snippets()
      local snippets_paths = vim.fn.stdpath("config") .. "/lua/my_snippets/"
      for _, file in ipairs(vim.fn.glob(snippets_paths .. "*.lua", 0, 1)) do
        loadfile(file)()
      end
    end

    load_my_snippets()
  end,

  keys = function()
    return {}
  end,
}

return luaSnip
