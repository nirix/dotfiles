set nocompatible
set encoding=utf-8
filetype off

set rtp+=~/.dotfiles/vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'myusuf3/numbers.vim'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'chriskempson/tomorrow-theme', { "rtp": "vim/" }
"Bundle 'mattn/emmet-vim'
Bundle 'rstacruz/sparkup', { "rtp": "vim/" }
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/powerline', { "rtp": "powerline/bindings/vim/" }

filetype plugin indent on
syntax on

" Start scrolling before window border
set scrolloff=4

" Enable mouse
set mouse=a

" Whitespace
set listchars=eol:$,tab:>-,trail:*,extends:>,precedes:<
set list

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Colour scheme
set t_Co=256
colorscheme Tomorrow-Night

" Powerline
set laststatus=2

" NeoComplCache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_min_syntax_length = 3
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"

" NERDTree
map <C-d> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
map <C-n> :NERDTreeMirror<CR>

" Line numbers
set number
let g:enable_numbers = 0

" Tabs
map <C-t><Left> :tabp<cr>
map <C-t><Right> :tabn<cr>

" Set filetypes
autocmd! BufRead,BufNewFile *.phtml set filetype=html
autocmd! BufRead,BufNewFile *.md    set filetype=markdown
autocmd! BufRead,BufNewFile Gemfile set filetype=ruby
