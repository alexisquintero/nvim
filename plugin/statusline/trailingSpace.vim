"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        let b:trailing_space_line_number = search('\s\+$', 'nw')
        if b:trailing_space_line_number != 0
            let b:statusline_trailing_space_warning = '[\s '.b:trailing_space_line_number.']'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
