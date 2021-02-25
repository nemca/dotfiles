set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'L9'
    Plugin 'bruno-/vim-man'
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    "Plugin 'bling/vim-airline'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'https://github.com/ap/vim-templates.git'
    Plugin 'https://github.com/henrik/vim-indexed-search.git'
    Plugin 'https://github.com/scrooloose/nerdtree.git'
    Plugin 'https://github.com/Raimondi/delimitMate'
    Plugin 'https://github.com/scrooloose/nerdcommenter'
    Plugin 'rizzatti/dash.vim'
    " Python
    Plugin 'https://github.com/nvie/vim-flake8'
    " Puppet
    Plugin 'https://github.com/rodjek/vim-puppet.git'
    " Go
    Plugin 'fatih/vim-go'
    Plugin 'Coornail/vim-go-conceal'
    Plugin 'fatih/molokai'
    Plugin 'majutsushi/tagbar'
    Plugin 'AndrewRadev/splitjoin.vim'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required

set nocompatible
set autowrite
set shell=/usr/local/bin/bash
set directory=$HOME/.vim/swp
filetype off
set autoread                    " Automatically reread changed files without asking me anything
set backspace=indent,eol,start  " Makes backspace key more powerful.
set noerrorbells                " No beeps
set noswapfile                  " Don't use swapfile
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set autowrite                   " Automatically save before :next, :make etc.
set termencoding=utf-8          " Set default encoding to UTF-8
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
set autoindent
set hlsearch
set incsearch
set ruler
set smartcase
set smartindent
set showcmd
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab ts=4 sw=4 ai
set nopaste
set wildmenu
set nocompatible              " be iMproved, required
set backspace=indent,eol,start
set noshowmode
set number

let mapleader=","
let g:airline_theme='sol'
let g:airline_powerline_fonts = 0
let g:airline_section_b = '%{hostname()} %{fugitive#head()}'
"let g:airline_section_b = '%{strftime("%H:%M")} %{fugitive#head()}'
let g:airline_section_c = '%t'
"let g:airline_section_c = '%{fugitive#head()} %t'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:bufferline_echo = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:molokai_original = 1
let g:rehash256 = 1
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_width = 55
let g:tagbar_hide_nonpublic = 1
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 0
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
let g:ycm_confirm_extra_conf = 1
let g:ycm_global_ycm_extra_conf = '/Users/mbr/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:templates_empty_files = 1
" enable all Python syntax highlighting features
let python_highlight_all = 1
" Puppet. Disable automatic => alignment
let g:puppet_align_hashes = 0
"Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_fmt_command = 'goimports'
let g:go_def_mode= 'gopls'
let g:go_test_timeout = '10s'
let g:go_textobj_include_function_doc = 1
let g:go_snippet_case_type = 'camelcase'
let g:go_auto_type_info = 1
let g:go_template_autocreate = 0
let g:go_metalinter_enabled = ['vet', 'golint']

" Snippets https://github.com/SirVer/ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger = "<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

let delimitMate_expand_space = 1
let delimitMate_expand_cr = 2

" NERDcommenter
let NERDSpaceDelims = 1

syntax on
set conceallevel=2
set concealcursor=nvc
" migrate to plugin 'Coornail/vim-go-conceal'
"au VimEnter * syntax match neq "!=" conceal cchar=≠
"au VimEnter * syntax match arrow "->" conceal cchar=→
"au VimEnter * syntax match div "//" conceal cchar=÷
"au VimEnter * syntax match gteq ">=" conceal cchar=≥
"au VimEnter * syntax match lteq "<=" conceal cchar=≤

color molokai

nnoremap <F2> :set paste!<CR>
"nnoremap <F3> :set hlsearch!<CR>
nnoremap <F3> :set invnumber<CR>
nnoremap <F5> :!go build<CR><CR>
nnoremap gd :GoDef<CR>
nnoremap gt :tabnext<CR>
nnoremap gT :tabprevious<CR>
nnoremap T :tabs<CR>
" Center the screen
nnoremap <space> zz
nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
"map <leader>m <Plug>(Vman)
map <C-m> <Plug>(Vman)
cnoreabbrev man Man

aunmenu Help.
aunmenu Window.

" цвет меню автодополнения
highlight Pmenu ctermfg=Yellow ctermbg=Blue
highlight Search ctermfg=None ctermbg=None cterm=bold,underline
highlight IncSearch ctermfg=Blue ctermbg=None
highlight Comment ctermfg=DarkGreen
highlight Conceal ctermfg=None ctermbg=None cterm=None

augroup filetypedetect
  command! -nargs=* -complete=help Help vertical belowright help <args>

  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  autocmd BufNewFile,BufRead *.hcl setf conf
  autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.html setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.vim,vimrc setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.pp setlocal expandtab tabstop=2 shiftwidth=2
  " autocmd BufNewFile,BufRead *.go setlocal expandtab tabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.tmpl setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 smartindent autoindent
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2

  autocmd FileType json,ruby,eruby,yaml,html,sh setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 smartindent autoindent
  autocmd Filetype python let NERDSpaceDelims=0
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
augroup END

" Go
augroup go
  autocmd FileType go nmap <Leader>s <Plug>(go-implements)
  "autocmd FileType go nmap <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <Leader>gi <Plug>(go-install)
  autocmd FileType go nmap <Leader>gd :GoDef<CR>
  autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
  autocmd FileType go nmap <Leader>gb <Plug>(go-doc-browser)
  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>b <Plug>(go-build)
  autocmd FileType go nmap <leader>t <Plug>(go-test)
  autocmd FileType go nmap <leader>c <Plug>(go-coverage)
  "autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
  autocmd FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
  autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  "autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)
  autocmd FileType go nmap <Leader>e :GoIfErr<CR>
  autocmd FileType go nmap <Leader>cn :cnext<CR>
  autocmd FileType go nmap <Leader>cp :cprevious<CR>
  autocmd FileType go nmap <Leader>a :GoAlternate<CR>
  autocmd FileType go nmap <Leader>m :GoMetaLinter<CR>
  autocmd FileType go nmap <Leader>l :GoLint<CR>
  autocmd FileType go nmap <Leader>v :GoVet<CR>
  autocmd FileType go nmap <Leader>gm :GoMetaLinter<CR>
  autocmd FileType go nmap <Leader>atj :GoAddTags json<CR>
  autocmd FileType go nmap <Leader>atx :GoAddTags xml<CR>
  autocmd FileType go nmap <Leader>rtj :GoRemoveTags json<CR>
  autocmd FileType go nmap <Leader>rtx :GoRemoveTags xml<CR>
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
