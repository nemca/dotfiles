set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'gmarik/Vundle.vim'
	Plugin 'tpope/vim-fugitive'
	Plugin 'L9'
	Plugin 'git://git.wincent.com/command-t.git'
	Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	Plugin 'bling/vim-airline'
	"Go
	Plugin 'fatih/vim-go'
	Plugin 'majutsushi/tagbar'
	Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required

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


" http://habrahabr.ru/post/64224/