vim.opt.relativenumber = true
vim.opt.number = true

-- tabs and indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tabs to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one.

vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case sensitive.

vim.opt.cursorline = true

-- turn on termguicolors
-- (have to use iterm2 or any other terminal with true color)
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
vim.opt.clipboard:append "unnamedplus" -- use system clipboard as default register

--split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.autoread = true

-- command bar
-- vim.opt.cmdheight = 2
vim.opt.showcmd = true
vim.opt.wildmenu = true -- visual autocomplete on command menu

vim.opt.ruler = true -- show current position
vim.opt.showmatch = true -- show matching braces
vim.opt.hidden = true -- hide files with unsaved changes instead of closing them.
vim.opt.ffs = "unix" -- define standard filetype.
vim.opt.laststatus = 2 -- always show status line.
vim.opt.scrolloff = 30 -- number of lines to always be displayed above and below cursor everytime.
