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
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive' " Git Wrapper
Plug 'wesQ3/vim-windowswap' " Window swapper
Plug 'ryanoasis/vim-devicons' " Icons for NERDTree
"Plug 'ludovicchabant/vim-gutentags' " Tags
Plug 'terryma/vim-smooth-scroll'
Plug 'puremourning/vimspector' " Debugger

call plug#end()


" --------- IntelliSense --
" gives you a list for multiple defs and jumps immediately for single def
"noremap <C-]> g<C-]>

let g:gutentags_cache_dir = '~/.devtags'
" go to definition
nmap <silent> gd <Plug>(coc-definition)
" go to type definition
nmap <silent> gy <Plug>(coc-type-definition)
" go to implementation
nmap <silent> gi <Plug>(coc-implementation)
" display references
nmap <silent> gr <Plug>(coc-references)

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
  \ 'coc-tabnine',
  \ 'coc-rls'
  \ ]
" tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ---------- Debugger -------
let g:vimspector_enable_mappings = 'HUMAN'
"packadd! vimspector

" ---------- Custom Hotkeys -
let mapleader = "," " map leader key as ,
" jj -> exit insert mode
:imap jj <Esc>
" spacebar x2 -> types : to begin command
:nmap <Space><Space> :
" Search directory
" shift+p -> search file names some rules in .zshrc and .rgignore
:nmap <S-p> :Files<Cr>
" shift+f -> search in files
:nmap <S-f> :Ag<Cr>
" ,b -> Pulls up opened Buffers
:nmap <leader>b :Buffers<Cr>
" ,sa -> splits current buffer horizontally
:nmap <leader>sa :botright split<Cr>
" ,vsa -> splits current buffer vertically
:nmap <leader>vsa :botright vspli<Cr>

" ---------- Terminal Controls ----
" ,vt -> opens terminal in nvim split vertically
:nmap <leader>vt :vsplit term://zsh<Cr>
" ,ht -> opens terminal in nvim split horizontally
:nmap <leader>ht :split term://zsh<Cr>
" jj -> in terminal also exit insert mode
:tnoremap jj <C-\><C-n> " Exit Insert Mode

" --------- Smooth Scroll ----
"  ctrl+u -> smooth scroll half page up
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
"  ctrl+d -> smooth scroll half page down
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
"  ctrl+b -> smooth scroll full page up
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
"  ctrl+b -> smooth scroll full page down
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


" ---------- Basics ---------
set encoding=utf8
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
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
set autoread " refreshes changes if buffer opened was changed other places
autocmd BufWritePre * %s/\s\+$//e "Auto-remove trailing whitespace on save

" ================ Git ==============================
" ,g -> Opens Git Blame buffer
nnoremap <Leader>g :Gblame<Cr>
" ,gd -> opens git diff buffer for current buffer
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" --------- NERDTree ---------
autocmd vimenter * if !argc() | NERDTree | endif "open NERDTree by default
autocmd VimEnter * wincmd p "change focus away from NERDTree pane
" ctrl+n -> open NERDTree to current file's location
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

