set nocompatible
set backspace=indent,eol,start " Cygwin hack. Make backspaces work.
set rtp+=/usr/lib/python3.4/site-packages/powerline/bindings/vim/
set wildignore+=*/venv/*,*/Python34/*,*/node_modules/*,*/__pycache__/*,*/.git/*,*.o/*.pyc,*.so,*.swp,*.zip
set laststatus=2
set mouse=a
set history=200
set clipboard=unnamed
set ignorecase
set nobackup
set nowritebackup
set noswapfile"
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set hls
set tabstop=4
set expandtab
set shiftwidth=4
set number
set hidden
set showcmd
set wildmenu
set showmatch
set encoding=utf-8
set fileformat=unix
set cursorline
set ruler
set scrolloff=4
set shiftwidth=4
set showcmd
set showmatch
set smartindent
set textwidth=120
set whichwrap=<,>,[,],h,l
set lazyredraw
set ttyfast
set background=dark
set splitbelow
set splitright
set tags=tags;

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'rking/ag.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'bkad/CamelCaseMotion'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'SirVer/ultisnips'
Plugin 'hdima/python-syntax'
Plugin 'Konfekt/FastFold'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'chriskempson/base16-vim'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

call vundle#end()
filetype plugin indent on

" colorscheme PaperColor
colorscheme gruvbox

syntax on
filetype on

let g:python_folding = 1
let g:Python3Syntax = 1
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "☣"
let g:syntastic_warning_symbol = "☠"
let g:syntastic_style_error_symbol = "💩"
let g:syntastic_style_warning_symbol = "✗"
let g:syntastic_always_populate_loc_list = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = ''
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']


call camelcasemotion#CreateMotionMappings('<leader>')

imap jk <Esc>
nnoremap <leader>a :Ag ""<left>
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
nnoremap <leader>js :%!python -m json.tool<cr>
nnoremap <silent> <F12> :echo "Rebuilding tags..."<cr>:!ctags .<cr>:echo "Rebuilt tags"<cr>
nmap <leader>l :set list!<CR>
nmap <leader>vimrc :e $MYVIMRC<CR>
nnoremap <leader>vimrl :source $MYVIMRC<CR>
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
nnoremap <leader>bd :set background=dark<cr>
nnoremap <leader>bl :set background=light<cr>
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>t :CtrlPTag<cr>

command! Dos2Unix execute ":update | e ++ff=dos | setlocal ff=unix | w"

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" Cygwin specific settings
" Use block cursor in normal mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
