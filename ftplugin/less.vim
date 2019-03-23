setlocal iskeyword+=-
setlocal tags =.git/css-tags

noremap <leader>+ :!ctags -R -f ./.git/css-tags --languages=css .<CR>
