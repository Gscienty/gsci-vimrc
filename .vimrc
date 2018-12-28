let mapleader = ","
set nocompatible
filetype on
filetype plugin on
set noeb
syntax enable
syntax on
set t_Co=256
set cmdheight=2
set showcmd
set ruler
set laststatus=2
set number
set cursorline
set whichwrap+=<,>,h,l
set ttimeoutlen=0
set virtualedit=block,onemore

set autoindent
set cindent
set cinoptions=g0,:0,N-s,(0
set smartindent
filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set nowrap
set backspace=2
set sidescroll=10
set nofoldenable

set wildmenu
set completeopt-=preview

set hlsearch
set incsearch
set ignorecase

set nobackup
set noswapfile
set autoread
set autowrite
set confirm

set encoding=utf-8
set encoding=utf-8

call plug#begin('~/.vim/plugged')

Plug 'mbbill/undotree'
Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'

call plug#end()

nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" undotree
nnoremap <leader>u :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle=1

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '>'
let g:ycm_warning_symbol = '*'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_python_binary_path = 'python'

nnoremap <leader>o :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>O :YcmCompleter GoToDefinition<cr>
nnoremap <leader>i :YcmCompleter GoToInclude<cr>
nnoremap <leader>ff :YcmCompleter FixIt<cr>

" ctags
set tags+=/usr/include/tags
set tags+=~/.vim/systags
set tags+=~/.vim/x86_64-linux-gnu-systags
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.','re![_a-zA-z0-9]'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&',']']

" tagbar
nnoremap <silent> <leader>tt :TagbarToggle<cr>
