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

function MakeFzf(...)
    if a:0 > 0
        let l:restrict = "\"" . a:1 . "\""
    else
        let l:restrict = "\"\""
    endif

    let l:ignores = " --ignore " . join(s:fzfs_ignores, " --ignore ") . " "
    let l:options = "-g " . l:restrict . l:ignores . join(s:fzfs_options, " ")

    return "ag " . l:options
endfunction

command! -nargs=? Fzf let $FZF_DEFAULT_COMMAND=MakeFzf(<f-args>)

let $FZF_DEFAULT_COMMAND = MakeFzf()

