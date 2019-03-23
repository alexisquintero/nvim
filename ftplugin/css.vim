setlocal iskeyword+=-
setlocal tags =.git/css-tags

let g:gutentags_ctags_tagfile = getcwd().'/.git/css-tags'
let g:gutentags_ctags_extra_args = ['--languages=css']

noremap <leader>+ :!ctags -R -f ./.git/css-tags --languages=css .<CR>
