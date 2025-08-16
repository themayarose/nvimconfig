" fzf
runtime init/fzf.vim

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'custom_format'
let g:airline#extensions#tabline#show_buffers = 2
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

if exists('g:GtkGuiLoaded')
    runtime init/airline-powerline.vim
endif

" COC
if g:IsWin
    let g:coc_global_extensions = [ 'coc-powershell' ]
endif

let g:coq_settings = {
    \    'limits.idle_timeout': 0,
    \    'limits.completion_auto_timeout': 6.0,
    \    'limits.completion_manual_timeout': 6.0,
    \    'auto_start': 'shut-up',
    \    'clients.lsp.weight_adjust': 0.5
    \ }

if g:IsWin
    let g:omnisharp_path = "C:\\Users\\maya\\scoop\\apps\\omnisharp\\current\\OmniSharp.exe"
else
    let g:omnisharp_path = "/usr/bin/omnisharp"
endif

if g:IsWin
    let g:csharpls_path = "C:\\Users\\maya\\.dotnet\\tools\\csharp-ls.EXE"
else
    let g:csharpls_path = "/usr/bin/csharp-ls"
endif

lua <<EOF

local lspconfig = require "lspconfig"
local coq = require "coq"

local _border = "rounded"

vim.diagnostic.config {
    signs = {
        severity = {
            min = vim.diagnostic.severity.WARN
        }
    },
    underline = {
        severity = {
            min = vim.diagnostic.severity.HINT
        }
    },
}


-- lspconfig.omnisharp.setup(
--     coq.lsp_ensure_capabilities {
--         cmd = { vim.api.nvim_eval "omnisharp_path" },
--         enable_editorconfig_support = true,
--         enable_ms_build_load_projects_on_demand = false,
--         enable_roslyn_analyzers = true,
--         organize_imports_on_format = true,
--         enable_import_completion = true,
--         sdk_include_prereleases = true,
--         analyze_open_documents_only = false,
--         on_attach = function(client, bufnr)
--             if client.server_capabilities.signatureHelpProvider then
--                 require('lsp-overloads').setup(client, {
--                     ui = {
--                         border = _border
--                     },
--                     keymaps = {
--                         close_signature = "<esc>"
--                     },
--                     display_automatically = false
--                 })
--             end
--         end
--     }
-- )

lspconfig.csharp_ls.setup(
    coq.lsp_ensure_capabilities {
        cmd = { vim.api.nvim_eval "csharpls_path" },
        enable_editorconfig_support = true,
        enable_ms_build_load_projects_on_demand = true,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
        sdk_include_prereleases = true,
        analyze_open_documents_only = true,
        on_attach = function(client, bufnr)
            if client.server_capabilities.signatureHelpProvider then
                require('lsp-overloads').setup(client, {
                    ui = {
                        border = _border
                    },
                    keymaps = {
                        close_signature = "<esc>"
                    },
                    display_automatically = false
                })
            end
        end
    }
)

require("csharpls_extended").buf_read_cmd_bind()


EOF



" JavaScript
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
let g:vim_jsx_pretty_colorful_config = 1

" Jedi
let g:deoplete#sources#jedi#show_docstring = 1

" Deoplete Clang
" let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
" let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
" let g:deoplete#sources#clang#clang_complete_database = './build/'

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
" let g:neomake_python_enabled_makers=['pylint']
" let g:neomake_rust_enabled_makers=['clippy']
let g:neomake_javascript_enabled_makers=['eslint'] ", 'flowjson']
let g:neomake_jsx_enabled_makers=['eslint'] ", 'flowjson']
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
let g:session_directory=g:CONFIG_PATH . '/sessions'
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
let g:tex_flavor = 'xelatex'

let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \ 'pdflatex'         : '-pdf',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}

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
if g:IsWin == 0
    let g:tagbar_ctags_bin = "/usr/bin/ctags"
endif

let g:tagbar_width = 33
let g:tagbar_sort = 0

if g:IsOSX
    let g:javalc_config = g:CONFIG_PATH . '/jdt/config_mac'
elseif g:IsWin
    let g:javalc_config = g:CONFIG_PATH . '/jdt/config_win'
else
    let g:javalc_config = g:CONFIG_PATH . '/jdt/config_linux'
endif


" LanguageClient
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"     \ 'javascript': ['flow-language-server', '--stdio', '--no-auto-download',
"         \ '--flow-path=' . $HOME . '/.yarn/bin/flow'],
"     \ 'java': ['java',
"         \   '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044',
"         \   '-Declipse.application=org.eclipse.jdt.ls.core.id1',
"         \   '-Dosgi.bundles.defaultStartLevel=4',
"         \   '-Declipse.product=org.eclipse.jdt.ls.core.product',
"         \   '-Dlog.protocol=true',
"         \   '-Dlog.level=ALL',
"         \   '-noverify',
"         \   '-Xmx1G',
"         \   '-jar', g:CONFIG_PATH . '/jdt/plugins/launcher.jar',
"         \   '-configuration', g:javalc_config,
"         \   '-data', '~/Development'
"         \ ],
"     \ 'python': ['pyls', '-v', '--log-file', '~/pyls.log'],
"     \ }
"     " \ 'javascript-jsx': ['flow-language-server', '--stdio', '--no-auto-download',
"     "     \ '--flow-path=/home/' . $LOGNAME . '/.yarn/bin/flow'],
"     " \ 'jsx': ['flow-language-server', '--stdio', '--no-auto-download',
"     "     \ '--flow-path=/home/' . $LOGNAME . '/.yarn/bin/flow'],

" let g:LanguageClient_settingsPath = $HOME . "/.config/nvim/lc_settings.json"
" let g:LanguageClient_loadSettings = 1
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_diagnosticsList = "Location"
" let g:LanguageClient_loggingFile = $HOME . "/.lc_log"
" let g:LanguageClient_windowLogMessageLevel = "Log"

" OmniSharp
let g:OmniSharp_server_use_net6 = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_selector_findusages = 'fzf'
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_diagnostic_overrides = {
    \ 'IDE0055': {'type': 'None'},
    \ 'IDE0160': {'type': 'None'},
    \ 'IDE0011': {'type': 'None'},
    \ 'IDE0008': {'type': 'None'},
    \ 'IDE0058': {'type': 'None'},
    \ 'IDE0046': {'type': 'None'},
    \ 'IDE0200': {'type': 'None'},
    \ 'IDE0022': {'type': 'None'},
    \ 'IDE0028': {'type': 'None'},
    \ 'IDE0045': {'type': 'None'},
    \ 'IDE0061': {'type': 'None'},
    \ 'IDE0021': {'type': 'None'},
    \ 'CA1310': {'type': 'None'},
    \ 'CA1822': {'type': 'None'},
    \ 'CA1305': {'type': 'None'},
    \ 'CA1304': {'type': 'None'},
    \ 'CA1311': {'type': 'None'},
    \ 'SYSLIB1045': {'type': 'None'},
    \}
let g:OmniSharp_diagnostic_showid = 1

let g:OmniSharp_popup_options = {
    \ 'winblend': 30,
    \ 'winhl': 'Normal:Normal,FloatBorder:Special',
    \ 'border': 'rounded'
    \}

let g:omnicomplete_fetch_full_documentation = 1

let g:sharpenup_codeactions_set_signcolumn=0
let g:sharpenup_map_prefix = '<leader>s'

let g:float_preview#docked = 0

let g:ale_linters = {
      \  'cs':['syntax', 'semantic', 'issues'],
      \ }

" VimSpector
let g:vimspector_enable_mappings = 'HUMAN'

" Gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard' " medium?
let g:gruvbox_transparent_bg = 1
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE

colorscheme gruvbox


