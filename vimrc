" ============================================================================
" GENERAL SETTINGS
"
set nocompatible
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete
set backupskip=/tmp/*
set clipboard=unnamed
set pastetoggle=<F2>
set mouse=a
set tabline=%f
set guitablabel=%f

" Printer settings
set printoptions=number:n
set printoptions=header:0

" Leader setting"
let mapleader      = ','
let maplocalleader = '\'

" Add $ at the end of the change match
set cpoptions+=$

" Cursor line and column highlight
"set nocursorcolumn
"set nocursorline
set cursorline

" Disable parens matching.
"let loaded_matchparen = 1

let g:ctrlp_custom_ignore = {'dir': '\v[\/]\.(git|hg|svn|staging)$'}

" Whitespace
set listchars=eol:$,tab:>-,trail:*,extends:>,precedes:<
set list

" ============================================================================
" PLUGIN SETTINGS
"
let g:plug_url_format = 'git@github.com:%s.git'

call plug#begin('~/.vim/plugged')

" Languages and related
"Plug 'elzr/vim-json'
"Plug 'jelera/vim-javascript-syntax'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go'
Plug 'groenewege/vim-less'
Plug 'kchmck/vim-coffee-script'
Plug 'mattn/emmet-vim'
Plug 'noprompt/vim-yardoc'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" Other
"Plug 'vim-scripts/tComment'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'", {'on': 'SyntasticCheck'}
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

" Syntastic settings.
let g:syntastic_auto_loc_list  = 0
let g:syntastic_stl_format     = '[%E{Errors: %e, line %fe}%B{ | }'
let g:syntastic_stl_format    .= '%W{Warnings: %w, line %fw}]'

let g:syntastic_c_check_header          = 0
let g:syntastic_c_compiler_options      = ' -Wextra -Wall'
let g:syntastic_c_remove_include_errors = 1

let g:syntastic_cpp_compiler_options   = ' -Wextra -Wall -std=c++11'
let g:syntastic_javascript_jshint_args = '--config ~/.jshint'

" Airline
set laststatus=2
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Ignore syntax checking for Shell scripts as this is currently broken.
let g:syntastic_mode_map = {
  \ 'mode': 'passive',
  \ 'active_filetypes': ['c', 'javascript', 'coffee', 'cpp', 'rust']}

" Ruby linting
let g:syntastic_ruby_checkers = ['rubylint']

" UltiSnips settings.
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" NERDTree settings.
let NERDTreeShowBookmarks = 0
let NERDTreeIgnore        = ['\.pyc$', '\.pyo$', '__pycache__', '\.o$']

" ============================================================================
" SYNTAX SETTINGS
"
" Settings related to configuring the syntax features of Vim such as the text
" width, what theme to use and so on.
"
set textwidth=80
set nowrap
set number
set synmaxcol=256
set diffopt=filler,vertical
filetype plugin indent on
syntax on

" Colour scheme
set t_Co=256
colorscheme Tomorrow-Night

" colorcolumn doesn't work on slightly older versions of Vim.
if version >= 703
  set colorcolumn=80,120
endif

" Indentation settings
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" ============================================================================
" CUSTOM FUNCTIONS
"
" A collection of custom functions such as a function used for trimming
" trailing whitespace or converting a file's encoding to UTF-8.

" Removes trailing whitespace from the current buffer.
function! Trim()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//eg
  call cursor(l, c)
:endfunction

" ============================================================================
" HOOKS
"
" Collection of various hooks that have to be executed when a certain filetype
" is set or action is executed.

" Automatically strip trailing whitespace.
autocmd! BufWritePre * :call Trim()

" Set a few filetypes for some uncommon extensions
autocmd! BufRead,BufNewFile *.md     set filetype=markdown
autocmd! BufRead,BufNewFile Gemfile  set filetype=ruby
autocmd! BufRead,BufNewFile *.rake   set filetype=ruby
autocmd! BufRead,BufNewFile *.ru     set filetype=ruby
autocmd! BufRead,BufNewFile *.rs     set filetype=rust
autocmd! BufRead,BufNewFile *.rll    set filetype=rll
autocmd! BufRead,BufNewFile *.phtml  set filetype=html

" Taken from http://vim.wikia.com/wiki/Highlight_unwanted_spaces
autocmd BufWinEnter * match Visual /\s\+$/
autocmd InsertEnter * match Visual /\s\+\%#\@<!$/
autocmd InsertLeave * match Visual /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Use 2 spaces per indentation level for Ruby, YAML and Vim script.
autocmd! FileType ruby   setlocal sw=2 sts=2 ts=2 expandtab
autocmd! FileType eruby  setlocal sw=2 sts=2 ts=2 expandtab
autocmd! FileType yaml   setlocal sw=2 sts=2 ts=2 expandtab
autocmd! FileType coffee setlocal sw=2 sts=2 ts=2 expandtab
autocmd! FileType html   setlocal sw=4 sts=4 ts=4 noexpandtab
autocmd! FileType rust   setlocal tw=80

" ============================================================================
" KEY BINDINGS
"
" A collection of custom key bindings.
"
map <F5> :SyntasticCheck<CR><Esc>
map <c-d> :NERDTreeToggle<CR><Esc>

" ============================================================================
" HOST SPECIFIC CONFIGURATION
"
" Load a host specific .vimrc. This allows this generic .vimrc file to be
" re-used across the various machines that I use while still being able to set
" host specific configuration options.
"
" The name .hvimrc is derived from "host specific .vimrc".
"
if filereadable(expand('~/.hvimrc'))
  source ~/.hvimrc
endif
