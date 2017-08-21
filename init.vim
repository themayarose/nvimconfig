" Priority stuff
if filereadable(expand("~/.nvimrc_local_prepend"))
    source ~/.nvimrc_local_prepend
endif

" Default options
set autoindent
set ignorecase
set smartcase
set wrap
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
set completeopt-=preview
set foldlevel=99
set colorcolumn=80
set textwidth=80
set formatoptions=jcroql
set wildmenu
set autoread
set directory=~/.config/nvim/swap
set sessionoptions=curdir,tabpages,localoptions,blank,buffers,folds,resize,winpos,winsize
set wildcharm=<C-,>
set hidden
set switchbuf=useopen
set nohlsearch
set background=dark
" set t_Co=256
set title
set termguicolors

syntax on
filetype off

let $PATH = expand("~/.cabal/bin") . ':' . $PATH

" Moar windoze
if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
endif
set list

" Detect OSX
let g:IsOSX = 0

if has("unix")
    let s:uname = system("echo -n \"$(uname)\"")
    if s:uname == "Darwin"
        let g:IsOSX = 1
    endif
endif

" Essential
nnoremap j gj
nnoremap k gk
nnoremap Y y$
" nnoremap <cr> :
nnoremap ; :
nnoremap : ;
nnoremap Q  <Nop>
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>

xnoremap ; :
xnoremap : ;
vnoremap ; :
vnoremap : ;

autocmd BufReadPost quickfix nnoremap <buffer> <cr> <cr>

" Goddammned typos.
command W :w
command Q :q
command Wq :wq
command Qa :qa
command Wsudo :w ! sudo tee %


" Plugins 101
noremap <F3> :NERDTreeToggle<cr>
noremap <F4> :NERDTreeMirror<cr>
noremap <F2> :TagbarToggle<cr>

" Leader-based tab stuff can stay... for now.
nnoremap <silent> <leader>th :tabp<cr>
nnoremap <silent> <leader>tl :tabn<cr>
nnoremap <silent> <leader>tj :tabr<cr>
nnoremap <silent> <leader>tk :tabl<cr>
nnoremap <silent> <leader>tmh :tabm -1<cr>
nnoremap <silent> <leader>tml :tabm +1<cr>
nnoremap <silent> <leader>tmj :tabm 0<cr>
nnoremap <silent> <leader>tmk :tabm<cr>
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tq :tabclose<cr>
nnoremap <silent> <leader>] :tabn<cr>
nnoremap <silent> <leader>[ :tabp<cr>

" Projects
nnoremap <silent> <leader>pp :OpenSession<cr>
nnoremap <silent> <leader>pP :OpenSession!<cr>
nnoremap <silent> <leader>ps :SaveSession<cr>
nnoremap <silent> <leader>pt :OpenTabSession<cr>
nnoremap <silent> <leader>pT :OpenTabSession!<cr>
nnoremap <silent> <leader>pb :SaveTabSession<cr>

" Where do you go when you have no <Escape>?
inoremap jj <Esc>
" inoremap jk <Esc>
" inoremap kj <Esc>
" inoremap kk <Esc>

" Window stuff
" nnoremap <leader>wh <C-w>h
" nnoremap <leader>wl <C-w>l
" nnoremap <leader>wj <C-w>j
" nnoremap <leader>wk <C-w>k
" nnoremap <leader>wo <C-w>o
" nnoremap <leader>wr <C-w>r
" nnoremap <leader>wmh <C-w>H
" nnoremap <leader>wml <C-w>L
" nnoremap <leader>wmj <C-w>J
" nnoremap <leader>wmk <C-w>K
nnoremap <silent> <leader>a <C-w>h
nnoremap <silent> <leader>w <C-w>k
nnoremap <silent> <leader>s <C-w>j
nnoremap <silent> <leader>d <C-w>l
nnoremap <silent> <leader>k <C-w>h
nnoremap <silent> <leader>o <C-w>k
nnoremap <silent> <leader>l <C-w>j
nnoremap <silent> <leader>; <C-w>l
nnoremap <silent> <leader><left> <C-w>h
nnoremap <silent> <leader><up> <C-w>k
nnoremap <silent> <leader><down> <C-w>j
nnoremap <silent> <leader><right> <C-w>l
nnoremap <silent> <leader>q <C-w>q
nnoremap <silent> <leader>r <C-w>r
nnoremap <silent> <leader>A <C-w>H
nnoremap <silent> <leader>W <C-w>K
nnoremap <silent> <leader>S <C-w>J
nnoremap <silent> <leader>D <C-w>L

nnoremap = <C-w>+
nnoremap ;; ==
nnoremap - <C-w>-
nnoremap + <C-w>>
nnoremap _ <C-w><
nnoremap <C-q> <C-w>q

" Terminal stuff
tnoremap <Esc><Esc> <c-\><c-n><c-w><c-p>
tnoremap <c-\><c-\> <c-\><c-n>
" tnoremap <c-\><c-n> <Esc>

au BufWinEnter,WinEnter term://* startinsert

" Window shortcuts
if g:IsOSX == 1
    " On the Mac, C-arrows are mapped to desktop switching. In order to keep
    " coherence, switch all window shortcuts to Option instead.
    nnoremap <m-up> <c-w>k
    nnoremap <m-down> <c-w>j
    nnoremap <m-left> <c-w>h
    nnoremap <m-right> <c-w>l
    nnoremap <m-s-up> <c-w>K
    nnoremap <m-s-down> <c-w>J
    nnoremap <m-s-left> <c-w>H
    nnoremap <m-s-right> <c-w>L
else
    nnoremap <c-up> <c-w>k
    nnoremap <c-down> <c-w>j
    nnoremap <c-left> <c-w>h
    nnoremap <c-right> <c-w>l
    nnoremap <c-s-up> <c-w>K
    nnoremap <c-s-down> <c-w>J
    nnoremap <c-s-left> <c-w>H
    nnoremap <c-s-right> <c-w>L
endif

" File stuff
" nnoremap <leader>ff :find *
" nnoremap <leader>fF :find <C-R>=expand('%:h').'/*'<CR>
" nnoremap <leader>fs :sfind *
" nnoremap <leader>fS :sfind <C-R>=expand('%:h').'/*'<CR>
" nnoremap <leader>fv :vert sfind *
" nnoremap <leader>fV :vert sfind <C-R>=expand('%:h').'/*'<CR>

" Buffer stuff
nnoremap <silent> <leader>bn :new<cr>
" buffer quit - first go to last buffer, then unload the buffer you were on
nnoremap <silent> <leader>bq :b #<cr>:bd #<cr>
nnoremap <silent> <leader>bw :b #<cr>:bw #<cr>
" buffer destroy - destroy this buffer altogether (bad idea?)
" nnoremap <silent> <leader>bd :bd<cr>
nnoremap <silent> <leader>bs :b #<cr>
nnoremap <silent> <leader>bg :<c-u>exec GoToBuffer(v:count)<cr>
nnoremap <silent> <leader>bl :bn<cr>
nnoremap <silent> <leader>bh :bp<cr>
nnoremap <silent> <leader>bj :bl<cr>
nnoremap <silent> <leader>bk :bf<cr>

" Buffer shortcuts
nnoremap <silent> <PageUp>   :bp<CR>
nnoremap <silent> <PageDown> :bn<CR>
nnoremap <silent> <F11>   :bp<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <leader>-   :bp<CR>
nnoremap <silent> <leader>= :bn<CR>
if g:IsOSX == 1
    nnoremap <a-d-left> :bp<cr>
    nnoremap <a-d-right> :bn<cr>
endif

" Fuzzy navigation
" nnoremap <silent> <leader>0 :CtrlPFunky<cr>
" nnoremap <silent> <leader>fw :exec 'CtrlPFunky' . expand('<cword>')<cr>
" nnoremap <silent> <leader>pf :CtrlP<cr>
" nnoremap <silent> <leader>bf :CtrlPBuffer<cr>

nnoremap <silent> <leader>0 :BTags<cr>
" nnoremap <silent> <leader>fw :exec 'CtrlPFunky' . expand('<cword>')<cr>
nnoremap <silent> <leader>pf :Files<cr>
nnoremap <silent> <leader>bf :Buffers<cr>

" Error management stuff
nnoremap <silent> <Leader>es :lop<CR>
nnoremap <silent> <Leader>ec :lcl<CR>
nnoremap <silent> <Leader>en :lnext<CR>
nnoremap <silent> <Leader>ep :lprev<CR>

" Writing stuff
nnoremap <silent> <leader>bww :<c-u>exec WriterBuffer()<cr>
nnoremap <silent> <leader>bwc :<c-u>exec UnWriterBuffer()<cr>

" Git stuff
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gps :Git push<cr>
nnoremap <silent> <leader>gpl :Git pull<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>

" Enter & Tab stuff
inoremap <expr> <cr> pumvisible() ? '<c-y>' : (delimitMate#ShouldJump() ? '<c-r>=delimitMate#JumpAny()<cr>' : '<cr>')
inoremap <m-cr> <c-r>=delimitMate#ExpandReturn()<cr>
inoremap <silent> <Tab> <c-r>=InsertModeTab()<cr>
inoremap <silent> <S-Tab> <c-r>=BackTab()<cr>
snoremap <silent> <Tab> <esc>:call InsertModeTab()<cr>
snoremap <silent> <S-Tab> <esc>:call BackTab()<cr>
inoremap <C-Tab> <c-r>="\<Tab>"<cr>
inoremap <C-S-Tab> <c-r>="\<S-Tab>"<cr>
inoremap <silent> <c-x><c-x> <c-r>=deoplete#mappings#manual_complete()<cr>

xnoremap <silent> <Tab> >gv
xnoremap <silent> <S-Tab> <gv
nnoremap <silent> <Tab> >>
nnoremap <silent> <S-Tab> <<

" Functions

function! GoToBuffer(count)
    if a:count == 0
        let buf_nr = InputChar() + 0
    else
        let buf_nr = a:count
    endif
    execute 'buffer ' . buf_nr
endfunction

function! InputChar()
    let c = getchar()
    return type(c) == type(0) ? nr2char(c) : c
endfunction

function! WriterBuffer()
    setlocal formatoptions=ant
    setlocal spell
    setlocal spelllang=pt
endfunction

function! UnWriterBuffer()
    setlocal formatoptions=jcroql
    setlocal nospell
    setlocal spelllang=en
endfunction

function! InsertModeTab()
    if pumvisible()
        " UltiSnips#ExpandSnippet()
        " if g:ulti_expand_res == 0
        call feedkeys("\<c-n>")
        " endif
    else
        call UltiSnips#ExpandSnippetOrJump()

        if g:ulti_expand_or_jump_res == 0
            if (&omnifunc == "")
                call deoplete#mappings#manual_complete()
            else
                call feedkeys("\<c-x>\<c-o>")
            endif
        endif
    endif

    return ""
endfunction

function! BackTab()
    if pumvisible()
        call feedkeys("\<c-p>")
    else
        call UltiSnips#JumpBackwards()
    endif

    return ""
endfunction

" Vim-Plug Plugins

let g:plugin_path = '~/.config/nvim/plugged'

call plug#begin(g:plugin_path)

" Vim improvements
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'benekastah/neomake'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'vim-scripts/closetag.vim'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'Shougo/echodoc.vim'

" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'dag/vim2hs'
Plug 'eagletmt/neco-ghc'
Plug 'Shougo/vimproc', { 'do': 'make -f make_unix.mak' }
Plug 'pbrisbin/vim-syntax-shakespeare'

" Rust
" Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Python
" Plug 'jmcantrell/vim-virtualenv'
Plug 'bps/vim-textobj-python'
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
" Plug 'zchee/deoplete-jedi'

" C/C++
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'zchee/deoplete-clang'

" Javascript
" Plug 'ternjs/tern_for_vim', { 'do': 'rm -rf node_modules && npm install && npm install https://github.com/angelozerr/tern-react' }
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'ryyppy/flow-vim-quickfix', {'on': [], 'do': 'yarn'}

" Go
" Plug 'fatih/vim-go'

" Colorschemes
" Plug 'tacahiroy/ctrlp-funky'
" Plug 'altercation/vim-colors-solarized'
" Plug 'frankier/neovim-colors-solarized-truecolor-only'
" Plug 'junegunn/seoul256.vim'
" Plug 'mkarmona/materialbox'
" Plug 'xero/sourcerer.vim'
" Plug 'fent/vim-frozen'
Plug 'https://github.com/morhetz/gruvbox'
" Plug 'jscappini/material.vim'
" Plug 'mkarmona/colorsbox'
" Plug 'baskerville/bubblegum'

" GUI
Plug 'equalsraf/neovim-qt', { 'rtp': 'src/gui/runtime' }

call plug#end()

" Options for plugins

" CtrlP
let g:ctrlp_arg_map = 0
let g:ctrlp_open_multiple_files = 'i'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_custom_ignore = { 'dir':  '\v([\/]\.(git|hg|svn)|node_modules|jspm_packages|bower_components|[_]?build|\.cabal_sandbox|\.egg-info|collected)$' }

" FZF

let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-h': 'split',
    \ 'ctrl-v': 'vsplit' }

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'custom_format'
let g:airline#extensions#tabline#show_buffers = 2
" let g:airline_theme = 'bubblegum'


" delimitMate
" let g:delimitMate_tab2exit = 0


" Tern
let g:tern_show_signature_in_pum = 1
let g:tern_show_argument_hints = 'on_move'
let $NODE_PATH = 'jspm_packages/npm:src:' . $NODE_PATH

" YCM
let g:ycm_key_invoke_completion = "<c-enter>"
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []

" Deoplete
let g:deoplete#enable_at_startup = 1

" JavaScript
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
let g:vim_jsx_pretty_colorful_config = 1

" Jedi
let g:deoplete#sources#jedi#show_docstring = 1

" Deoplete Clang

let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
let g:deoplete#sources#clang#clang_complete_database = './build/'

" UltiSnips
let g:UltiSnipsExpandTrigger="<s-enter>"
let g:UltiSnipsJumpForwardTrigger="<s-enter>"
let g:UltiSnipsJumpBackwardTrigger="<c-s-enter>"
let g:UltiSnipsListSnippets="<C-S-M-Tab>"
let g:UltiSnipsSnippetDirectories=['CustomSnips','UltiSnips']
let g:UltiSnipsRemoveSelectModeMappings = 0

" NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeMouseMode=2

" GHCMod
let g:ghcmod_ghc_options=['--make', '-fno-warn-tabs']

" Haskell
let g:haskell_tabular = 1
let g:necoghc_enable_detailed_browse = 1
let g:necoghc_use_stack = 1

" Neomake

let g:neomake_c_compdb_maker = {
    \ 'exe' : $HOME . '/.config/nvim/neomake-compdb-checker',
    \ 'args': ['%:p', 'build', '-fsyntax-only -Wall -Wextra'],
    \ 'errorformat':
        \ '%-G%f:%s:,' .
        \ '%f:%l:%c: %trror: %m,' .
        \ '%f:%l:%c: %tarning: %m,' .
        \ '%f:%l:%c: %m,'.
        \ '%f:%l: %trror: %m,'.
        \ '%f:%l: %tarning: %m,'.
        \ '%f:%l: %m',
    \ }

let g:neomake_cpp_compdb_maker = g:neomake_c_compdb_maker

let s:flow_vim_quickfix_path = g:plugin_path .
            \ '/flow-vim-quickfix/bin/flow-vim-quickfix'

let g:neomake_javascript_flowjson_maker = {
    \ 'exe': '/usr/bin/sh',
    \ 'args': ['-c', '/usr/bin/flow --json 2> /dev/null | ' .
    \ s:flow_vim_quickfix_path],
    \ 'errorformat': '%E%f:%l:%c\,%n: %m',
    \ 'cwd': '%:p:h',
    \ }

let g:neomake_jsx_flowjson_maker = g:neomake_javascript_flowjson_maker

let g:neomake_logfile=$HOME . '/neomake.log'
let g:neomake_open_list=0
let g:neomake_python_enabled_makers=['pylint']
" let g:neomake_rust_enabled_makers=['clippy']
let g:neomake_javascript_enabled_makers=['eslint', 'flowjson']
let g:neomake_jsx_enabled_makers=['eslint', 'flowjson']
let g:neomake_c_enabled_makers=['compdb', 'clangtidy']
let g:neomake_c_clangtidy_args=['-p ./build/']
let g:neomake_cpp_enabled_makers=['compdb', 'clangtidy']
let g:neomake_cpp_clangtidy_args=['-p ./build/']
let g:neomake_verbose = 1

au! BufEnter,BufWritePost *.js,*.jsx,*.py,*.hs,*.c,*.cpp,*.rs,*.go Neomake

" EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0

nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader><Leader>2 <Plug>(easymotion-overwin-f2)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
nmap <Leader><Leader>l <Plug>(easymotion-overwin-line)
nmap <Leader><Leader>t <Plug>(easymotion-bd-t)

" nmap <Leader><Leader>j <Plug>(easymotion-bd-j)
" nmap <Leader><Leader>k <Plug>(easymotion-bd-k)

" Emmet
let g:user_emmet_leader_key='<C-m>'

" Session
let g:session_autoload=0
let g:session_directory='~/.config/nvim/sessions'
let g:session_autosave = 'no'

" C/C++
let c_C99=1
let c_C99_warn=0
let c_cpp_warn=1
let c_ansi_typedefs=1
let c_ansi_constants=1
let c_posix=1
let c_math=1
let c_comment_strings=1
let c_comment_numbers=1
let c_comment_types=1
let c_comment_date_time=1
let g:cpp_use_qt = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" Tagbar
if g:IsOSX == 1
    let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
endif

let g:tagbar_width = 34
let g:tagbar_sort = 0

" LanguageClient

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'python': ['pyls'],
    \ 'javascript': ['javascript-typescript-langserver'],
    \ 'javascript-jsx': ['javascript-typescript-langserver'],
    \ 'jsx': ['javascript-typescript-langserver'],
    \ }

let g:LanguageClient_autoStart = 1

" Autocommands

" Haskell
au BufNewFile,BufRead,BufReadPost *.hs nmap <Leader>ht :GhcModType<CR>
au BufNewFile,BufRead,BufReadPost *.hs nmap <Leader>hp V:PointFree<CR>
au BufNewFile,BufRead,BufReadPost *.hs nmap <Leader>hr V:PointFree!<CR>
au BufNewFile,BufRead,BufReadPost *.hs nmap <Leader>hl :HLint<CR>
au BufNewFile,BufRead,BufReadPost *.hs nmap <Leader>hgl :GhcModLint<CR>
au BufNewFile,BufRead,BufReadPost *.hs set omnifunc=necoghc#omnifunc
" au BufNewFile,BufRead,BufReadPost *.hs setlocal expandtab

" CPP
" au BufNewFile,BufRead,BufReadPost *.cpp set syntax=cpp11_2
" au BufNewFile,BufRead,BufReadPost *.h set syntax=cpp11_2
au BufNewFile,BufRead,BufEnter *.cpp set omnifunc=""
au BufNewFile,BufRead,BufEnter *.c set omnifunc=""
au BufNewFile,BufRead,BufEnter *.h set omnifunc=""

" HTML
au BufNewFile,BufRead,BufReadPost *.html set filetype=htmldjango

" Markdown
au BufNewFile,BufRead,BufReadPost *.md set filetype=markdown

" SQL
au FileType sql set commentstring=--\ %s

if filereadable(expand("~/.nvimrc_local"))
    source ~/.nvimrc_local
endif

highlight clear Conceal

" Solarized
let g:solarized_termcolors=256


let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'medium'

colorscheme gruvbox


" let g:loaded_python3_provider = 1
