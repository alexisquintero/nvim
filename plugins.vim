if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'romainl/vim-cool'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'guns/vim-sexp'
" Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-fireplace'
Plug 'meain/vim-printer'
Plug 'tpope/vim-rhubarb'
Plug 'arzg/vim-substrata'
call plug#end()
