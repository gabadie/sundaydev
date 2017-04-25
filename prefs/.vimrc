" Guillaume Abadie's VIMRC.
"
" Setup:
"   echo 'source pref/to/this/.vimrc' > ~/.vimrc
"   cd ~/.vim
"   git clone https://github.com/VundleVim/Vundle.vim.git ~//bundle/Vundle.vim
"   vim +PluginInstall
"   cd bundle/YouCompleteMe
"   ./install.py --clang-completer

" --------------------------------------- Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself.
Plugin 'VundleVim/Vundle.vim'

" The fuzzy file opener.
Plugin 'ctrlpvim/ctrlp.vim'

" Close a buffer without closing the split.
Plugin 'kwbdi.vim'

" {,Un}Comment selected lines.
Plugin 'scrooloose/nerdcommenter'

" The colorscheme.
Plugin 'sickill/vim-monokai'

" Multiple cursor spawner.
"   Use <C-n>
Plugin 'terryma/vim-multiple-cursors'

" Git wrapper.
Plugin 'tpope/vim-fugitive'

" The C/C++/Python autocompletion.
Plugin 'valloric/youcompleteme'

" The status bar.
Plugin 'vim-airline/vim-airline'

call vundle#end()

" --------------------------------------- General setup
syntax on

" Ignore files.
set wildignore=*.o,*.a,*~,*.pyc

" Auto reaload a file.
set autoread

" Show line numbers.
set number
set numberwidth=5

" Status bar.
set laststatus=2
set cmdheight=2

" 80 chars ruler.
set colorcolumn=81

" Cursor configurations.
colorscheme monokai
set ruler
set cursorline
set cursorcolumn
set showmatch
set virtualedit=all
set scrolloff=10

" Use only spaces instead of tabs.
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set wildmenu
set wrap

" Enable per file type indentation.
filetype plugin indent on
autocmd FileType python set
  \ expandtab
  \ shiftwidth=2
  \ softtabstop=2
  \ tabstop=2
  \ smarttab
  \ smartindent
  \ autoindent

" Search configuration.
set ignorecase
set smartcase
set hlsearch
set incsearch

" ALT+h/l to moves 10 chars left and right.
map ˙ 10h
map ¬ 10l

" ALT+j/k to move 10 lines up and down.
noremap ˚ 10k
noremap ∆ 10j

" CTRL+h/l to move to begining and end on line.
map <c-h> 0
map <c-l> $

" Enable syntax highlighting.
set encoding=utf8
set ffs=unix,dos,mac

" Generated files.
set nobackup
set nowb
set noswapfile

" Turn sound of.
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Remove trailing whitespaces when saving.
autocmd BufWritePre * :%s/\s\+$//e

" Do not remove previous word
set cpoptions+=$

" disable arrow keys.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Automatically switch to V mode when unidenting.
noremap < V<
noremap > V>

" Keep selection when endenting in V mode.
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Splits configs.
set splitbelow
set splitright

" Buffers configs.
nnoremap <C-[> :bprev<cr>
nnoremap <C-]> :bnext<cr>

" --------------------------------------- Leader shortcuts
let mapleader="\<Space>"

" Create a new view.
nmap <silent> <Leader>s :vsplit<CR>

" Delete buffer using c.
nmap <silent> <Leader>c <Leader>bd

" Create a new buffer.
nmap <silent> <Leader>n :enew<CR>

" Close view using q/Q.
nmap <silent> <Leader>q :q<CR>

" Open file
nmap <silent> <Leader>p <C-P>

" Fast window changes.
nmap <silent> <Leader>h <C-W><C-H>
nmap <silent> <Leader>l <C-W><C-L>
nmap <silent> <Leader>j :bprev<cr>
nmap <silent> <Leader>k :bnext<cr>

" Toggle comment using /.
nmap <silent> <Leader>/ <Leader>c<Space>
vmap <silent> <Leader>/ <Leader>c<Space><cr>gv

" --------------------------------------- CtrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_show_hidden=1

" --------------------------------------- YouCompleteMe
nmap <silent> <Leader>gd :YcmCompleter GoToDeclaration<cr>
nmap <silent> <Leader>gD :YcmCompleter GoToDeclaration<cr>
nmap <silent> <Leader>gr :YcmCompleter GoToReferences<cr>
nmap <silent> <Leader>gd :YcmCompleter GetDoc<cr>

let g:ycm_python_binary_path='python3'
let g:ycm_global_ycm_extra_conf='~/git/sundaydev/prefs/ycm_extra_conf.py'

" --------------------------------------- Airline
" Need to install the fonts first from:
"   https://github.com/powerline/fonts
set guifont=Roboto\ Mono\ for\ Powerline:h11

let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif

let g:airline_left_sep='»'
let g:airline_left_sep='▶'
let g:airline_right_sep='«'
let g:airline_right_sep='◀'
let g:airline_symbols.linenr='␊'
let g:airline_symbols.linenr='␤'
let g:airline_symbols.linenr='¶'
let g:airline_symbols.branch='⎇'
let g:airline_symbols.paste='ρ'
let g:airline_symbols.paste='Þ'
let g:airline_symbols.paste='∥'
let g:airline_symbols.whitespace='Ξ'

let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline_symbols.branch=''
let g:airline_symbols.readonly=''
let g:airline_symbols.linenr=''

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'

" --------------------------------------- Nerd Tree
let g:NERDTreeWinSize=48
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1
nmap <silent> <Leader>m :NERDTree<cr>

