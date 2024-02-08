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
set nocompatible
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
nnoremap <leader>e :Explore<CR>
inoremap jk <esc>
nnoremap 0 ^
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Ag<Cr>
nnoremap <leader>c :History:<cr>
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <c-j> :bp<Cr>
nnoremap <c-k> :bn<Cr>
nnoremap <leader>mt :tabnew %<cr>
"motion last/next parenthesis
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
"select function name
onoremap <silent> <leader>F :<C-U>normal! 0f(hviw<CR>
"till next capital letter, doesn't work in visual mode
onoremap <silent> <leader>K /\u<cr>

noremap <leader>h :nohls<cr>
noremap <leader>v :e $MYVIMRC<Cr>
"source stuff
nnoremap <leader>s :source $MYVIMRC<Cr>
nnoremap <s-s> :so%<cr>
"new line normal mode
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
"paste
inoremap <C-v> <c-r>"

"change to reference or pointer  
inoremap <leader>tr <esc>diwi&<c-r>"
inoremap <leader>tp <esc>diwi*<c-r>"

"delete eol comments
nnoremap <leader>dc 0f/D
" save file
noremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>
"open a terminal
nnoremap <s-t> :vert term ++kill=term<cr>

"run test
" nnoremap <C-t> :!./tests/mainboard_tests<cr>
nnoremap <C-t> :!./build/cppunittests<cr>

" git blame
nnoremap <leader>gb :Git blame<cr>
" git add current file
nnoremap <leader>a :execute "Git add %\|echom @% . ' staged'"<cr>
"open last buffer in a vert split
nnoremap <leader>w :bel vs bufname("#")<cr>
" switch header and source
nnoremap <c-h> :call CurtineIncSw()<CR>
" preview markdown
nnoremap <C-m> <Plug>MarkdownPreview
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

"yank current file's path
nnoremap <leader>yp :let @@=expand('%:p')<CR>

"yank compiling error
nnoremap <leader>ye :let @@=v:statusmsg<CR>

"You complete me
nnoremap gd :YcmCompleter GoToDefinition<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>r :YcmCompleter RefactorRename 
nnoremap <leader>f :YcmCompleter FixIt 

"Chat-gpt
vnoremap <c-e> :Explain{}<CR>
nnoremap <leader>cc :Ask 
vnoremap <leader>cc :Ask 

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
Plug 'jiangmiao/auto-pairs'
Plug 'drmikehenry/vim-headerguard'
Plug 'apalmer1377/factorus'
Plug 'CoderCookE/vim-chatgpt'
Plug 'tmhedberg/SimpylFold'
Plug 'jmckiern/vim-shoot', { 'do': '\"./install.py\" geckodriver' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

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
	autocmd FileType cpp,python autocmd BufWritePre <buffer> Autoformat
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

" Fix enter in quickfix---------------------- {{{
augroup qfixEntry
	autocmd!
	autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
augroup END
" }}}
" Color scheme ---------------------- {{{
if has('termguicolors')
  set termguicolors
endif
set t_Co=256
set background=dark
" set background=light
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
colorscheme everforest
" }}}

"You-complete-me
let g:ycm_enable_semantic_highlighting = 1

" chat-gpt
let g:openai_api_key=$OPEN_AI_API_KEY
let g:chat_gpt_max_tokens=2000
let g:chat_gpt_model='gpt-4-turbo-preview'
let g:chat_gpt_session_mode=1
let g:chat_gpt_temperature = 0.7
let g:chat_gpt_lang = 'English'
let g:chat_gpt_split_direction = 'vertical'
vmap <silent> <leader>0 <Plug>(chatgpt-menu)

"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" enable meta/alt key ---------------------- {{{
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50
" }}}
