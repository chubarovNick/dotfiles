local opt = vim.opt


-- mouse
opt.mouse = "a"

--line numbers
opt.relativenumber = true
opt.number = true

-- tabs & intentions
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true


-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true


-- cursor
opt.cursorline = true


-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"


-- clipboard
opt.clipboard:append("unnamedplus")


-- split
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
