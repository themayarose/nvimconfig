function! neomake#makers#flowjson#flowjson()
    " let l:flow_cmd = GetBufferNodeExecutable('flow')
    let l:flow_cmd = '/home/' . $LOGNAME . '/.yarn/bin/flow'

    return {
    \ 'exe': '/usr/bin/sh',
    \ 'args': ['-c', l:flow_cmd . ' --json 2> /dev/null | ' .
    \ g:flow_vim_quickfix_path],
    \ 'errorformat': '%E%f:%l:%c\,%n: %m',
    \ 'cwd': '%:p:h',
    \ }
endfunction
