
call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-vinegar'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/limelight.vim'
Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
"Colors"
Plug 'flazz/vim-colorschemes'
"others"
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
 
"tmux"
Plug 'christoomey/vim-tmux-navigator'
Plug 'kovisoft/slimv'
call plug#end()            


set background=dark
set t_Co=255
set shiftwidth=1
set tabstop=2
set expandtab
syntax on
set modeline
nmap oo o<Esc>k
nmap OO O<Esc>j
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set splitbelow
set splitright
set number

colorscheme badwolf
	
let g:vimtex_view_general_viewer = 'evince'
let g:syntastic_tex_lacheck_quiet_messages = {'regex': '\Vpossible unwanted space at' }
let g:ale_sign_column_always = 1
let g:airline_powerline_fonts = 1


au BufNewFile,BufRead *.py
    \ set tabstop=4|
    \ set softtabstop=4|
    \ set shiftwidth=4|
    \ set textwidth=79|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix

au BufNewFile,BufRead *.tex
    \ set tabstop=4|
    \ set softtabstop=4|
    \ set shiftwidth=4|
    \ set textwidth=79|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix|
    \ colorscheme gruvbox
