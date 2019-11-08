if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'yuttie/comfortable-motion.vim'
Plug 'airblade/vim-gitgutter'
Plug 'derekwyatt/vim-scala'
Plug 'gre/play2vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'groenewege/vim-less'
Plug 'tommcdo/vim-lion'
Plug 'romainl/vim-cool'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mboughaba/i3config.vim', { 'for': 'i3config' }
Plug 'qpkorr/vim-bufkill'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'guns/vim-sexp'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'
Plug 'wellle/targets.vim'
Plug 'itspriddle/vim-shellcheck'
Plug 'tpope/vim-fireplace'
Plug 'janko/vim-test'
Plug 'christoomey/vim-conflicted'
call plug#end()
