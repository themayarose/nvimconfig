let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

let s:fzfs_ignores = [
    \ "node_modules",
    \ "flow-typed",
    \ "lib",
    \ "__pycache__"
    \ ]

let s:fzfs_options = [
    \ "--skip-vcs-ignores"
    \ ]

function MakeFzf(restrict, ignores)
    let l:restrict = "\"" . a:restrict . "\""

    let l:ignores = " --ignore " .
        \ join(s:fzfs_ignores + a:ignores, " --ignore ") . " "
    let l:options = "-g " . l:restrict . l:ignores . join(s:fzfs_options, " ")

    return "ag " . l:options
endfunction

function BuildList(...)
    return a:000
endfunction

function MakeFzfWrapper(...)
    let l:restrict = a:1
    let l:ignores = a:000[1:-1]

    return MakeFzf(l:restrict, l:ignores)
endfunction

command! -nargs=1 FzfR let $FZF_DEFAULT_COMMAND=MakeFzf(<f-args>, [])
command! -nargs=+ FzfI let $FZF_DEFAULT_COMMAND=MakeFzf("", BuildList(<f-args>))
command! -nargs=+ FzfRI let $FZF_DEFAULT_COMMAND=MakeFzfWrapper(<f-args>)

let $FZF_DEFAULT_COMMAND = MakeFzf("", [])

