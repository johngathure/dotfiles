" - For Neovim: ~/.local/share/nvim/plugged
call plug#begin('~/code/.nvim/plugged')

" Python mode
Plug 'python-mode/python-mode', { 'branch': 'develop' }

" Directory tree structure
Plug 'scrooloose/nerdtree'

" Comment code
Plug 'scrooloose/nerdcommenter'

" Status line on steroids
Plug 'itchyny/lightline.vim'

" Fold chunks of code that is not being used.
Plug 'tmhedberg/SimpylFold'

" color schemes.
Plug 'jnurmine/Zenburn'
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'
Plug 'idanarye/vim-merginal'

" rust
Plug 'rust-lang/rust.vim'

" go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'

" js 
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maksimr/vim-jsbeautify'
Plug 'millermedeiros/vim-esformatter'

" search
Plug 'rking/ag.vim'

" maximize splits
Plug 'szw/vim-maximizer'

" yml
Plug 'stephpy/vim-yaml'

" tagbar.
Plug 'majutsushi/tagbar'

Plug 'Valloric/MatchTagAlways'

" auto complete
Plug 'Valloric/YouCompleteMe'

" Python auto formater
Plug 'ambv/black'

" Docker
Plug 'ekalinin/Dockerfile.vim'

" scss
Plug 'cakebaker/scss-syntax.vim'

" syntax checking
Plug 'w0rp/ale'

" splash screen
Plug 'mhinz/vim-startify'

" vim tmux seem-less navigation
Plug 'christoomey/vim-tmux-navigator'

" Initialize plugin system
call plug#end()

set encoding=utf-8
syntax on

let mapleader = "\<Space>"

filetype plugin indent on    " required
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Automatically update a file if it is changed externally
set autoread

" Height of the command bar
set cmdheight=2

set showcmd	" show last command in the bottom right

set ruler	" always show current position

" show matching braces
set showmatch
"
set wildmenu	    " visual autocomplete for command menu

"""""""""""""""""""""""""""""""""""""""""""""""""
" Backups, Swap Files
"""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

" Define standard filetype
set ffs=unix,dos,mac

set cursorline	" highlight current active line

" recognize .md files as markdown files
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" enable spell-checking for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

" Enable folding
set foldmethod=indent
set foldlevel=99

" Turn hybrid numbers on
set nu                  " display line numbers
set nu rnu


set clipboard+=unnamed  " use the clipboards of vim and win
set go+=a               " Visual selection automatically copied to the clipboard


" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" make backspaces more powerfull
set backspace=indent,eol,start

" disable arrow keys in normal mode.
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

" SPLIT SCREEN NAVIGATION
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" PLUGINS CONFIG

" Pyhton mode setup
let g:python3_host_prog = '/usr/local/bin/python3.6'
let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_lint_cwindow = 0
let g:pymode_options_max_line_length = 100
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_options_colorcolumn = 1
let python_highlight_all=1

" simple fold
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" you complete me
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>



" Dracula
syntax on
color dracula


" NERD TREE TAB
" Shortcut for opening nerd tree
map <C-n> :NERDTreeToggle<CR>
"
" " Close nerd tree automatically when a file is opened
let NERDTreeQuitOnOpen = 1
"
" " Automatically delete the buffer of the just deleted file
let NERDTreeAutoDeleteBuffer = 1
"
" " remove the stupid old `Press ? for help
" " and the niusance arrows
let NERDTreeMinimalUI = 1

" " ignore python compiled files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree



autocmd FileType javascript noremap <buffer>  <c-f> :call JsxBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" run go fmt on saving go files
" au BufWritePost *.go !gofmt -w %

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1


" PYTHON VIRTUALENV SUPPORT
py3 << EOF
import os, sys, pathlib
if 'VIRTUAL_ENV' in os.environ:
    venv = os.getenv('VIRTUAL_ENV')
    site_packages = next(pathlib.Path(venv, 'lib').glob('python*/site-packages'), None)
    if site_packages:
        sys.path.insert(0, str(site_packages))
EOF

	" AG
let g:ag_working_path_mode="r"

nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>

function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
endfunction

" C TAGS
set tags=tags

" NERD COMMENT
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Difference btwn buffer and unmodified version on disk
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()


" Tagbar
nmap <F8> :TagbarToggle<CR>

" fzf
set rtp+=/usr/local/opt/fzf
" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
nnoremap <c-p> :FZF<CR>


" emmet vim
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
    \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
\}

" lightline
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }

" ale
let g:ale_virtualtext_cursor = 1 " virtual text

" vim tmux
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
