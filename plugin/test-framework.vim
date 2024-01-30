" nnoremap <leader>t :call <SID>ListTestsInCurrentFile()<cr>

" function! s:ListTestsInCurrentFile()
" 	" call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" 	vim /TEST(.*)/g %
" 	copen
" endfunction

" ~/.vim/plugin/testlist.vim
" Function to extract test cases from the current buffer
function! GetTestCases()
  let testCases = []
  let inTestBlock = 0

  " Iterate through each line in the buffer
  for lnum in range(1, line('$'))
    let lineContent = getline(lnum)

    " Check if the line contains a test case
    if match(lineContent, '^\s*TEST(') != -1
      echom lineContent
      let inTestBlock = 1
      let testCase = lineContent
    elseif inTestBlock && lineContent =~ '^\s*}'
      let inTestBlock = 0
      call add(testCases, testCase)
      echom testCases
    endif
  endfor

  return testCases
endfunction

" Command to open FZF window with test cases
" command! -nargs=0 ListTestCases call fzf#run(fzf#wrap('Test Cases', GetTestCases()))
command! -nargs=0 ListTestCases call fzf#run(fzf#wrap('Test Cases', {'source':GetTestCases()}))
