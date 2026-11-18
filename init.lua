vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

if vim.fn.executable "node" == 0 then
  local node_bins = vim.fn.glob(vim.env.HOME .. "/.nvm/versions/node/*/bin", false, true)
  table.sort(node_bins, function(a, b)
    return vim.version.lt(a:match "v([%d.]+)", b:match "v([%d.]+)")
  end)
  local extra = { node_bins[#node_bins], "/opt/homebrew/bin" }
  vim.env.PATH = table.concat(extra, ":") .. ":" .. vim.env.PATH
end

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)
