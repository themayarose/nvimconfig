function! GoToBuffer(count)
    " Simple function to go to specific buffer.

    if a:count == 0
        let buf_nr = InputChar() + 0
    else
        let buf_nr = a:count
    endif
    execute 'buffer ' . buf_nr
endfunction

function! InputChar()
    " Gets a single-digit number from keyboard
    let c = getchar()
    return type(c) == type(0) ? nr2char(c) : c
endfunction

function! WriterBuffer()
    " Change current buffer to write mode.
    setlocal formatoptions=ant
    setlocal spell
    setlocal spelllang=pt
endfunction

function! UnWriterBuffer()
    " Change current buffer to code mode.
    setlocal formatoptions=jcroql
    setlocal nospell
    setlocal spelllang=en
endfunction

function! InsertModeTab()
    " Custom handling of tabs.
    if pumvisible()
        call feedkeys("\<c-n>")
    else
        call UltiSnips#ExpandSnippetOrJump()

        if g:ulti_expand_or_jump_res == 0
            if (&omnifunc == "")
                call deoplete#mappings#manual_complete()
            else
                call feedkeys("\<c-x>\<c-o>")
            endif
        endif
    endif

    return ""
endfunction

function! BackTab()
    " Shift-tab handling.
    if pumvisible()
        call feedkeys("\<c-p>")
    else
        call UltiSnips#JumpBackwards()
    endif

    return ""
endfunction


function SearchUpwardFile(path, filename, ...)
    let l:fallback = (a:0 > 0) ? a:1 : '/usr/bin/'
    let l:exec_path = ""
    let l:buffer_path = expand('%:p:h')

    while len(l:exec_path) == 0
        let l:candidate = l:buffer_path . '/' . a:path . a:filename

        if filereadable(l:candidate)
            let l:exec_path = l:candidate
        else
            let l:buffer_path = fnamemodify(l:buffer_path, ':h')

            if l:buffer_path == $HOME
                let l:candidate = l:fallback . a:filename

                if filereadable(l:candidate)
                    let l:exec_path = l:candidate
                else
                    break
                endif
            endif
        endif
    endwhile

    return l:exec_path
endfunction

function GetBufferNodeExecutable(filename)
    return SearchUpwardFile('node_modules/.bin/', a:filename)
endfunction
