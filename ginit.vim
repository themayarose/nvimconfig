if exists('g:GtkGuiLoaded')
    " NeovimGtk
    runtime init/neovim-gtk.vim
else
    " Neovim-Qt
    GuiFont! FuraCode Nerd Font:h11
endif

nnoremap <silent> <c-pageup> <c-\><c-n>:tabp<cr>
nnoremap <silent> <c-pagedown> <c-\><c-n>:tabn<cr>
tnoremap <silent> <c-pageup> <c-\><c-n>:tabp<cr>
tnoremap <silent> <c-pagedown> <c-\><c-n>:tabn<cr>
