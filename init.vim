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

set scrolljump=5
set scrolloff=3

call plug#begin('~/.vim/plugged')

" golang
" Plug 'faith/vim-go'
" Plug 'nsf/gocode'

Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/LeaderF'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'spf13/vim-autoclose'
Plug 'tpope/vim-endwise'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/vim-slash'
Plug 'Shougo/echodoc.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'rhysd/clever-f.vim'

Plug 'voldikss/vim-floaterm'

Plug 'neoclide/coc.nvim'

Plug 'mileszs/ack.vim'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'APZelos/blamer.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'

call plug#end()

set background=dark

nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '>'
let g:ycm_warning_symbol = '*'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_python_binary_path = 'python2'
let g:ycm_global_ycm_extra_conf = './.ycm_extra_conf.py'

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
nnoremap <silent> <leader>t :LeaderfFunction!<cr>

" tabular
nmap <leader>a& :Tabularize /&<cr>
vmap <leader>a& :Tabularize /&<cr>
nmap <leader>a= :Tabularize /^[^=]*\zs=<cr>
vmap <leader>a= :Tabularize /^[^=]*\zs=<cr>
nmap <leader>a= :Tabularize /,<cr>
vmap <leader>a= :Tabularize /,<cr>
nmap <leader>a\| :Tabularize /\|<cr>
vmap <leader>a\| :Tabularize /\|<cr>


" airline
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" nerdtree
map <leader>n :NERDTreeToggle<cr>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0


" buffer
nnoremap <c-n> :bn<cr>
nnoremap <c-p> :bp<cr>
nnoremap <leader>d :bd<cr>
nnoremap <leader>D :bD<cr>

" incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" ack
nnoremap <leader>A :Ack!<space>

" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" easymotion
let g:EasyMotion_smartcase = 1

" echodoc
let g:echodoc_enable_at_startup = 1

" floaterm
map <leader>st :FloatermToggle<cr>
map <leader>sc :FloatermNew<cr>
map <leader>sd :FloatermKill<cr>
map <leader>sn :FloatermNext<cr>
map <leader>sp :FloatermPrev<cr>

map! <c-h> <left>
map! <c-j> <down>
map! <c-k> <up>
map! <c-l> <right>

" floaterm
map <leader>st :FloatermToggle<cr>
map <leader>sc :FloatermNew<cr>
map <leader>sd :FloatermKill<cr>
map <leader>sn :FloatermNext<cr>
map <leader>sp :FloatermPrev<cr>

map! <c-a> <left>
map! <c-s> <down>
map! <c-w> <up>
map! <c-d> <right>

colorscheme Atelier_EstuaryDark

lua require('rust-tools').setup({}) 
