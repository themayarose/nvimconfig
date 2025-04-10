" Terminal
au BufWinEnter,WinEnter term://* startinsert
au TermOpen term://* setl nonumber | startinsert

" Restore quickfix <cr>
autocmd BufReadPost quickfix nnoremap <buffer> <cr> <cr>

" Autocheck with neomake
au! BufEnter,BufWritePost *.js,*.jsx,*.py,*.hs,*.c,*.cpp,*.rs,*.go Neomake

" Haskell
"
" Still considering if these are useful enough...
" au BufNewFile,BufRead,BufReadPost *.hs nnoremap <Leader>ht :GhcModType<CR>
" au BufNewFile,BufRead,BufReadPost *.hs nnoremap <Leader>hp V:PointFree<CR>
" au BufNewFile,BufRead,BufReadPost *.hs nnoremap <Leader>hr V:PointFree!<CR>
" au BufNewFile,BufRead,BufReadPost *.hs nnoremap <Leader>hl :HLint<CR>
" au BufNewFile,BufRead,BufReadPost *.hs nnoremap <Leader>hgl :GhcModLint<CR>
"
au BufNewFile,BufRead,BufReadPost *.hs set omnifunc=necoghc#omnifunc

" CPP
au BufNewFile,BufRead,BufEnter *.cpp set omnifunc=""
au BufNewFile,BufRead,BufEnter *.c set omnifunc=""
au BufNewFile,BufRead,BufEnter *.h set omnifunc=""
au BufNewFile,BufRead,BufEnter *.cs set omnifunc=""
au BufNewFile,BufRead,BufReadPost *.cs LspStart

" HTML
au BufNewFile,BufRead,BufReadPost *.html set filetype=htmldjango

" Markdown
au BufNewFile,BufRead,BufReadPost *.md set filetype=markdown

" Latex
au BufNewFile,BufRead,BufReadPost *.tex set filetype=tex

" SQL
au FileType sql set commentstring=--\ %s

" Javascript
au BufNewFile,BufRead,BufReadPost *.js let b:neomake_jsx_eslint_exe =
            \ systemlist("realpath $(find . -type d -name node_modules | head -n 1)")[0] .
            \ '/.bin/eslint'
au BufNewFile,BufRead,BufReadPost *.js let b:neomake_javascript_eslint_exe =
            \ systemlist("realpath $(find . -type d -name node_modules | head -n 1)")[0] .
            \ '/.bin/eslint'


au VimResized * set ead=hor ea noea " keep windows evenly spaced horizontally
