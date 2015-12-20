 set rtp+=/usr/lib/python3.4/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

set mouse=a

set history=200

let g:syntastic_python_python_exec = '/usr/bin/python3.4'
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "☣"
let g:syntastic_warning_symbol = "☠"
let g:syntastic_style_error_symbol = "💩"
let g:syntastic_style_warning_symbol = "✗"
let g:syntastic_always_populate_loc_list = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vundle plugin

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'bitfyre/vim-indent-html'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'jensgustafsson/jedi-vim'
Plugin 'tpope/vim-commentary'
Plugin 'SirVer/ultisnips'
Plugin 'Raimondi/delimitMate'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'rking/ag.vim'
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>a :Ag<Space>
let g:ag_working_path_mode="r"


set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present

" swap files (.swp) in a common location
" // means use the file's full path
" set dir=~/.vim/_swap//

" backup files (~) in a common location if possible
" set backup
" set backupdir=~/.vim/_backup//

" turn on undo files, put them in a common location
" set undofile
" set undodir=~/.vim/_undo/
"
set nobackup            " do not keep a backup file
set nowritebackup
set noswapfile"

if has("win32unix")
    " Cygwin specific settings
    " Use block cursor in normal mode
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
endif

imap jk <Esc>

" Docstring popup in jedivim disabled
autocmd FileType python setlocal completeopt-=preview

command Dos2Unix execute ":update | e ++ff=dos | setlocal ff=unix | w"

" Doc does not automatically pop up
let g:jedi#popup_on_dot = 0

set fileformats=unix
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<, 
set list
nmap <leader>l :set list!<CR>

syntax on
set t_Co=256
colorscheme badwolf " antares

"" MY OWN VIMRC CONFIGURATION STARTS HERE
"" --------------------------------------
"" ......................................
" Make backspace work in cygwin. Cant erase if this line is not set...
set backspace=indent,eol,start

"nnoremap <CR> :nohlsearch<CR><CR>

map <F12> :set nohls<CR>:let @/ = ""<CR>:set hls<CR>
set hls

set cursorline

" Number of spaces equals a tab
set tabstop=4
set expandtab
set shiftwidth=4

" Show line number
set number

" Make it easier to switch branches. Make it possible to change even though
"there is usaved content
set hidden

" Show command in bottom bar
set showcmd

" visual autocomplete for command menu
set wildmenu

" Highlight matching [{()}]
set showmatch


set encoding=utf-8

set fileformat=unix	" No crazy CR/LF
set ruler	" Show the line position at the bottom of the window
set scrolloff=4	" Minimum lines between cursor and window edge
set shiftwidth=4	" Indent by 4 columns
set showcmd	" Show partially typed commands
set showmatch	" Show parentheses matching
set smartindent	" Indent settings
set textwidth=100	" Maximum line width
set whichwrap=<,>,[,],h,l " Allows for left/right keys to wrap across lines


set lazyredraw
set ttyfast

set background=dark

map ä $
map ö ^

"nerdtree options
map <C-n> :NERDTreeToggle<CR>


" ctrlp options
set wildignore+=,*/venv/*,*/Python34/*,*/node_modules/*,*/__pycache__/*,*/.git/*,*.o/*.pyc,*.so,*.swp,*.zip
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = ''

"switch splits more easy
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" =========================================================================
" NOTES ABOUT SPLITS
" new split :sp (horizontal) or :vsp (vertical)
" OR by using ctrl-w n OR  ctrl-w v" close a split with :q

" "Max out the height of the current split
"ctrl + w _

" "Max out the width of the current split
"ctrl + w |

" "Normalize all split sizes, which is very handy when resizing terminal
"ctrl + w =

"==========================================================================
"
setlocal colorcolumn=
autocmd Filetype python setlocal colorcolumn=80
"autocmd BufRead,BufNewFile *.py set colorcolumn=80
"autocmd FileType python set I


if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
endif

