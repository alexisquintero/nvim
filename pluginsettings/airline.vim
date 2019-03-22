let s:airline#extensions#tabline#enabled = 1
let s:airline#extensions#tabline#formatter = 'unique_tail'
let s:airline_mode_map = {
  \ '__' : '-',
  \ 'c'  : 'C',
  \ 'i'  : 'I',
  \ 'ic' : 'I',
  \ 'ix' : 'I',
  \ 'n'  : 'N',
  \ 'ni' : 'N',
  \ 'no' : 'N',
  \ 'R'  : 'R',
  \ 'Rv' : 'R',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ ' '  : 'S',
  \ 't'  : 'T',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ ''   : 'V',
  \ }
let s:airline#extensions#tabline#buffers_label = 'b'
let s:airline#extensions#tabline#tabs_label = 't'
let s:airline_extensions = ['whitespace', 'neomake']
let s:airline_theme='oceanicnext'

autocmd VimEnter * call AirlineInit()
