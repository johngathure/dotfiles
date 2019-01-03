" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/development/.nvim/plugged')

" Make sure you use single quotes

" Python mode
Plug 'python-mode/python-mode', { 'branch': 'develop' }

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
" Plugin 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'jnurmine/Zenburn'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'altercation/vim-colors-solarized'

Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'shumphrey/fugitive-gitlab.vim'

Plug 'rust-lang/rust.vim'

Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maksimr/vim-jsbeautify'
Plug 'millermedeiros/vim-esformatter'
Plug 'mattn/emmet-vim'
" Plug 'junegunn/fzf'
Plug 'rking/ag.vim'
Plug 'dracula/vim'
Plug 'szw/vim-maximizer'
Plug 'avakhov/vim-yaml'
Plug 'idanarye/vim-merginal'
Plug 'neomake/neomake'
Plug 'majutsushi/tagbar'

Plug 'Valloric/MatchTagAlways'
Plug 'Valloric/YouCompleteMe'

" Initialize plugin system
call plug#end()

let g:python3_host_prog = '/usr/local/bin/python3'

" Pyhton mode setup
let g:pymode_python = 'python3'

filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99

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

" " Enables syntax highlighting for JSDocs.
" let g:javascript_plugin_jsdoc = 1
"
" " Enables some additional syntax highlighting for NGDocs.
" let g:javascript_plugin_ngdoc = 1
"
" " Enables syntax highlighting for Flow.
" let g:javascript_plugin_flow = 1
"
" " Allow JSX in normal JS Files
" let g:jsx_ext_required = 0
"
" " configure Syntastic to use ESLint
" let g:syntastic_javascript_checkers = ['eslint']
"
" " configure Syntastic to use PSlint for python
" let g:syntastic_python_checkers = ['pylint']

" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h,*.js,*.go set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw,*.js,*.go set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw,*.js,*.go set expandtab
au BufRead,BufNewFile *.py,*.js,*.go set softtabstop=4


highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix


let python_highlight_all=1
syntax on


set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" make backspaces more powerfull
set backspace=indent,eol,start

" colorscheme SlateDark

" VIM COLORS SOLARIZED
" syntax enable
" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized
" call togglebg#map("<F5>")

" Dracula
syntax on
color dracula



" NERD TREE TAB
" open nerd tree when vim is launched
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Shortcut for opening nerd tree
map <C-n> :NERDTreeToggle<CR>

" Close nerd tree automatically when a file is opened
let NERDTreeQuitOnOpen = 1

" Automatically delete the buffer of the just deleted file
let NERDTreeAutoDeleteBuffer = 1

" remove the stupid old `Press ? for help 
" and the niusance arrows
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ignore python compiled files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


" Turn hybrid numbers on
set nu                  " display line numbers
set nu rnu


set clipboard+=unnamed  " use the clipboards of vim and win
set go+=a               " Visual selection automatically copied to the clipboard


" Powerline
" set rtp+=/development/.vim/bundle/powerline/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" set termencoding=utf-8
" set guifont=Ubuntu\ Mono\ derivative\ Powerline:10
" set guifont=Ubuntu\ Mono
" let g:Powerline_symbols = 'fancy'



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

" emmet-vim
" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

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

" PYTHON VIRTUALENV SUPPORT
py3 << EOF
import os, sys, pathlib
if 'VIRTUAL_ENV' in os.environ:
    venv = os.getenv('VIRTUAL_ENV')
    site_packages = next(pathlib.Path(venv, 'lib').glob('python*/site-packages'), None)
    if site_packages:
        sys.path.insert(0, str(site_packages))
EOF

" CTRLP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
" Set no max file limit
let g:ctrlp_max_files = 0
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

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

" FZF
set rtp+=/usr/local/opt/fzf

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

"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Ignore for python files as pymode plugin
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
" let g:syntastic_python_checkers = ['pylint']

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"
" Difference btwn buffer and unmodified version on disk
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Py mode
let g:pymode_python = 'python3'
let g:pymode_lint_cwindow = 0

" NeoMake
call neomake#configure#automake('nrwi', 500)
" let g:neomake_open_list = 2
"
" Tagbar
nmap <F8> :TagbarToggle<CR>

" airline
let g:airline_powerline_fonts = 1 

" fzf
set rtp+=/usr/local/opt/fzf
