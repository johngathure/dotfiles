-- Only options that differ from Neovim's defaults. Things like 'hidden',
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs and indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tabs to spaces

vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case sensitive.

vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- true colour: Neovim autodetects this, but tmux makes detection unreliable so
-- keep it explicit. Setting 'background' also stops Neovim from second-guessing
-- the theme from the terminal's OSC 11 reply.
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- clipboard
vim.opt.clipboard:append "unnamedplus" -- use system clipboard as default register

--split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.showmatch = true -- show matching braces
vim.opt.ffs = "unix" -- define standard fileformat.
vim.opt.scrolloff = 30 -- number of lines to always be displayed above and below cursor everytime.

-- Providers. Pointing at the host programs explicitly means Neovim never has to
-- search $PATH for them on startup.
vim.g.python3_host_prog = vim.fn.expand "~/.venvs/neovim/bin/python3"
-- NOTE: version-scoped path, update after a ruby major upgrade (`gem which neovim`)
vim.g.ruby_host_prog = "/opt/homebrew/lib/ruby/gems/4.0.0/bin/neovim-ruby-host"
vim.g.node_host_prog = "/opt/homebrew/lib/node_modules/neovim/bin/cli.js"

-- perl is the one host that is not installed (needs `cpan Neovim::Ext`)
vim.g.loaded_perl_provider = 0
