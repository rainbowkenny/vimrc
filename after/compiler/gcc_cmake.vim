if exists("current_compiler")
  finish
endif

let current_compiler = "gcc_cmake"


" Set the command to build and run the test
" set makeprg=cmake\ -DCOMPILE_TESTS=ON\ -DCOMPILE_SIMULATOR=ON\ -DCMAKE_BUILD_TYPE=RelWithDebInfo\ .\;make\ -j4\;

" let &errorformat = %.
CompilerSet errorformat=
      \%*[^\"]\"%f\"%*\\D%l:%c:\ %m,
      \%*[^\"]\"%f\"%*\\D%l:\ %m,
      \\"%f\"%*\\D%l:%c:\ %m,
      \\"%f\"%*\\D%l:\ %m,
      \%-G%f:%l:\ %trror:\ (Each\ undeclared\ identifier\ is\ reported\ only\ once,
      \%-G%f:%l:\ %trror:\ for\ each\ function\ it\ appears\ in.),
      \%f:%l:%c:\ %trror:\ %m,
      \%f:%l:%c:\ %tarning:\ %m,
      \%f:%l:%c:\ %m,
      \%f:%l:\ %trror:\ %m,
      \%f:%l:\ %tarning:\ %m,
      \%f:%l:\ %m,
      \%f:\\(%*[^\\)]\\):\ %m,
      \\"%f\"\\,\ line\ %l%*\\D%c%*[^\ ]\ %m,
      \%D%*\\a[%*\\d]:\ Entering\ directory\ %*[`']%f',
      \%X%*\\a[%*\\d]:\ Leaving\ directory\ %*[`']%f',
      \%D%*\\a:\ Entering\ directory\ %*[`']%f',
      \%X%*\\a:\ Leaving\ directory\ %*[`']%f',
      \%DMaking\ %*\\a\ in\ %f
"set errorformat+=\%-G\%f:%l:%c:%\ %m
"set errorformat+=\%-G\%-P%.%#\%.%#\%.%#\ %m\ in\ %.%#\%.%#\:.%#\%
" Highlight error lines
"highlight QuickFixLine ctermbg=Red ctermfg=White guibg=Red guifg=White
