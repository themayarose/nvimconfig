" fzf
runtime init/fzf.vim

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'custom_format'
let g:airline#extensions#tabline#show_buffers = 2
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

runtime init/airline-powerline.vim

let g:coq_settings = {
    \    'limits.idle_timeout': 0,
    \    'limits.completion_auto_timeout': 0.25,
    \    'limits.completion_manual_timeout': 6.0,
    \    'auto_start': 'shut-up',
    \    'clients.lsp.weight_adjust': 0.5
    \ }

if g:IsWin
    let g:omnisharp_path = "C:\\Users\\maya\\scoop\\apps\\omnisharp\\current\\OmniSharp.exe"
    let g:csharpls_path = "C:\\Users\\maya\\.dotnet\\tools\\csharp-ls.EXE"
    let g:netcoredbg = "C:\\Users\\maya\\scoop\\shims\\netcoredbg.EXE"
else
    let g:omnisharp_path = "/usr/bin/omnisharp"
    let g:csharpls_path = "/usr/bin/csharp-ls"
    let g:netcoredbg = "/usr/sbin/netcoredbg"
endif

lua <<EOF

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

vim.lsp.enable('rust_analyzer')
vim.lsp.enable('csharp_ls')

vim.lsp.config('csharp_ls',
    coq.lsp_ensure_capabilities {
        cmd = { vim.api.nvim_eval "csharpls_path" },
        enable_editorconfig_support = true,
        enable_ms_build_load_projects_on_demand = true,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
        sdk_include_prereleases = true,
        analyze_open_documents_only = false,
        root_dir = vim.fs.root(
            0,
            function (name, path)
                return name:match('%.slnx?$') ~= nil
            end
        ),
        on_attach = function(client, bufnr)
            if client.server_capabilities.signatureHelpProvider then
                require('lsp-overloads').setup(client, {
                    ui = {
                        border = _border
                    },
                    keymaps = {
                        close_signature = "<esc>"
                    },
                    display_automatically = true
                })
            end
        end
    }
)

require("csharpls_extended").buf_read_cmd_bind()

vim.lsp.config('rust_analyzer',
    coq.lsp_ensure_capabilities {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = true;
            }
        }
    }
)

-- DEBUG

local dap = require("dap")
local ui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

dap_virtual_text.setup()

ui.setup()

vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

dap.listeners.before.attach.dapui_config = function()
    ui.open()
end

dap.listeners.before.launch.dapui_config = function()
    ui.open()
end

dap.adapters.coreclr = function(cb, config)
    local path = vim.fn.getcwd() .. "\\netcoredbg.file.txt"
    local file = io.open(path)
    if not file then return nil end
    local program = file:read("*a"):gsub("\n[^\n]*$", "")
    file:close()
    print(program)
    cb({
        type = 'executable',
        command = vim.api.nvim_eval("netcoredbg"),
        args = {
            '--interpreter=vscode',
            '--',
            program
        },
        options = {
            externalTerminal = false,
        },
    })
end

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "netcoredbg",
        request = "launch",
        program = "",
        args = {},
        justMyCode = false,
        stopAtEntry = false,
        runInTerminal = false,
        logging = {
            moduleLoad = false,
            processExit = false,
        },
        cwd = function()
            return vim.fn.getcwd()
        end,
    },
}

dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
end


EOF



" JavaScript
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
let g:vim_jsx_pretty_colorful_config = 1

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
let g:neomake_logfile=$HOME . '/neomake.log'
let g:neomake_open_list=0
let g:neomake_verbose = 2
let g:airline#extensions#neomake#enabled = 1

" Neomake test
let s:spinner_index = 0
let s:active_spinners = 0
let s:spinner_states = ['|', '/', '--', '\', '|', '/', '--', '\']
let s:spinner_states = ['┤', '┘', '┴', '└', '├', '┌', '┬', '┐']
let s:spinner_states = ['←', '↖', '↑', '↗', '→', '↘', '↓', '↙']
let s:spinner_states = ['←', '↑', '→', '↓']
let s:spinner_states = ['d', 'q', 'p', 'b']
let s:spinner_states = ['.', 'o', 'O', '°', 'O', 'o', '.']
let s:spinner_states = ['■', '□', '▪', '▫', '▪', '□', '■']

function! StartSpinner()
    let b:show_spinner = 1
    let s:active_spinners += 1
    if s:active_spinners == 1
        let s:spinner_timer = timer_start(1000 / len(s:spinner_states), 'SpinSpinner', {'repeat': -1})
    endif
endfunction

function! StopSpinner()
    let b:show_spinner = 0
    let s:active_spinners -= 1
    if s:active_spinners == 0
        :call timer_stop(s:spinner_timer)
    endif
endfunction

function! SpinSpinner(timer)
    let s:spinner_index = float2nr(fmod(s:spinner_index + 1, len(s:spinner_states)))
    redraw
endfunction

function! SpinnerText()
    if get(b:, 'show_spinner', 0) == 0
        return " "
    endif

    return s:spinner_states[s:spinner_index]
endfunction

augroup neomake_hooks
    au!
    autocmd User NeomakeJobInit :call StartSpinner()
    autocmd User NeomakeJobInit :echom "Build started"
    autocmd User NeomakeFinished :call StopSpinner()
    autocmd User NeomakeFinished :echom "Build complete"
augroup END


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

let g:vista_executive_for = {
    \ 'cs': 'nvim_lsp',
    \ 'rs': 'nvim_lsp',
    \ }

if g:IsOSX
    let g:javalc_config = g:CONFIG_PATH . '/jdt/config_mac'
elseif g:IsWin
    let g:javalc_config = g:CONFIG_PATH . '/jdt/config_win'
else
    let g:javalc_config = g:CONFIG_PATH . '/jdt/config_linux'
endif


let g:float_preview#docked = 0

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


