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
Plug 'tpope/vim-fugitive' " Git Wrapper
Plug 'wesQ3/vim-windowswap' " Window swapper
Plug 'ryanoasis/vim-devicons' " Icons for NERDTree
Plug 'ludovicchabant/vim-gutentags' " Tags
Plug 'terryma/vim-smooth-scroll'

call plug#end()


" --------- IntelliSense --
" Remap keys for gotos
"
let g:gutentags_cache_dir = '~/.devtags'
""nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-python',
  \ 'coc-angular',
  \ 'coc-flutter',
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

:nmap <leader>sa :botright split<Cr>
:nmap <leader>vsa :botright vspli<Cr>

" ---------- Terminal Controls ----
:nmap <leader>vt :vsplit term://zsh<Cr>
:nmap <leader>ht :split term://zsh<Cr>
:tnoremap jj <C-\><C-n> " Exit Insert Mode

" --------- Smooth Scroll ----
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


" ---------- Basics ---------
set encoding=utf8
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set clipboard=unnamed
set autoindent
set number
set relativenumber
set incsearch " jump to search match as typing
set nohlsearch " don't highlight my searches
set ignorecase
set smartcase
set noswapfile
autocmd BufWritePre * %s/\s\+$//e "Auto-remove trailing whitespace on save

" ================ Git ==============================
" Git Blame
nnoremap <Leader>g :Gblame<Cr>

" --------- NERDTree ---------
:map <C-n> :NERDTreeFind<Cr>
let NERDTreeShowHidden=1 " show hidden files in NERDTree
set conceallevel=3 " to hide brackets on dev icons
let g:webdevicons_enable_airline_tabline = 1 " adding to vim-airline's tabline
let g:webdevicons_conceal_nerdtree_brackets = 1 " whether or not to show the nerdtree brackets around flags

" ---------- Theme ---------
" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
colorscheme gruvbox
syntax enable

