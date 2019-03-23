setlocal tags=.git/javascript-tags

let g:gutentags_ctags_tagfile = getcwd().'/.git/javascript-tags'
let g:gutentags_ctags_extra_args = ['--language=javascript']

noremap <leader>+ :!ctags -R -f ./.git/javascript-tags --languages=javascript .<CR>
