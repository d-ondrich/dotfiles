" ================ David's Plugins ========================
" #PLUGINS {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
" Markdown
 Plug 'reedes/vim-pencil'
 Plug 'nelstrom/vim-markdown-folding'

" Git
 Plug 'jreybert/vimagit'
 Plug 'airblade/vim-gitgutter' " Git changes in gutter
 Plug 'tpope/vim-fugitive'

" Fuzzy Search
 Plug '/usr/local/opt/fzf' " brew install fzf brew install the_silver_searcher
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'

" Syntax Highlighting And Indentation For 100+ Languages
 Plug 'sheerun/vim-polyglot'
 Plug 'crusoexia/vim-javascript-lib'
 Plug 'Quramy/vim-js-pretty-template'
 Plug 'pangloss/vim-javascript'
 Plug 'leshill/vim-json'
 Plug 'ludovicchabant/vim-gutentags'
 Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}

" Appearance and Themes
 Plug 'morhetz/gruvbox'
 Plug 'itchyny/lightline.vim'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'crusoexia/vim-monokai'

" LSP Autocompletion & Intellisense
 Plug 'prabirshrestha/asyncomplete.vim'
 Plug 'prabirshrestha/async.vim'
 Plug 'prabirshrestha/vim-lsp'
 Plug 'prabirshrestha/asyncomplete-lsp.vim'
 Plug 'ryanolsonx/vim-lsp-javascript'
 Plug 'ryanolsonx/vim-lsp-python'
 Plug 'moll/vim-node'

" NERDtree
 Plug 'scrooloose/nerdtree'

" NERDcommenter
 Plug 'scrooloose/nerdcommenter'

" Utilities
 Plug 'airblade/vim-rooter'
 Plug 'moll/vim-bbye'
 Plug 'mattn/emmet-vim'
 Plug 'miyakogi/conoline.vim'
 Plug 'ervandew/supertab'
 Plug 'szw/vim-maximizer'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-repeat'
 Plug 'jiangmiao/auto-pairs'
 Plug 'godlygeek/tabular'
 Plug 'tpope/vim-unimpaired'
 Plug 'tpope/vim-vinegar'
 Plug 'tpope/vim-obsession'
 Plug 'gcmt/taboo.vim'
 Plug 'luochen1990/rainbow'
 call plug#end()
 "}}}
"============ Plugins End ============
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
"if filereadable(expand("~/.vimrc.before"))
 " source ~/.vimrc.before
"endif

" ================ General Config ====================

:imap jj <Esc>
:nmap <Space><Space> :
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim


" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" =============== AutoComplete =====================
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" ================ Colors ===========================
set t_Co=256   " This is may or may not needed.
let g:rainbow_active = 1 " Bracket colorizer
let g:javascript_plugin_flow = 1 " JS syntax highlighting
syntax on
" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=4
set tabstop=4
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
  " --------- Smooth Scroll ----
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" ================ Git ==============================
" Git Blame
nnoremap <Leader>g :Gblame

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
" Pulls up fuzzy git files search
":nmap F :GitFiles

" Search directory
" search file names some rules in .zshrc and .rgignore
:nmap <C-p> :Files<Cr>
" search in files
:nmap <C-f> :Ag<Cr>

" Pulls up opened Buffers
:nmap <leader>b :Buffers<Cr>

" Goes to defintion
:nmap <leader>d :LspDefinition<Cr>

" update 1000
" set updatetime=100
" autocmd CursorHold,CursorHoldI * update " Auto save

" NERDTree Mapping
  :map <C-n> :NERDTreeFind<Cr>
let NERDTreeShowHidden=1 " show hidden files in NERDTree

" ============= Errors ============================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ============== Commenting =======================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" ====================================================


 set t_Co=256
 syntax on
" set background=dark
" set termguicolors
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_number_column = 'bg1'
" colorscheme gruvbox "Need to be last

 " ---------- Theme ---------
" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
colorscheme gruvbox
syntax enable


autocmd BufWritePre * %s/\s\+$//e "Auto-remove trailing whitespace on save

 set number " Show Current Line number
 set relativenumber "Show Relative Line Number
 set clipboard=unnamed " Sync clipboards
 "}}}}}
