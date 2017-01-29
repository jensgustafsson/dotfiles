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
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'airblade/vim-gitgutter'

" Color themes
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'lifepillar/vim-solarized8'
Plugin 'reedes/vim-colors-pencil'


let g:pencil_higher_contrast_ui = 0   " 0=low (def), 1=high
let g:pencil_neutral_headings = 1   " 0=blue (def), 1=normal
let g:pencil_terminal_italics = 1
let g:pencil_spell_undercurl = 1       " 0=underline, 1=undercurl (def)
let g:pencil_gutter_color = 1      " 0=mono (def), 1=color
let g:pencil_neutral_code_bg = 1   " 0=gray (def), 1=normal



if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

call vundle#end()
filetype plugin indent on

highlight ColorColumn ctermbg=gray
set colorcolumn=80

syntax on
filetype on

let g:python_folding = 1
let g:Python3Syntax = 1

let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = ''

let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']

let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*



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
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
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
let g:airline_theme='PaperColor'

augroup filetype_python
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

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" colorscheme solarized8_dark_flat

if &term =~ '256color'
  " Fixing Vim's Background Color Erase for 256-color tmux and GNU screen
  " https://sunaku.github.io/vim-256color-bce.html
  " This setting must be applied after `set term=xterm-256color`. (If it is set)
  set t_ut=
endif

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
