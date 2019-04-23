setlocal tags=.git/scala-tags

let g:gutentags_ctags_tagfile = getcwd().'/.git/scala-tags'
let g:gutentags_ctags_extra_args = ['--languages=scala']

noremap <leader>+ :!ctags -R -f ./.git/scala-tags --languages=scala .<CR>
