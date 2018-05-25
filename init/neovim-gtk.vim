" Disable external tabline because it doesn't show buffer names like
" vim-airline's.
call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)

" Font with ligatures! Literally the main reason to use NeovimGtk
call rpcnotify(1, 'Gui', 'Font', 'FuraCode Nerd Font 11')

" Cmdline popup is fun
call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 1)
