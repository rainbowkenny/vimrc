"General settings --------------------- {{{
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
" }}}

"Statusline --------------------- {{{
set statusline=
set statusline+=%F
set statusline+=\ line:%l\/%L
set laststatus=2
" }}}

"Debugger --------------------- {{{
packadd termdebug
let g:termdebug_wide=1
" }}}

" Key mappings --------------------- {{{
inoremap jk <esc>
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Ag<Cr>
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <c-j> :bp<Cr>
nnoremap <c-k> :bn<Cr>
"motion last/next parenthesis
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
"select function name
onoremap <silent> F :<C-U>normal! 0f(hviw<CR>

nnoremap <leader>v :e $MYVIMRC<Cr>
nnoremap <leader>s :source $MYVIMRC<Cr>
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>

" save file
noremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>
"open a terminal
nnoremap <s-t> :vert term<cr>

"run test
nnoremap <C-t> :!./tests/mainboard_tests<cr>

" git blame
nnoremap <leader>gb :Git blame<cr>
" git add current file
nnoremap <leader>a :execute "Git add %\|echom @% . ' staged'"<cr>
"open last buffer in a vert split
nnoremap <leader>w :bel vs bufname("#")<cr>
" switch header and source
nnoremap <c-h> :call CurtineIncSw()<CR>
" preview markdown
nmap <C-m> <Plug>MarkdownPreview
" enclose selection with parenthesis
vnoremap <c-p> c()<ESC>P
" enclose selection with brackets
vnoremap <c-b> c{}<ESC>P

"replace the current visual mode selection to something else
vnoremap <leader>r y<ESC>:.,$s/<c-r>0/
" grep under cursor
" nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>:redraw!<cr>

"paste last TEST case
noremap <leader>pt :?TEST(<cr>"2yy"3ya{%o<esc>Go<esc>"2pf{x"3pF,wzz:nohls<cr>



" }}}

" Plugins ---------------------- {{{
call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sainnhe/everforest'
Plug 'tpope/vim-fugitive'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Valloric/YouCompleteMe'
Plug 'chiel92/vim-autoformat'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'tpope/vim-commentary'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'
call plug#end()
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/
" }}}

" Formatter ---------------------- {{{
let g:formatterpath = ['/usr/bin/clang-format','/usr/bin/autopep8']
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1
noremap <F3> :Autoformat<CR>
" }}}

" Vimscript file settings ---------------------- {{{
augroup general
	autocmd!
	"auto format on save
	autocmd FileType cpp,py autocmd BufWritePre <buffer> Autoformat
	"fold
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Comment ---------------------- {{{
augroup comment
	autocmd!
	autocmd FileType cpp,c,h,hpp setlocal commentstring=//\ %s
augroup END
" }}}

" Color scheme ---------------------- {{{
if has('termguicolors')
  set termguicolors
endif
set background=dark
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
colorscheme everforest
" }}}

"You-complete-me
let g:ycm_enable_semantic_highlighting = 1
