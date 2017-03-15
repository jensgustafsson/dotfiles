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
set clipboard=unnamed

" Searches are case insenitive.
set ignorecase

" Dont make backups or swapfiles.
set nobackup
set nowritebackup
set noswapfile"

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
set tags=tags;
nnoremap <silent> <F12> :echo "Rebuilding tags..."<cr>:!ctags .<cr>:echo "Rebuilt tags"<cr>

" Disable annoying sound.
set noerrorbells visualbell t_vb=

" Enable syntax highlighting.
syntax on

call plug#begin()

Plug 'rking/ag.vim'

" Status/tabline for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

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

" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim'

" Comment stuff out.
Plug 'tpope/vim-commentary'

" Solution for snippets in Vim.
Plug 'SirVer/ultisnips'

" Python syntax highlighting script for Vim
Plug 'hdima/python-syntax'

" Faster folding.
Plug 'Konfekt/FastFold'

" Git plugins.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'saltstack/salt-vim', { 'for': 'sls' }

" Color themes
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

" Configure ale.
let &runtimepath.=',~/.vim/bundle/ale'
filetype plugin on
silent! helptags ALL

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 1
let g:ale_sign_column_always = 1
let g:ale_open_list = 0

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Configure ag.
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <leader>a :Ag ""<left>

" Configure Ctrl-P.
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = ''
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>t :CtrlPTag<cr>

" Configure folding. (Fastfold plugin)
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']

" Airline config
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

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
colorscheme base16-hopscotch

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
