let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

filetype plugin indent on
syntax on

silent !mkdir -p ~/.vim/private/directory > /dev/null 2>&1
silent !mkdir -p ~/.vim/private/undo      > /dev/null 2>&1

runtime settings.vim
runtime mappings.vim
runtime plugins.vim
runtime statusline.vim
runtime colorscheme.vim

colorscheme nord

runtime! pluginsettings/*.vim
