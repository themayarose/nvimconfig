" Restore quickfix <cr>
autocmd BufReadPost quickfix nnoremap <buffer> <cr> <cr>

" Autocheck with neomake
au! BufEnter,BufWritePost *.js,*.jsx,*.py,*.hs,*.c,*.cpp,*.rs,*.go Neomake

" Haskell
au BufNewFile,BufRead,BufReadPost *.hs nmap <Leader>ht :GhcModType<CR>
au BufNewFile,BufRead,BufReadPost *.hs nmap <Leader>hp V:PointFree<CR>
au BufNewFile,BufRead,BufReadPost *.hs nmap <Leader>hr V:PointFree!<CR>
au BufNewFile,BufRead,BufReadPost *.hs nmap <Leader>hl :HLint<CR>
au BufNewFile,BufRead,BufReadPost *.hs nmap <Leader>hgl :GhcModLint<CR>
au BufNewFile,BufRead,BufReadPost *.hs set omnifunc=necoghc#omnifunc

" CPP
au BufNewFile,BufRead,BufEnter *.cpp set omnifunc=""
au BufNewFile,BufRead,BufEnter *.c set omnifunc=""
au BufNewFile,BufRead,BufEnter *.h set omnifunc=""

" HTML
au BufNewFile,BufRead,BufReadPost *.html set filetype=htmldjango

" Markdown
au BufNewFile,BufRead,BufReadPost *.md set filetype=markdown

" SQL
au FileType sql set commentstring=--\ %s

" Javascript
au BufNewFile,BufRead,BufReadPost *.js let b:neomake_jsx_eslint_exe = getcwd() .'/node_modules/.bin/eslint'
au BufNewFile,BufRead,BufReadPost *.js let b:neomake_javascript_eslint_exe = getcwd() .'/node_modules/.bin/eslint'
