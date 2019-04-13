"set laststatus=2

set statusline=                                                      " clear the statusline for when vimrc is reloaded
set statusline+=%t\                                                  " file name
set statusline+=%2*%h%m%r%w%*\                                       " flags [Help, Modified, ReadOnly, Preview]
set statusline+=%{BufferTrail()}                                     " Buffer trail, local to window
set statusline+=%=                                                   " right align
set statusline+=[%{strlen(&ft)?&ft:'none'}\|                         " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}\|                        " encoding
set statusline+=%{&fileformat}]\                                     " file format
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\    " highlight
set statusline+=%-9.(%l/%L\ ㏑%c%V%)\ %<%P                           " offset
set statusline+=%#error#                                             " Error color
set statusline+=%{StatuslineTabWarning()}                            " Show mix indenting
set statusline+=%{StatuslineTrailingSpaceWarning()}                  " Show trailing spaces line
set statusline+=%*                                                   " End error color
set statusline+=%#warningmsg#                                        " Warning color
set statusline+=%{neomake#statusline#LoclistStatus()}                " Neomake errors
set statusline+=%*                                                   " End warning color
