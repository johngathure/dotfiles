call plug#begin('~/workspaces/.nvim/plugged')

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
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'

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

" maximize splits
Plug 'szw/vim-maximizer'

" yml
Plug 'stephpy/vim-yaml'

" tagbar.
Plug 'majutsushi/tagbar'

Plug 'Valloric/MatchTagAlways'

" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Python auto formater
Plug 'psf/black'

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

" vim lorem ipsum generator.
Plug 'vim-scripts/loremipsum'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" limelight
Plug 'junegunn/limelight.vim'

" bash support.
Plug 'vim-scripts/bash-support.vim'

" scratch. Window for notes taking
Plug 'mtth/scratch.vim'

" navigate and highlight matching words.
Plug 'andymass/vim-matchup'

" Plugin to stop me from repeating keystrokes.
Plug 'takac/vim-hardtime'

" Kotlin
Plug 'udalov/kotlin-vim'
Plug 'Shadowsith/kotlincomplete.vim'

" Terraform
Plug 'hashivim/vim-terraform'


" Initialize plugin system
call plug#end()
syntax on

" map leader key to space
let mapleader = "\<Space>"
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
" automatically update a file if it is changed externally
set autoread
" height of the command bar
set cmdheight=2
" show last command in the bottom right
set showcmd
" always show current position
set ruler
" show matching braces
set showmatch
" visual autocomplete for command menu
set wildmenu
" hide files with unsaved changes instead of closing them
set hidden
" Backups, Swap Files
set nobackup
set nowb
set noswapfile
" Define standard filetype
set ffs=unix,dos,mac
" highlight current active line
set cursorline
" recognize .md files as markdown files
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" enable spell-checking for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
" Enable folding
set foldmethod=indent
set foldlevel=99
" display relative line numbers
set nu rnu
" use the clipboards of vim and win
set clipboard+=unnamed  
" Visual selection automatically copied to the clipboard
set go+=a
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
" split screen navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" search
" use case insensitive search by default
set ignorecase
" use case sensitive search, if the search term contains uppercase characters
set smartcase
" improve scrolling performance and render performance
set ttyfast
" delay rendering for fewer renders, generally improves performance
set lazyredraw
" don't wrap lines
set nowrap
" Show hidden characters, useful on indentation.
set list
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
" Number of milliseconds that vim waits after you stop typing before it
" triggers a plugin
set updatetime=300
" always show signcolumns
set signcolumn=yes
" don't give |ins-completion-menu| messages.
set shortmess+=c

" PLUGINS CONFIG

" PYTHON MODE SETUP
let g:python3_host_prog = '/usr/local/bin/python3'
let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_lint_cwindow = 0
let g:pymode_options_max_line_length = 100
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_options_colorcolumn = 1
let python_highlight_all=1

" SIMPLE FOLD
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" YOU COMPLETE ME
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" DRACULA
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

" JS and CSS Formatters.
" for js
autocmd FileType javascript noremap <buffer>  <c-f> :call JsxBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" VIM-GO
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


" TAGBAR
nmap <F8> :TagbarToggle<CR>

" FZF
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

" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--layout=reverse'

" Using the custom window creation function
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" Function to create the custom floating window
function! FloatingFZF()
  " creates a scratch, unlisted, new, empty, unnamed buffer
  " to be used in the floating window
  let buf = nvim_create_buf(v:false, v:true)

  " 90% of the height
  let height = float2nr(&lines * 0.9)
  " 60% of the height
  let width = float2nr(&columns * 0.6)
  " horizontal position (centralized)
  let horizontal = float2nr((&columns - width) / 2)
  " vertical position (one line down of the top)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }

  " open the new window, floating, and enter to it
  call nvim_open_win(buf, v:true, opts)
endfunction

nnoremap <c-p> :FZF<CR>

" EMMET VIM
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
    \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
\}

" LIGHTLINE
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

" ALE
let g:ale_virtualtext_cursor = 1 " virtual text

" VIM TMUX
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>

" LIMELIGHT
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

" HARDTIME
let g:hardtime_default_on = 1
let g:hardtime_timeout = 2000
let g:hardtime_ignore_buffer_patterns = ["NERD.*", "index"]
let g:hardtime_allow_different_key = 1

" F2 to return path to file.
map <F2> :echo @% <CR>

" Quickly edit/reload this configuration file
nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>

" VIM TERRAFORM.
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

" BLACK
let g:black_linelength = 100
let g:black_skip_string_normalization = 1
let g:black_virtualenv = '~/workspaces/.nvim/black'
" run black on save
autocmd BufWritePre *.py execute ':Black'
"  map F9 to run black on current file
nnoremap <F9> :Black<CR>

" COC
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
