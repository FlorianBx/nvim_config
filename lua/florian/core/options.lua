local opt = vim.opt

opt.relativenumber = false
opt.number = true
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

opt.foldmethod = "indent"
opt.foldlevel = 99

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

opt.ttyfast = true
opt.synmaxcol = 300
opt.redrawtime = 1500
opt.regexpengine = 1

opt.scrolloff = 10
opt.sidescrolloff = 8
opt.scroll = 10

opt.cursorlineopt = "number"
opt.cursorline = true


opt.winminwidth = 10
opt.pumheight = 10
opt.cmdheight = 0

vim.o.statusline = "  %f %m%r%h%w%=  %l,%c  %P  "
vim.o.laststatus = 3
vim.o.winheight = 5

vim.o.showtabline = 1
