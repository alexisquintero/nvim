set laststatus=2

set statusline=                                                " clear the statusline for when vimrc is reloaded
set statusline=%#StatusLineTerm#                               " File name color
set statusline+=\ %t\                                          " file name
set statusline+=%2*%h%m%r%w%*\                                 " flags [Help, Modified, ReadOnly, Preview]
set statusline+=%#StatusLineTermNC#                            " Main area color
set statusline+=%{BufferTrail()}                               " Buffer trail, local to window
set statusline+=%=                                             " right align
set statusline+=%#StatusLineTerm#                              " Regular statusline color
set statusline+=[%{strlen(&ft)?&ft:'none'}\|                   " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}\|                  " encoding
set statusline+=%{&fileformat}]\                               " file format
set statusline+=%-9.(%l/%L\ ㏑%c%V%)\ %<%P\                    " offset
set statusline+=%#Special#                                     " Random neomake ok color
set statusline+=%{NeomakeOk()}                                 " Neomake ok
set statusline+=%#NeomakeErrorSign#                            " Neomake error color
set statusline+=%{NeomakeErrors()}                             " Neomake errors
set statusline+=%#NeomakeWarningSign#                          " Neomake warning color
set statusline+=%{NeomakeWarnings()}                           " Neomake warnings
set statusline+=%#NeomakeInfoSign#                             " Neomake info color
set statusline+=%{NeomakeInfos()}                              " Neomake Infos
set statusline+=%#Todo#                                        " Random neomake jobs color
set statusline+=%{NeomakeJobs()}                               " Neomake jobs
set statusline+=%{coc#status()}                                " Coc statusline
set statusline+=%#error#                                       " Error color
set statusline+=%{StatuslineTrailingSpaceWarning()}            " Show trailing spaces line
set statusline+=%*                                             " End error color
