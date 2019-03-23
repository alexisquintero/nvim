setlocal tags=.git/scala-tags

noremap <leader>+ :!ctags -R -f ./.git/scala-tags --languages=scala .<CR>

autocmd BufWritePost * call Ensime_retypecheck()
