" Local config that needs to run before everything else

let g:CONFIG_PATH = $HOME . '/.config/nvim'


if filereadable(expand("~/.nvimrc_local_prepend"))
    source ~/.nvimrc_local_prepend
endif

" Fix list chars for windows
if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
endif

" Default options
runtime init/vim-opts.vim
runtime init/functions.vim

" Detect OSX
let g:IsOSX = 0
let g:IsWin = 0

if has("unix")
    let s:uname = system("echo -n \"$(uname)\"")
    if s:uname == "Darwin"
        let g:IsOSX = 1
    endif
elseif has("win32")
    let g:IsWin = 1
endif

runtime init/mappings.vim

let g:plugin_path = g:CONFIG_PATH . '/plugged'

runtime init/plugins.vim

runtime init/plugins-opts.vim

runtime init/autocmd.vim

runtime init/airline-powerline.vim

" Local config
if filereadable(expand("~/.nvimrc_local"))
    source ~/.nvimrc_local
endif

highlight clear Conceal

