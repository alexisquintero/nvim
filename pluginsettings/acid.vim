let g:acid_no_default_keymappings = 1

nmap <silent> <Leader>K      <Plug>(acid-docs)
nmap <silent> <Leader><C-c>x <Plug>(acid-eval-cmdline)
imap <silent> <Leader><C-c>x <Plug>(acid-eval-cmdline)
nmap <silent> <Leader>cp     <Plug>(acid-motion-op)
nmap <silent> <Leader>cl     <Plug>(acid-eval-expr)
nmap <silent> <Leader>cqp    <Plug>(acid-eval-print)
