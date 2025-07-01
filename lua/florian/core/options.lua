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

vim.o.showtabline = 2

function _G.minimal_bufferline()
  local bufs = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs())
  
  local current = vim.api.nvim_get_current_buf()
  local line = string.rep(" ", 2)
  
  for i, buf in ipairs(bufs) do
    local name = vim.api.nvim_buf_get_name(buf)
    local filename = name == "" and "[No Name]" or vim.fn.fnamemodify(name, ":t")
    
    if buf == current then
      line = line .. "%#TabLineSel#   " .. filename .. "   %#TabLine#"
    else
      line = line .. "%#TabLine#   " .. filename .. "   "
    end
    
    if i < #bufs then
      line = line .. "%#TabLine#│"
    end
  end
  
  return line .. "%#TabLineFill#"
end

vim.o.tabline = "%!v:lua.minimal_bufferline()"

vim.o.winbar = "%= %=%="
