" http://habrahabr.ru/post/64224/
let mapleader=","
syntax on
colo desert

nnoremap <F2> :set paste!<CR>
nnoremap <F3> :set hlsearch!<CR>

aunmenu Help.
aunmenu Window.
"let no_buffers_menu=1
"set mouse=a "Включить поддержку мыши
"set termencoding=utf-8 "Кодировка терминала
set t_vb= 
set showtabline=0
set foldcolumn=0
set wrap
set linebreak
set mousemodel=popup
set completeopt-=preview
set gcr=a:blinkon0
set t_Co=256
set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t
set laststatus=2
set noshowmode
"set ambiwidth=double

let python_highlight_all = 1
let g:airline_theme='sol'
"let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{strftime("c")}'
let g:airline_section_c = '%t'
let g:airline_enable_fugitive=1
let g:airline_enable_syntastic=1
let g:airline_enable_bufferline=1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:bufferline_echo = 0
"let g:airline_symbols = ','
if !exists('g:airline_symbols')
	  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

highlight Pmenu ctermfg=Yellow ctermbg=Blue

autocmd FileType python set omnifunc=pythoncomplete#Complete


set autoindent
set expandtab
set hlsearch
set incsearch
set ruler
set smartcase
set smartindent
"set showcmd
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set smarttab
"set expandtab
"set autoindent
set noexpandtab
set nopaste
set wildmenu

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" " Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'git://github.com/majutsushi/tagbar.git'
" " git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'bling/vim-airline'
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
"
" Go
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)
