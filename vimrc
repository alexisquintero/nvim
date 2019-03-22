filetype plugin indent on
syntax on

runtime macros/mathchit.vim

silent !mkdir ~/.vim/private           > /dev/null 2>&1
silent !mkdir ~/.vim/private/directory > /dev/null 2>&1
silent !mkdir ~/.vim/private/undo      > /dev/null 2>&1

au FocusGained * :checktime

runtime settings.vim

runtime mappings.vim

runtime plugins.vim

colorscheme OceanicNext
