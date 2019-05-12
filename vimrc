filetype plugin indent on
syntax on

runtime macros/mathchit.vim

silent !mkdir -p ~/.vim/private/directory > /dev/null 2>&1
silent !mkdir -p ~/.vim/private/undo      > /dev/null 2>&1

autocmd FocusGained * :checktime

runtime settings.vim
runtime mappings.vim
runtime plugins.vim
runtime statusline.vim

colorscheme OceanicNext

runtime pluginsettings/netrw.vim
runtime pluginsettings/neomake.vim
runtime pluginsettings/oceanic-next.vim
runtime pluginsettings/rainbow_parentheses.vim
runtime pluginsettings/fzf.vim
runtime pluginsettings/vim-cool.vim
runtime pluginsettings/vim-gutentags.vim
runtime pluginsettings/coc.vim
runtime pluginsettings/i3config.vim
runtime pluginsettings/hexokinase.vim
runtime pluginsettings/iced.vim
runtime pluginsettings/sexp.vim
