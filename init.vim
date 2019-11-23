call plug#begin('~/.config/nvim/bundle')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox' " Theme
Plug 'airblade/vim-gitgutter' " Gutter git highlighting
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator' " investigate this
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons' " Icons for NERDTree

call plug#end()

" NERDTree Mapping
:map <C-n> :NERDTreeFind<Cr>
let NERDTreeShowHidden=1 " show hidden files in NERDTree
set conceallevel=3 " to hide brackets on dev icons

" --------- IntelliSense --
" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
" tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" ---------- Custom Hotkeys -
let mapleader = ","
:imap jj <Esc>
:nmap <Space><Space> :
" Search directory
    " search file names some rules in .zshrc and .rgignore
    :nmap ++ :Files<Cr>
    " search in files
    :nmap -- :Ag<Cr>
    " Pulls up opened Buffers
    :nmap <leader>b :Buffers<Cr>



" ---------- Basics ---------
set clipboard=unnamed
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set number
set relativenumber
set incsearch " jump to search match as typing
set nohlsearch " don't highlight my searches
set ignorecase
set smartcase
set noswapfile


" ---------- Theme ---------
" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
colorscheme gruvbox
syntax enable



