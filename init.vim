" Local config that needs to run before everything else
if filereadable(expand("~/.nvimrc_local_prepend"))
    source ~/.nvimrc_local_prepend
endif

" Fix list chars for windows
if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
endif

" Default options
runtime init/vim-opts.vim
runtime init/functions.vim

" Detect OSX
let g:IsOSX = 0

if has("unix")
    let s:uname = system("echo -n \"$(uname)\"")
    if s:uname == "Darwin"
        let g:IsOSX = 1
    endif
endif

runtime init/mappings.vim

let g:plugin_path = '~/.config/nvim/plugged'

if !exists('g:GtkGuiLoaded')
    runtime init/plugins.vim
endif

runtime init/plugins-opts.vim

" Local config
if filereadable(expand("~/.nvimrc_local"))
    source ~/.nvimrc_local
endif

highlight clear Conceal

