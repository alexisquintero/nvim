setlocal tags=.git/javascript-tags

noremap <leader>+ :!ctags -R -f ./.git/javascript-tags --languages=javascript .<CR>
