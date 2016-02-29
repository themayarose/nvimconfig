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
set noexpandtab
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
nnoremap <cr> :
nnoremap Q  <Nop>
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>

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
nnoremap <leader>th :tabp<cr>
nnoremap <leader>tl :tabn<cr>
nnoremap <leader>tj :tabr<cr>
nnoremap <leader>tk :tabl<cr>
nnoremap <leader>tmh :tabm -1<cr>
nnoremap <leader>tml :tabm +1<cr>
nnoremap <leader>tmj :tabm 0<cr>
nnoremap <leader>tmk :tabm<cr>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tq :tabclose<cr>

" Projects
nnoremap <silent> <leader>pp :OpenSession<cr>
nnoremap <silent> <leader>pP :OpenSession!<cr>
nnoremap <silent> <leader>ps :SaveSession<cr>
nnoremap <silent> <leader>pf :CtrlP<cr>

" Where do you go when you have no <Escape>?
inoremap jj <Esc>
" inoremap jk <Esc>
" inoremap kj <Esc>
" inoremap kk <Esc>

" Window stuff
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wq <C-w>q
nnoremap <leader>wo <C-w>o
nnoremap <leader>wr <C-w>r
nnoremap <leader>wmh <C-w>H
nnoremap <leader>wml <C-w>L
nnoremap <leader>wmj <C-w>J
nnoremap <leader>wmk <C-w>K
nnoremap = <C-w>+
nnoremap ;; ==
nnoremap - <C-w>-
nnoremap + <C-w>>
nnoremap _ <C-w><
nnoremap <C-q> <C-w>q

" Terminal stuff
tnoremap <Esc> <c-\><c-n><c-w><c-p>
tnoremap <c-\><c-\> <c-\><c-n>
tnoremap <c-\><c-n> <Esc>

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
nnoremap <leader>ff :find *
nnoremap <leader>fF :find <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>fs :sfind *
nnoremap <leader>fS :sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>fv :vert sfind *
nnoremap <leader>fV :vert sfind <C-R>=expand('%:h').'/*'<CR>

" Buffer stuff
nnoremap <silent> <leader>bn :new<cr>
" buffer quit - first go to last buffer, then unload the buffer you were on
nnoremap <silent> <leader>bq :b #<cr>:bd #<cr>
" buffer destroy - destroy this buffer altogether (bad idea?)
" nnoremap <silent> <leader>bd :bd<cr>
nnoremap <silent> <leader>bs :b #<cr>
nnoremap <silent> <leader>bg :<c-u>exec GoToBuffer(v:count)<cr>
nnoremap <silent> <leader>bf :CtrlPBuffer<cr>
nnoremap <leader>bl :bn<cr>
nnoremap <leader>bh :bp<cr>
nnoremap <leader>bj :bl<cr>
nnoremap <leader>bk :bf<cr>

" Buffer shortcuts
nnoremap <PageUp>   :bp<CR>
nnoremap <PageDown> :bn<CR>
nnoremap <F11>   :bp<CR>
nnoremap <F12> :bn<CR>
if g:IsOSX == 1
	nnoremap <a-d-left> :bp<cr>
	nnoremap <a-d-right> :bn<cr>
endif

" Symbol navigation
nnoremap <silent> <leader>sf :CtrlPFunky<cr>
nnoremap <silent> <leader>sw :exec 'CtrlPFunky' . expand('<cword>')<cr>

" Error management stuff
nnoremap <Leader>es :Errors<CR>
nnoremap <Leader>ec :lcl<CR>
nnoremap <Leader>en :lnext<CR>
nnoremap <Leader>ep :lprev<CR>

" Writing stuff
nnoremap <silent> <leader>bW+ :<c-u>exec WriterBuffer()<cr>
nnoremap <silent> <leader>bW_ :<c-u>exec UnWriterBuffer()<cr>
" nnoremap <silent> <leader>ss ea<c-x><c-s>
nnoremap <silent> <leader>bWA+ gggqG
nnoremap <silent> <leader>bWA_ vipJ

" Git stuff
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gps :Git push<cr>
nnoremap <silent> <leader>gpl :Git pull<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>

" Tab stuff
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<enter>"
inoremap <silent> <Tab> <c-r>=InsertModeTab()<cr>
inoremap <silent> <S-Tab> <c-r>=BackTab()<cr>
snoremap <silent> <Tab> <esc>:call InsertModeTab()<cr>
snoremap <silent> <S-Tab> <esc>:call BackTab()<cr>
inoremap <C-Tab> <c-r>="\<Tab>"<cr>
inoremap <C-S-Tab> <c-r>="\<S-Tab>"<cr>

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
	setlocal textwidth=80
	setlocal spell
	setlocal spelllang=pt
endfunction

function! UnWriterBuffer()
	setlocal formatoptions=croql
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
			call feedkeys("\<c-x>\<c-o>")
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

call plug#begin('~/.config/nvim/plugged')

" Vim improvements
" Plug 'Valloric/YouCompleteMe', { 'do': '/usr/bin/python2 install.py --clang-completer --system-libclang --system-boost' }
Plug 'Shougo/deoplete.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'closetag.vim'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'godlygeek/tabular'

" Haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'dag/vim2hs'
Plug 'ujihisa/neco-ghc'
Plug 'Shougo/vimproc', { 'do': 'make -f make_unix.mak' }
Plug 'bitc/lushtags'
Plug 'pbrisbin/vim-syntax-shakespeare'

" Rust
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'

" Python
Plug 'jmcantrell/vim-virtualenv'
Plug 'bps/vim-textobj-python'
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'davidhalter/jedi-vim'

" C/C++
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Rip-Rip/clang_complete', { 'do': 'make' }

" Javascript
Plug 'ternjs/tern_for_vim', { 'do': 'rm -rf node_modules && npm install && npm install https://github.com/angelozerr/tern-react' }
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Plug 'lukaszkorecki/CoffeeTags'
" Plug 'othree/yajs.vim'

" Go
Plug 'fatih/vim-go'

" Colorschemes
Plug 'tacahiroy/ctrlp-funky'
" Plug 'altercation/vim-colors-solarized'
" Plug 'frankier/neovim-colors-solarized-truecolor-only'
" Plug 'junegunn/seoul256.vim'
Plug 'mkarmona/materialbox'
Plug 'xero/sourcerer.vim'
Plug 'fent/vim-frozen'
Plug 'https://github.com/morhetz/gruvbox'
" Plug 'jscappini/material.vim'
" Plug 'mkarmona/colorsbox'
" Plug 'baskerville/bubblegum'

" Deactivated
" Plug 'dbext.vim'

call plug#end()

" Options for plugins

" CtrlP
let g:ctrlp_arg_map = 0
let g:ctrlp_open_multiple_files = 'i'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_custom_ignore = { 'dir':  '\v([\/]\.(git|hg|svn)|node_modules|jspm_packages|bower_components|[_]?build|\.cabal_sandbox)$' }

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'custom_format'
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
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'ultisnips', 'file', 'omni']
let g:deoplete#sources.javascript = ['buffer', 'ultisnips', 'file']
let g:deoplete#sources.jsx = ['buffer', 'ultisnips', 'file']
let g:deoplete#sources['javascript.jsx'] = ['buffer', 'ultisnips', 'file']
let g:deoplete#sources.haskell = ['buffer', 'ultisnips', 'file', 'ghc']
let g:deoplete#sources.rust = ['buffer', 'ultisnips', 'file', 'racer']
let g:deoplete#sources.text = ['buffer', 'ultisnips', 'file', 'omni', 'dictionary']
" Tern's perfomance is abysmal.

" JavaScript
let g:jsx_ext_required = 0

" Jedi
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0

" Clang Completer
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_default_keymappings = 0
let g:clang_use_library = 1"

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

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1
" let g:syntastic_python_checker_args="--ignore=E501,E225"
" let g:syntastic_python_checkers=["pyflakes"]
let g:syntastic_javascript_checkers=["eslint"]
" let g:syntastic_haskell_ghc_mod_args='-g -fno-warn-tabs'

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


" Autocommands

" Haskell
au BufNewFile,BufRead,BufReadPost *.hs nmap <Leader>ht :GhcModType<CR>
au BufNewFile,BufRead,BufReadPost *.hs nmap <Leader>hp V:PointFree<CR>
au BufNewFile,BufRead,BufReadPost *.hs nmap <Leader>hr V:PointFree!<CR>
au BufNewFile,BufRead,BufReadPost *.hs nmap <Leader>hl :HLint<CR>
au BufNewFile,BufRead,BufReadPost *.hs nmap <Leader>hgl :GhcModLint<CR>
au BufNewFile,BufRead,BufReadPost *.hs set omnifunc=necoghc#omnifunc
au BufNewFile,BufRead,BufReadPost *.hs setlocal expandtab

" CPP
" au BufNewFile,BufRead,BufReadPost *.cpp set syntax=cpp11_2
" au BufNewFile,BufRead,BufReadPost *.h set syntax=cpp11_2

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
