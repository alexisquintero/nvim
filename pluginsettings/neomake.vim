let s:neomake_fsc_maker = {
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

let s:neomake_sbt_maker = {
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

"let s:neomake_scala_enabled_makers = ['fsc']
"let s:neomake_scala_enabled_makers = ['sbt']
let s:neomake_javascript_enabled_makers = ['eslint']
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let s:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
