if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
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
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'groenewege/vim-less', { 'for': [ 'sass', 'less' ] }
Plug 'tommcdo/vim-lion'
Plug 'romainl/vim-cool'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'mboughaba/i3config.vim' "set ft=i3config
Plug 'qpkorr/vim-bufkill'

if has('python')
  Plug 'Valloric/MatchTagAlways'
endif

if has('python3')
  Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
endif

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
elseif has('python3')
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
endif
call plug#end()
