"General settings
set hls
set nu
set is
set backspace=indent,eol,start
filetype plugin indent on
set hidden
syntax on
set notagrelative
set noswapfile
set path=.,**
set wildignore=*/CMakeFiles/*
set ignorecase
set shortmess-=S
set relativenumber

"Statusline
set statusline=
set statusline+=%F
set statusline+=\ line:%l\/%L
set laststatus=2

"Debugger
packadd termdebug
let g:termdebug_wide=1

"Key mappings
let mapleader = "\\"
inoremap jk <esc>
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Ag<Cr>
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <c-j> :bp<Cr>
nnoremap <c-k> :bn<Cr>
nnoremap <leader>s :source $MYVIMRC<Cr>


"Plugins
call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sainnhe/everforest'
Plug 'tpope/vim-fugitive'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Valloric/YouCompleteMe'
Plug 'chiel92/vim-autoformat'
call plug#end()
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

"Formatter
let g:formatterpath = ['/usr/bin/clang-format','/usr/bin/autopep8']
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1
noremap <F3> :Autoformat<CR>

"Autocommand group
augroup general
	autocmd!
	"Comment/Uncomment lines
	autocmd FileType cpp,c,h,hpp noremap <buffer> <leader>c I//<esc>
	autocmd FileType yaml noremap <buffer> <leader>c I#<esc>
	autocmd FileType vim noremap <buffer> <leader>c I"<esc>
	"auto format on save
	autocmd FileType cpp,py autocmd BufWritePre <buffer> Autoformat
augroup END

"color scheme
if has('termguicolors')
  set termguicolors
endif
set background=dark
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
colorscheme everforest

"You-complete-me
let g:ycm_enable_semantic_highlighting = 1

