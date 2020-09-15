let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

if &term =~ "st."
    let &t_SI.="\eP\e[5 q\e\\"
    let &t_EI.="\eP\e[1 q\e\\"
    let &t_te.="\eP\e[0 q\e\\"
else
    let &t_ti.="\<Esc>[1 q"
    let &t_SI.="\<Esc>[5 q"
    let &t_EI.="\<Esc>[1 q"
    let &t_te.="\<Esc>[0 q"
endif

filetype plugin indent on
syntax on

runtime settings.vim
runtime mappings.vim
runtime plugins.vim
" runtime pluginsettings/nord.vim

" colorscheme nord
colorscheme substrata

runtime pluginsettings/coc.vim
runtime pluginsettings/fzf.vim
runtime pluginsettings/gitgutter.vim
runtime pluginsettings/i3config.vim
runtime pluginsettings/netrw.vim
runtime pluginsettings/sandwich.vim
runtime pluginsettings/sexp.vim
runtime pluginsettings/targets.vim
runtime pluginsettings/vim-cool.vim
runtime pluginsettings/vim-scala.vim
runtime pluginsettings/vim-printer.vim
runtime pluginsettings/clojure-syntax.vim
