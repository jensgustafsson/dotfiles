call plug#begin()
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'bkad/CamelCaseMotion'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
call plug#end()

set wildignore+=*/venv/*,*/.venv/*,*/node_modules/*,*/__pycache__/*,*/.git/*,*.o/*.pyc,*.so,*.swp,*.zip

set mouse=a
set history=200
set clipboard^=unnamed,unnamedplus
set ignorecase
set number
set tabstop=4
set expandtab
set shiftwidth=4
set nobackup
set nowritebackup
set noswapfile"
set hlsearch
set hidden
set showcmd
set wildmenu
set showmatch
set encoding=utf-8
set fileformat=unix
set cursorline
set ruler
set scrolloff=4
set smartindent
set textwidth=120
set lazyredraw
set ttyfast
set splitbelow
set splitright
set tags=tags
set noerrorbells visualbell t_vb=
set backspace=indent,eol,start

syntax on

highlight clear SignColumn
highlight clear ALEErrorSign
highlight clear ALEWarningSign

let mapleader = "\<Space>"

imap jk <Esc>
noremap <leader>l :set list!<CR>
nnoremap <leader>z :Goyo<cr>
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
nnoremap <leader>js :%!python -m json.tool<cr>
nnoremap <leader>vimrl :source $MYVIMRC<CR>
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

noremap <silent> <C-k> <Plug>(ale_previous_wrap)
noremap <silent> <C-j> <Plug>(ale_next_wrap)


let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_virtualtext_cursor = 'current' " current | disabled
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠'

call camelcasemotion#CreateMotionMappings('<leader>')

command! Dos2Unix execute ":update | e ++ff=dos | setlocal ff=unix | w"


augroup filetype_python
    autocmd!
    autocmd FileType python setlocal colorcolumn=90
    autocmd FileType python setlocal nosmartindent
augroup END

augroup filetype_tsx
    autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
augroup END
