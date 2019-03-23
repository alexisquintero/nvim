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

runtime pluginsettings/netrw.vim
runtime pluginsettings/neomake.vim
runtime pluginsettings/airline.vim
runtime pluginsettings/oceanic-next.vim
runtime pluginsettings/rainbow_parentheses.vim
runtime pluginsettings/fzf.vim
runtime pluginsettings/vim-cool.vim
runtime pluginsettings/ensime.vim
runtime pluginsettings/deoplete.vim
