if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'romainl/vim-cool'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-fireplace'
Plug 'meain/vim-printer'
Plug 'tpope/vim-rhubarb'
Plug 'arzg/vim-substrata'
Plug 'neovim/nvim-lspconfig'
Plug 'scalameta/nvim-metals'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
call plug#end()
