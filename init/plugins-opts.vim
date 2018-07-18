" fzf
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_COMMAND = 'ag -g "" --ignore node_modules --ignore flow-typed --ignore lib --ignore __pycache__ --skip-vcs-ignores'

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'custom_format'
let g:airline#extensions#tabline#show_buffers = 2

if exists('g:GtkGuiLoaded')
    runtime init/airline-powerline.vim
endif


" delimitMate
" let g:delimitMate_tab2exit = 0

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('complete_method', 'omnifunc')

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
let NERDTreeWinPos="right"
let NERDTreeWinSize=33

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

let g:flow_vim_quickfix_path = g:plugin_path .
            \ '/flow-vim-quickfix/bin/flow-vim-quickfix'

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

" EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0

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

" Vimtex
let g:vimtex_compiler_latexmk = {
    \ 'backend': 'nvim',
    \ 'background': 1,
    \ 'build_dir': '../build',
    \ 'callback': 1,
    \ 'continuous': 1,
    \ 'executable': 'latexmk',
    \}
let g:vimtex_view_method = 'mupdf'
let g:vimtex_compiler_progname = 'nvr'

let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex'
    \ 'pdflatex'         : '-pdf'
    \ 'lualatex'         : '-lualatex'
    \ 'xelatex'          : '-xelatex'
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec'
    \ 'context (luatex)' : '-pdf -pdflatex=context'
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx'''
    \}

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
let g:vimtex_quickfix_mode = 0

augroup latexSurround
    autocmd!
    autocmd FileType tex call s:latexSurround()
augroup END

function! s:latexSurround()
    let b:surround_{char2nr("e")}
    \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
    let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
endfunction

" Tagbar
if g:IsOSX == 1
    let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
endif

let g:tagbar_width = 33
let g:tagbar_sort = 0

if g:IsOSX
    let g:javalc_config = '~/.config/nvim/jdt/config_mac'
else
    let g:javalc_config = '~/.config/nvim/jdt/config_linux'
endif


" LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['flow-language-server', '--stdio', '--no-auto-download',
        \ '--flow-path=/home/' . $LOGNAME . '/.yarn/bin/flow'],
    \ 'javascript-jsx': ['flow-language-server', '--stdio', '--no-auto-download',
        \ '--try-flow-bin'],
    \ 'jsx': ['flow-language-server', '--stdio', '--no-auto-download',
        \ '--try-flow-bin'],
    \ 'java': ['java',
        \   '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044',
        \   '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        \   '-Dosgi.bundles.defaultStartLevel=4',
        \   '-Declipse.product=org.eclipse.jdt.ls.core.product',
        \   '-Dlog.protocol=true',
        \   '-Dlog.level=ALL',
        \   '-noverify',
        \   '-Xmx1G',
        \   '-jar', '~/.config/nvim/jdt/plugins/launcher.jar',
        \   '-configuration', g:javalc_config,
        \   '-data', '~/Development'
        \ ],
    \ }
    "\ 'python': ['pyls'],

let g:LanguageClient_autoStart = 1

" Gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'medium'

colorscheme gruvbox

