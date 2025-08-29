call plug#begin(g:plugin_path)

" Code completion
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'Decodetalkers/csharpls-extended-lsp.nvim'
Plug 'Issafalcon/lsp-overloads.nvim'
Plug 'neomake/neomake'

" Debug
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nicholasmata/nvim-dap-cs'
Plug 'nvim-neotest/nvim-nio'
Plug 'theHamsta/nvim-dap-virtual-text'

if has('win32')
    Plug 'saul-marquez/nvim-dap-cs', { 'branch': 'feat/win-compatibility' }
else
    Plug 'nicholasmata/nvim-dap-cs'
end


" Interface modifications
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'equalsraf/neovim-qt', { 'rtp': 'src/gui/runtime' }

" Error checking
" Plug 'benekastah/neomake'

" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Editing aids
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
" Plug 'vim-scripts/closetag.vim'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'

" Extra features
Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'Shougo/echodoc.vim'
" Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

" Haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'dag/vim2hs'
Plug 'eagletmt/neco-ghc'

if g:IsWin
    Plug 'Shougo/vimproc'
else
    Plug 'Shougo/vimproc', { 'do': 'make -f make_unix.mak' }
endif

Plug 'pbrisbin/vim-syntax-shakespeare'

" Rust
Plug 'rust-lang/rust.vim'

" if g:IsWin
"     Plug 'autozimu/LanguageClient-neovim', {
"         \ 'branch': 'next',
"         \ 'do': '.\install.ps1'
"         \ }
" else
"     Plug 'autozimu/LanguageClient-neovim', {
"         \ 'branch': 'next',
"         \ 'do': './install.sh; ' . g:CONFIG_PATH . '/get_jdt.sh'
"         \ }
" endif

" Pony
" Plug 'dleonard0/pony-vim-syntax'

" Python
Plug 'bps/vim-textobj-python'
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
" Plug 'zchee/deoplete-jedi'

" C/C++
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'zchee/deoplete-clang'

" Javascript
" Plug 'ternjs/tern_for_vim', { 'do': 'rm -rf node_modules && npm install && npm install https://github.com/angelozerr/tern-react' }
" Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
" Plug 'jparise/vim-graphql'
" Plug 'mxw/vim-jsx'
" Plug 'MaxMEllon/vim-jsx-pretty'
" Plug 'ryyppy/flow-vim-quickfix', {'on': [], 'do': 'yarn'}

" Latex
Plug 'lervag/vimtex'

" Colorschemes
Plug 'https://github.com/morhetz/gruvbox'
" Plug 'altercation/vim-colors-solarized'
" Plug 'frankier/neovim-colors-solarized-truecolor-only'
" Plug 'junegunn/seoul256.vim'
" Plug 'mkarmona/materialbox'
" Plug 'fent/vim-frozen'
" Plug 'jscappini/material.vim'
" Plug 'mkarmona/colorsbox'
" Plug 'baskerville/bubblegum'
"

" Windows
if g:IsWin
    " Plug 'neoclide/coc.nvim', { 'branch': 'release' }
endif

Plug 'sheerun/vim-polyglot'

" Plug 'OmniSharp/omnisharp-vim'
" Plug 'nickspoons/vim-sharpenup'
" Plug 'dense-analysis/ale'
" Plug 'puremourning/vimspector'

Plug 'ncm2/float-preview.nvim'

call plug#end()
