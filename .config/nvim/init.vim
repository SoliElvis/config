call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-vinegar'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'vim-syntastic/syntastic'
Plug 'davidhalter/jedi-vim'
Plug 'tmhedberg/SimpylFold' 
Plug 'christoomey/vim-tmux-navigator'

Plug 'flazz/vim-colorschemes'   
call plug#end()
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_target="tmux"

"general"
set encoding=utf-8
syntax on
set nu
set relativenumber
set ruler
map <C-n> :NERDTreeToggle<CR>
nmap oo o<Esc>k
nmap OO O<Esc>j
hi Normal ctermbg=none
highlight NonText ctermbg=none
hi Normal guibg=NONE ctermbg=NONE
nnoremap <CR> :noh<CR><CR>

"Tmux
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

"Python"
au BufNewFile,BufRead *.jl
    \ set tabstop=2|
    \ set softtabstop=2|
    \ set shiftwidth=2|
    \ set textwidth=90|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix|
     colorscheme badwolf

let python_highlight_all=1

"Julia"
au VimEnter,BufRead,BufNewFile *.jl set filetype=julia
au BufNewFile,BufRead *.jl
    \ set tabstop=2|
    \ set softtabstop=2|
    \ set shiftwidth=2|
    \ set textwidth=90|
    \ set expandtab|
    \ set autoindent|
    \ set foldmethod=indent|
    \ set fileformat=unix|
     colorscheme badwolf


" Remove trailing whitespace
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap ,ws :StripTrailingWhitespaces<CR>

" Strip whitespace
function! <SID>StripTrailingWhitespaces()
" Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
" Do the business:
    %s/\s\+$//e
" Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
