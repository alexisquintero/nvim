augroup neomake_hooks
    au!
    autocmd User NeomakeJobStarted :call NeomakeJobStartedStatusline()
    autocmd User NeomakeJobFinished :call NeomakeJobFinishedStatusline()
    autocmd BufEnter * :call NeomakeUpdateEWI()
augroup END

" Dictionary structure
" bufnr               0 for global
"   maker_name
"     active
"     errors
"     warnings
"     infos
"   total_errors
"   total_warnings
"   total_infos

function NeomakeJobFinishedStatusline()
    if !exists('g:neomake_jobs_dict')
        let g:neomake_jobs_dict = {}
    endif

    " 1 file mode, 0 project/directory mode
    if g:neomake_hook_context.jobinfo.file_mode
        let l:job_bufnr = g:neomake_hook_context.jobinfo.bufnr
    else
        let l:job_bufnr = 0
    endif

    if !exists('g:neomake_jobs_dict[l:job_bufnr]')
        let g:neomake_jobs_dict[l:job_bufnr] = {}
    endif

    let l:maker_name = g:neomake_hook_context.jobinfo.maker.name
    if exists('g:neomake_jobs_dict[l:job_bufnr][l:maker_name]')
        let g:neomake_jobs_dict[l:job_bufnr][l:maker_name] = {'active': 0}
    endif

    call NeomakeUpdateEWI()

    return
endfunction

function NeomakeJobStartedStatusline()
    if !exists('g:neomake_jobs_dict')
        let g:neomake_jobs_dict = {}
    endif

    " 1 file mode, 0 project/directory mode
    if g:neomake_hook_context.jobinfo.file_mode
        let l:job_bufnr = g:neomake_hook_context.jobinfo.bufnr
    else
        let l:job_bufnr = 0
    endif

    if !exists('g:neomake_jobs_dict[l:job_bufnr]')
        let g:neomake_jobs_dict[l:job_bufnr] = {}
    endif

    let l:maker_name = g:neomake_hook_context.jobinfo.maker.name
    if !exists('g:neomake_jobs_dict[l:job_bufnr][l:maker_name]')
        let g:neomake_jobs_dict[l:job_bufnr][l:maker_name] = {}
    endif
    let g:neomake_jobs_dict[l:job_bufnr][l:maker_name].active = 1

    return

endfunction

function NeomakeUpdateEWI()
    let l:bufnr = bufnr('%')
    if exists('g:neomake_jobs_dict[l:bufnr]')
        let b:neomake_ok_symbol = ' √ '
    else
        return
    endif
    " Get information
    let b:neomake_status = neomake#statusline#get(l:bufnr)

    let b:neomake_status_split = split(b:neomake_status)
    let b:neomake_status_split_filter = filter(b:neomake_status_split, {idx, val -> '%' != val[0]})

    let b:neomake_errors = ''
    let b:neomake_warnings = ''
    let b:neomake_infos = ''
    if exists('g:neomake_jobs_dict[l:bufnr]')
        let b:neomake_ok_symbol = ' √ '
    endif

    for sp in b:neomake_status_split_filter
        let b:split = split(sp, ':')
        if (b:split[0] == 'E')
            let b:neomake_errors = b:split[1]
            let b:neomake_ok_symbol = ''
        endif
        if (b:split[0] == 'W')
            let b:neomake_warnings = b:split[1]
            let b:neomake_ok_symbol = ''
        endif
        if (b:split[0] == 'I')
            let b:neomake_infos = b:split[1]
            let b:neomake_ok_symbol = ''
        endif
    endfor

    return
endfunction

function NeomakeJobs()
    if !exists('g:neomake_jobs_dict')
        return ''
    else
        let g:neomake_active_jobs = ''
    endif

    " Check global jobs
    if exists('g:neomake_jobs_dict[0]')
        for [key, value] in items(g:neomake_jobs_dict[0])
            if exists('value.active')
                if value.active
                    let g:neomake_active_jobs .= key
                endif
            endif
        endfor
    endif

    let b:bufnr = bufnr('%')
    " Check local jobs
    if exists('g:neomake_jobs_dict[b:bufnr]')
        for [key, value] in items(g:neomake_jobs_dict[b:bufnr])
            if exists('value.active')
                if value.active
                    let g:neomake_active_jobs .= key
                endif
            endif
        endfor
    endif

    return g:neomake_active_jobs
endfunction

function NeomakeErrors()
    if !exists('b:neomake_errors')
        return ''
    endif
    if !len(b:neomake_errors)
        return ''
    endif
    let b:neomake_error_str = ' E:'.b:neomake_errors.' '
    return b:neomake_error_str
endfunction


function NeomakeWarnings()
    if !exists('b:neomake_warnings')
        return ''
    endif
    if !len(b:neomake_warnings)
        return ''
    endif
    let b:neomake_warning_str = ' W:'.b:neomake_warnings.' '
    return b:neomake_warning_str
endfunction

function NeomakeInfos()
    if !exists('b:neomake_infos')
        return ''
    endif
    if !len(b:neomake_infos)
        return ''
    endif
    let b:neomake_info_str = ' I:'.b:neomake_infos.' '
    return b:neomake_info_str
endfunction

function NeomakeOk()
    if !exists('b:neomake_ok_symbol')
        let b:neomake_ok_symbol = ''
    endif
    return b:neomake_ok_symbol
endfunction
