set autoindent
set ignorecase
set smartcase
set nowrap
set linebreak
set ruler
set showmatch
set showmode
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set laststatus=2
set incsearch
set backspace=indent,eol,start
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set scrolloff=5
set sidescrolloff=5
set mouse=a
set nu
set completeopt=menuone,noinsert,noselect
set foldlevel=99
set colorcolumn=80
set textwidth=80
set formatoptions=jcroql
set wildmenu
set autoread
let &directory=g:CONFIG_PATH . '/swap'
set sessionoptions=curdir,tabpages,localoptions,blank,buffers,folds,resize,winpos,winsize
" set wildcharm=<C-,>
set hidden
set switchbuf=useopen
set nohlsearch
set background=dark
set title
set termguicolors
set list
set splitright
set splitbelow
set signcolumn=auto
set updatetime=1
set winborder=rounded

syntax on

if has("win32")
    let g:python3_host_prog = "C:\\Users\\maya\\scoop\\shims\\python3.EXE"
else
    let g:python3_host_prog = "/usr/sbin/python3"
end

