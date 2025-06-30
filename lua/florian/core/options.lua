local opt = vim.opt

opt.relativenumber = false
opt.number = true
opt.cursorline = false
opt.signcolumn = "yes"

opt.termguicolors = true
opt.background = "dark"

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.backspace = "indent,eol,start"

opt.ignorecase = true
opt.smartcase = true

opt.splitright = true
opt.splitbelow = true

opt.wrap = false
opt.swapfile = false
opt.clipboard:append("unnamedplus")

opt.foldmethod = "indent"
opt.foldlevel = 99

vim.opt.updatetime = 200
vim.opt.timeoutlen = 300

opt.lazyredraw = true
opt.ttyfast = true
opt.synmaxcol = 300
opt.redrawtime = 1500
opt.regexpengine = 1

opt.scrolloff = 8
opt.sidescrolloff = 8
opt.scroll = 10

opt.cursorlineopt = "number"
opt.cursorline = true
