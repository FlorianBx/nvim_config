vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

vim.opt.updatetime = 250
vim.opt.timeout = true
vim.opt.timeoutlen = 500

vim.opt.clipboard = "unnamedplus"

vim.g.vue_pre_processors = { 'scss', 'sass', 'less', 'stylus' }

if vim.fn.has("nvim-0.9") == 1 then
  vim.opt.splitkeep = "screen"
  vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
end

local lazyredraw_group = vim.api.nvim_create_augroup("LazyRedraw", { clear = true })
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  group = lazyredraw_group,
  callback = function()
    vim.opt.lazyredraw = false
  end,
})

vim.opt.lazyredraw = true