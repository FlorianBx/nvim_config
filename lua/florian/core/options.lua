local opt = vim.opt

-- Basic UI settings
opt.relativenumber = true -- Show relative line numbers
opt.number = true -- Show current line number
opt.cursorline = true -- Highlight the current line
opt.signcolumn = "yes" -- Show sign column (for Git signs, Lint markers, etc.)

-- Color and theme settings
opt.termguicolors = true -- Enable true color support
opt.background = "dark" -- Set background theme to dark

-- Text editing settings
opt.tabstop = 2 -- Number of spaces in a tab
opt.shiftwidth = 2 -- Number of spaces to use for auto-indent
opt.expandtab = false -- Use tabs instead of spaces
opt.autoindent = true -- Auto-indent new lines
opt.backspace = "indent,eol,start" -- Make backspace key more powerful

-- Search settings
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true -- Override ignorecase if search pattern contains uppercase letters

-- Window management settings
opt.splitright = true -- Vertical splits open to the right
opt.splitbelow = true -- Horizontal splits open below

-- File handling settings
opt.wrap = false -- Do not wrap long lines
opt.swapfile = false -- Do not create swap files
opt.clipboard:append("unnamedplus") -- Use system clipboard

-- Code folding settings
opt.foldmethod = "indent" -- Fold based on indentation
opt.foldlevel = 99 -- Start with all folds open
