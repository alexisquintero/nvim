set laststatus=2

set statusline=                                                " clear the statusline for when vimrc is reloaded
set statusline=%#StatusLineTerm#                               " File name color
set statusline+=\ %t\                                          " file name
set statusline+=%2*%h%m%r%w%*\                                 " flags [Help, Modified, ReadOnly, Preview]
set statusline+=%#StatusLineTermNC#                            " Main area color
set statusline+=%=                                             " right align
set statusline+=%#StatusLineTerm#                              " Regular statusline color
set statusline+=[%{strlen(&ft)?&ft:'none'}\|                   " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}\|                  " encoding
set statusline+=%{&fileformat}]\                               " file format
set statusline+=㏑%c%V\ %L\                                    " offset
set statusline+=%{coc#status()}                                " Coc statusline
set statusline+=%#error#                                       " Error color
set statusline+=%{StatuslineTrailingSpaceWarning()}            " Show trailing spaces line
set statusline+=%*                                             " End error color
