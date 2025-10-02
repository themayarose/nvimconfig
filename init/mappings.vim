" Essential

let g:necoghc_debug = 1
nnoremap j gj
nnoremap k gk
nnoremap Y y$

" Switches # and " for easier register access in international layouts
noremap " #
noremap # "
xnoremap " #
xnoremap # "
vnoremap " #
vnoremap # "

" Switches ; and :
nnoremap ; :
nnoremap : ;
xnoremap ; :
xnoremap : ;
vnoremap ; :
vnoremap : ;

" No accidental ex-mode
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
noremap <silent> <F2> :Vista!!<cr><c-w><c-p>
noremap <silent> <F3> :NERDTreeToggle<cr>
noremap <silent> <leader>sb :NERDTree<cr>:TagbarOpen<cr><c-w>J<c-w>k<c-w>H:exe "vertical resize " . (&co - 33)<cr><c-w>l<c-w>r<c-w>h

" if exists('g:GtkGuiLoaded')
"     noremap <silent> <F4> :call rpcnotify(1, 'Gui', 'Command', 'ToggleSidebar')<cr>
" endif

" Leader-based tab stuff can stay... for now.
" nnoremap <silent> <leader>tmh :tabm -1<cr>
" nnoremap <silent> <leader>tml :tabm +1<cr>
" nnoremap <silent> <leader>tmj :tabm 0<cr>
" nnoremap <silent> <leader>tmk :tabm<cr>
" nnoremap <silent> <leader>tn :tabnew<cr>
" nnoremap <silent> <leader>tq :tabclose<cr>
" nnoremap <silent> <leader><pageup> :tabn<cr>
" nnoremap <silent> <leader><pagedown> :tabp<cr>
" nnoremap <silent> <leader>] :tabn<cr>
" nnoremap <silent> <leader>[ :tabp<cr>

nnoremap <silent> <c-s-pageup> <c-\><c-n>:tabp<cr>
nnoremap <silent> <c-s-pagedown> <c-\><c-n>:tabn<cr>

if has('win32')
    nnoremap <silent> <leader>t :vsp \| term pwsh -nol<cr>
    nnoremap <silent> <leader>T :sp \| term pwsh -nol<cr>
    nnoremap <silent> <leader><m-t> :vsp \| term wsl --distribution-id {4fecb98a-3f8f-46db-943b-c9798f59bee7} --cd ~ -e zsh<cr>
    nnoremap <silent> <leader><m-T> :sp \| term wsl --distribution-id {4fecb98a-3f8f-46db-943b-c9798f59bee7} --cd ~ -e zsh<cr>
else
    nnoremap <silent> <leader>t :vsp \| term<cr>
    nnoremap <silent> <leader>T :sp \| term<cr>
endif

" Projects
nnoremap <silent> <leader>pp :OpenSession<cr>
nnoremap <silent> <leader>pP :OpenSession!<cr>
nnoremap <silent> <leader>ps :SaveSession<cr>
nnoremap <silent> <leader>pt :OpenTabSession<cr>
nnoremap <silent> <leader>pT :OpenTabSession!<cr>
nnoremap <silent> <leader>pb :SaveTabSession<cr>

" Where do you go when you have no <Escape>?
inoremap jj <Esc>

" Window stuff
nnoremap <silent> <leader>a <C-w>h
nnoremap <silent> <leader>w <C-w>k
nnoremap <silent> <leader>s <C-w>j
nnoremap <silent> <leader>d <C-w>l
nnoremap <silent> <leader>q <C-w>q
nnoremap <silent> <leader>r <C-w>r
nnoremap <silent> <leader>A <C-w>H
nnoremap <silent> <leader>W <C-w>K
nnoremap <silent> <leader>S <C-w>J
nnoremap <silent> <leader>D <C-w>L
nnoremap <silent> <leader><space> :set ead=hor ea noea<cr>

nnoremap + <C-w>+
nnoremap - <C-w>-
nnoremap <c-+> <C-w>>
nnoremap <c--> <C-w><

" Terminal stuff
tnoremap <Esc><Esc> <c-\><c-n><c-w><c-p>
tnoremap <c-\><c-\> <c-\><c-n>
tnoremap <silent> <c-s-pageup> <c-\><c-n>:tabp<cr>
tnoremap <silent> <c-s-pagedown> <c-\><c-n>:tabn<cr>
tnoremap <silent> <c-left> <c-\><c-n><c-w>h
tnoremap <silent> <c-down> <c-\><c-n><c-w>j
tnoremap <silent> <c-up> <c-\><c-n><c-w>k
tnoremap <silent> <c-right> <c-\><c-n><c-w>l

" Buffer stuff
nnoremap <silent> <leader>bn :new<cr>
nnoremap <silent> <leader>bw :bp<cr>:bw #<cr>
nnoremap <silent> <leader>bs :b #<cr>
nnoremap <silent> <leader>bg :<c-u>exec GoToBuffer(v:count)<cr>
nnoremap <silent> <leader>bl :bn<cr>
nnoremap <silent> <leader>bh :bp<cr>
nnoremap <silent> <leader>bj :bl<cr>
nnoremap <silent> <leader>bk :bf<cr>

" Buffer shortcuts
nnoremap <silent> <leader>-   :bp<CR>
nnoremap <silent> <leader>= :bn<CR>

if g:IsOSX == 1
    nnoremap <a-d-left> :bp<cr>
    nnoremap <a-d-right> :bn<cr>
endif

" Fuzzy navigation
nnoremap <silent> <leader>0 :Vista finder<cr>
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
" inoremap <silent> <c-x><c-x> <c-r>=deoplete#mappings#manual_complete()<cr>

inoremap <s-tab> <Plug>delimitMateS-Tab

xnoremap <silent> <Tab> >gv
xnoremap <silent> <S-Tab> <gv
nnoremap <silent> <Tab> >>
nnoremap <silent> <S-Tab> <<

" Easymotion
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader><Leader>2 <Plug>(easymotion-overwin-f2)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
nmap <Leader><Leader>l <Plug>(easymotion-overwin-line)
nmap <Leader><Leader>t <Plug>(easymotion-bd-t)

" Completion

xnoremap <silent> <leader>/ :lua vim.lsp.buf.hover()<cr>
nnoremap <silent> <leader>/ :lua vim.lsp.buf.hover()<cr>
vnoremap <silent> <leader>/ :lua vim.lsp.buf.hover()<cr>
inoremap <silent> <C-_>     <cmd>LspOverloadsSignature<cr>
nnoremap <silent> <C-_>     <cmd>LspOverloadsSignature<cr>

nnoremap <silent> <leader><leader>d :lua vim.lsp.buf.definition()<cr>
nnoremap <silent> <leader><leader>a :lua vim.lsp.buf.code_action()<cr>
nnoremap <silent> <leader><leader>r :lua vim.lsp.buf.references()<cr>
nnoremap <silent> <leader><leader>? :lua vim.diagnostic.open_float()<cr>
nnoremap <silent> <leader><leader><f2> :lua vim.lsp.buf.rename()<cr>

" nnoremap <silent> <f7> :VimspectorReset<cr>
" xnoremap <silent> <f7> :VimspectorReset<cr>
" F5 <Plug>VimspectorContinue When debugging, continue. Otherwise start debugging.
" F3 <Plug>VimspectorStop Stop debugging.
" F4 <Plug>VimspectorRestart Restart debugging with the same configuration.
" F6 <Plug>VimspectorPause Pause debuggee.
" F9 <Plug>VimspectorToggleBreakpoint Toggle line breakpoint on the current line.
" <leader>F9 <Plug>VimspectorToggleConditionalBreakpoint Toggle conditional line breakpoint or logpoint on the current line.
" F8 <Plug>VimspectorAddFunctionBreakpoint Add a function breakpoint for the expression under cursor
" <leader>F8 <Plug>VimspectorRunToCursor Run to Cursor
" F10 <Plug>VimspectorStepOver Step Over
" F11 <Plug>VimspectorStepInto Step Into
" F12 <Plug>VimspectorStepOut Step out of current function scope
"
lua << EOF

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
-- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)

EOF
