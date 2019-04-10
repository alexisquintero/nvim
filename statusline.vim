"Default %F%m%r%h%w%=(%{&ff}/%Y) (line %l/%L), col %c\

set statusline=                                                      " clear the statusline for when vimrc is reloaded
set statusline+=%t\                                                  " file name
set statusline+=%2*[%H%M%R%W]%*\                                     " flags [Help, Modified, ReadOnly, Preview]
set statusline+=%=                                                   " right align
set statusline+=[%{strlen(&ft)?&ft:'none'}\|                         " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}\|                        " encoding
set statusline+=%{&fileformat}]\                                     " file format
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\    " highlight
set statusline+=%-9.(%l,%c%V%)\ %<%P                                 " offset
set statusline+=%#error#                                             " Error color
set statusline+=%{StatuslineTabWarning()}                            " Show mix indenting
set statusline+=%{StatuslineTrailingSpaceWarning()}                  " Show trailing spaces line
set statusline+=%*                                                   " End error color
set statusline+=%#warningmsg#                                        " Warning color
set statusline+=%{neomake#statusline#LoclistStatus()}                " Neomake errors
set statusline+=%*                                                   " End warning color

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


"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction
