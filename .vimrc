" Necesary for lots of cool vim things
" Makes vim less vi-compatible. Is default for non systemwide vimrc.
set nocompatible

" Makes it possible to move between lines.
set whichwrap=<,>,[,],h,l

" Cygwin hack. Make backspaces work.
set backspace=indent,eol,start

" A file that matches with one of these patterns is ignored
" when expanding |wildcards|, completing file or dir names.
set wildignore+=*/venv/*,*/Python34/*,*/node_modules/*,*/__pycache__/*,*/.git/*,*.o/*.pyc,*.so,*.swp,*.zip

" Last window does always have a statusline.
set laststatus=2

" Enable the use of mouse.
set mouse=a

" Remember typed commands in vim.
set history=200

" Yank and paste to/from "* register.
" cross platform solution...
set clipboard^=unnamed,unnamedplus

" Searches are case insenitive.
set ignorecase

" Dont make backups or swapfiles.
set nobackup
set nowritebackup
set noswapfile"

" Use space as leader
let mapleader = "\<Space>"

" Configure "list" cmd.
" Set chars to show in 'list' mode.
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
nmap <leader>l :set list!<CR>

" When there is a previous search pattern, highlight all its matches.
set hlsearch

" Use spaces, not tabs...
set tabstop=4
set expandtab
set shiftwidth=4

" Show line numbers
set number

" Opening a new file when the current buffer has unsaved
" changes causes files to be hidden instead of closed.
" The unsaved changes can still be accessed by typing :ls
" and then :b[N], where [N] is the number of a buffer
set hidden

" Show (partial) command in the last line of the screen.
set showcmd

" Enable command-line completion. (Usually <tab>)
set wildmenu

" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" Set filetype etc.
set encoding=utf-8
set fileformat=unix

" Show cursorline.
set cursorline

" Show the line and column number in statusline.
set ruler

" Set scroll options.
set scrolloff=4

" Do smart autoindenting when starting a new line.
set smartindent

" Maximum width of text that is being inserted.
set textwidth=120

" Improve speed in terminal...
set lazyredraw
set ttyfast

" Configure how to split windows horizontally and vertically.
set splitbelow
set splitright

" Configure ctags.
set tags=tags

" Commands to generate ctags.
nnoremap <silent> <F12> :AsyncRun ctags -f tags .<cr>
nnoremap <silent> <F9> :AsyncRun ctags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")<cr>

" Disable annoying sound.
set noerrorbells visualbell t_vb=

" Enable syntax highlighting.
syntax on

call plug#begin()

Plug 'skywind3000/asyncrun.vim'

" Better version of/improved netrw
Plug 'tpope/vim-vinegar'

" A command-line fuzzy finder
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Plugin that makes fzf work in vim.
Plug 'junegunn/fzf.vim'

" Status/tabline for vim
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'

" Add linting to lightline...
Plug 'maximbaz/lightline-ale'

" Vim plugin for the_silver_searcher
Plug 'mileszs/ack.vim'

" Better indentation for Python
Plug 'hynek/vim-python-pep8-indent'

" Move CamelCaseWise or underscore_wise
Plug 'bkad/CamelCaseMotion'

" JS syntax highlighting and improved indentation.
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" Comment stuff out.
Plug 'tpope/vim-commentary'

" Solution for snippets in Vim.
Plug 'SirVer/ultisnips'

" Python syntax highlighting script for Vim
Plug 'hdima/python-syntax'

" Faster folding.
Plug 'Konfekt/FastFold'

" Better folding for python
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }

" Git plugins.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Saltstack plugin
Plug 'saltstack/salt-vim', { 'for': 'sls' }

" Color themes
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'

" A Personal Wiki For Vim
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
map <Leader>tt <Plug>VimwikiToggleListItem

" Distraction-free writing in Vim.
Plug 'junegunn/goyo.vim'
nnoremap <leader>z :Goyo<cr>

call plug#end()

" Configure ale.
let &runtimepath.=',~/.vim/bundle/ale'
filetype plugin on
silent! helptags ALL

let g:syntastic_javascript_checkers = ['standard']

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 1
let g:ale_sign_column_always = 1
let g:ale_open_list = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" Set this in your vimrc file to disabling highlighting
let g:ale_set_highlights = 0

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

highlight ALEWarning ctermbg=DarkMagenta

" lightline
let g:lightline = {
            \ 'component': {
            \  'readonly': '%{&readonly?"":""}',
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

" TODO: Uncomment and download fonts such that this looks cool...
"let g:lightline#ale#indicator_checking = "\uf110"
"let g:lightline#ale#indicator_warnings = "\uf071"
"let g:lightline#ale#indicator_errors = "\uf05e"
"let g:lightline#ale#indicator_ok = "\uf00c"

" Configure fzf
nnoremap <leader>p :Files<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>b :Buffers<cr>

" Configure ag.
nnoremap <leader>a :Ag<cr>

" Redefine command Ag to use fzf#vim#ag and to ignore specified ignore-files.
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--ignore ./venv --ignore ./.dockerignore --ignore ./.git --ignore ./.gitignore --hidden', <bang>0)

" Configure folding. (Fastfold plugin)
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']

" Configure simplefold
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 1

" Statusline config.
set statusline+=%#warningmsg#
set statusline+=%{ALEGetStatusLine()} " Ale-specific.
set statusline+=%*

" Make it possible to "change" word until underscore.
call camelcasemotion#CreateMotionMappings('<leader>')

" Cmd for enabling/disabling highlighting search results.
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" Jk is the same as escape. Neat!
imap jk <Esc>

" Validate and pretty-print json.
nnoremap <leader>js :%!python -m json.tool<cr>

" Open vimrc file.
nmap <leader>vimrc :e $MYVIMRC<CR>

" Reload vimrc.
nnoremap <leader>vimrl :source $MYVIMRC<CR>

" Toggle between dark and light background.
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Toggle between cursorline and cursorcolumn.
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Convert windows line endings to unix.
command! Dos2Unix execute ":update | e ++ff=dos | setlocal ff=unix | w"

" Python specific settings.
augroup filetype_python
    autocmd!
    autocmd FileType python setlocal colorcolumn=80
    autocmd FileType python setlocal nosmartindent
augroup END

" Cygwin specific settings
" Use block cursor in normal mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

" Set same colorscheme in vim as terminal
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Set background...
set background=light
colorscheme base16-materia
nnoremap <leader>bg1 :colorscheme base16-solarized-light<CR>
nnoremap <leader>bg2 :colorscheme base16-chalk<CR>
nnoremap <leader>bg3 :colorscheme base16-materia<CR>


if &term =~ '256color'
  " Fixing Vim's Background Color Erase for 256-color tmux and GNU screen
  " https://sunaku.github.io/vim-256color-bce.html
  " This setting must be applied after `set term=xterm-256color`. (If it is set)
  set t_ut=
endif

" Enable true colors in vim.
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

if !has('gui_running')
  set t_Co=256
endif

function ToggleCd()
    if exists(beginPath) && beginPath != 0
        let beginPath = 0
        cd beginPath
    else
        let beginPath = getcwd()
        lcd
endfunction

autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab

" Write dts to autosinsert a date.
inoremap dts <c-r>=strftime('%Y-%m-%d-%A')<CR>

nnoremap <leader>wwt :VimwikiRebuildTags<CR>:VimwikiGenerateTags<CR>
