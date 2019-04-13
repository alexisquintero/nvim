" Keeps trail of last 10 buffers visited in the same window
" Should add a mapping to freeze trailing temporarily
function BufferTrail()
    " Check varaibles defined
    if !exists('w:trail')
        let w:trail = []
    endif
    if !exists('w:trail_str')
        let w:trail_str = ''
    endif
    if !exists('w:freeze_trail')
        let w:freeze_trail = 0
    endif

    " If trail is frozen don't update statusline
    if w:freeze_trail
        let w:frozen_trail_str = '[*] '.w:trail_str
        return w:frozen_trail_str
    endif

    " Get current buffer number
    let w:current_buffer = ['['.bufnr('%').']']

    " Non empty trail
    if (len(w:trail) > 0)
        " Check if current buffer is same as last visited, i.e. changing windows
        if (w:current_buffer[0] != w:trail[0])
            let w:trail = w:current_buffer + w:trail
        endif
    " Empty trail
    else
        let w:trail = w:current_buffer
    endif

    " Only use last 10 buffers
    let w:trail_str = join(w:trail[0:9], ' ')

    return w:trail_str
endfunction

function ToggleTrailFunc()
    if !exists('w:freeze_trail')
        let w:freeze_trail = 0
    else
        let w:freeze_trail = !w:freeze_trail
    endif
    return
endfunction

command ToggleTrail :call ToggleTrailFunc()
