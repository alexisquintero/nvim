let g:neomake_fsc_maker = {
  \ 'errorformat':
    \ '%E%f:%l: error: %m,' .
    \ '%Z%p^,' .
    \ '%E%f:%l: error: %m,' .
    \ '%-C  %.%#,' .
    \ '%C%m,' .
    \ '%Z%p^,' .
    \ '%W%f:%l: warning: %m,' .
    \ '%Z%p^,' .
    \ '%-G%.%#'
  \ }

let g:neomake_sbt_maker = {
  \ 'exe': 'sbt',
  \ 'args': ['-Dsbt.log.noformat=true', 'compile'],
  \ 'append_file': 0,
  \ 'auto_enabled': 1,
  \ 'output_stream': 'stdout',
  \ 'errorformat':
    \ '%E[error]\ %f:%l:\ %m,' .
      \ '%-Z[error]\ %p^,' .
      \ '%-C[error]   %.%#,' .
      \ '%C[error]%m,' .
      \ '%-G%.%#'
\ }

"let g:neomake_scala_enabled_makers = ['fsc']
"let g:neomake_scala_enabled_makers = ['sbt']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = getcwd().'/node_modules/eslint/bin/eslint.js'

autocmd InsertLeave,TextChanged * update | Neomake
