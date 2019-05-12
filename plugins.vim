if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'neomake/neomake'
Plug 'yuttie/comfortable-motion.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mhartington/oceanic-next'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'jvican/vim-scala', { 'for': 'scala' }
Plug 'gre/play2vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'RRethy/vim-hexokinase', { 'for': [ 'css', 'sass', 'less' ] }
Plug 'groenewege/vim-less', { 'for': [ 'sass', 'less' ] }
Plug 'tommcdo/vim-lion'
Plug 'romainl/vim-cool'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'mboughaba/i3config.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'ludovicchabant/vim-gutentags'
Plug 'rickhowe/diffchar.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'fholiveira/vim-clojure-static', { 'for': 'clojure', 'branch': 'hack-update'}
Plug 'clojure-vim/async-clj-highlight',  { 'for': 'clojure', 'branch': 'acid-autocmd' }
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'guns/vim-sexp',    {'for': 'clojure'}

if has('python')
  Plug 'Valloric/MatchTagAlways'
endif

call plug#end()
