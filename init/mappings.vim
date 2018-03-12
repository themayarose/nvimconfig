" Essential

let g:necoghc_debug = 1
nnoremap j gj
nnoremap k gk
nnoremap Y y$

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
noremap <F2> :TagbarToggle<cr>
noremap <F3> :NERDTreeToggle<cr>

" Leader-based tab stuff can stay... for now.
nnoremap <silent> <leader>tmh :tabm -1<cr>
nnoremap <silent> <leader>tml :tabm +1<cr>
nnoremap <silent> <leader>tmj :tabm 0<cr>
nnoremap <silent> <leader>tmk :tabm<cr>
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tq :tabclose<cr>
nnoremap <silent> <leader><pageup> :tabn<cr>
nnoremap <silent> <leader><pagedown> :tabp<cr>

nnoremap <silent> <c-s-pageup> <c-\><c-n>:tabp<cr>
nnoremap <silent> <c-s-pagedown> <c-\><c-n>:tabn<cr>

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
nnoremap <silent> <leader>bw :bw #<cr>
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
nnoremap <silent> <leader>0 :BTags<cr>
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

" Easymotion
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader><Leader>2 <Plug>(easymotion-overwin-f2)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
nmap <Leader><Leader>l <Plug>(easymotion-overwin-line)
nmap <Leader><Leader>t <Plug>(easymotion-bd-t)

