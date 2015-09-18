syn on

" Pathogen entry (https://github.com/tpope/vim-pathogen)
execute pathogen#infect()

" ignore files
set wildignore=*.o,*.a,*~,*.pyc

" auto reaload a file
set autoread

" show line numbers
set number
set numberwidth=5

" status bar
set laststatus=2
set cmdheight=2

" cursor configurations
colorscheme default
set ruler
set cursorline
set cursorcolumn
set showmatch
set virtualedit=all
set scrolloff=10
hi CursorLine   cterm=NONE ctermbg=234
hi CursorColumn cterm=NONE ctermbg=234
colorscheme molokai

" use only space instead of tabs
set expandtab
set smarttab
set autoindent
set softtabstop=4
set shiftwidth=4
set wildmenu
set ai
set si
set wrap

" search configuration
set ignorecase
set smartcase
set hlsearch
set incsearch

" tabs configuration
map <Space><Left> :tabp<Enter>
map <Space><Right> :tabn<Enter>
map ˙ 10h
map ¬ 10l
map <c-h> 0
map <c-l> $

" ALT+j/k
noremap ˚ 10k
noremap ∆ 10j

" Enable syntax highlighting
set encoding=utf8
set ffs=unix,dos,mac

" generated files
set nobackup
set nowb
set noswapfile

" turn sound of
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" tree
let g:NERDTreeWinSize=48
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1


" do not remove previous word
set cpoptions+=$

" --------------------------------------- SELECTION
" keep selection after indendation
vmap > >gv
vmap < <gv


" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" --------------------------------------- TABS
let mapleader = ","

nmap <silent> <Leader>] gt<cr>
nmap <silent> <Leader>[ gT<cr>
nmap <silent> <Leader>m :NERDTree<cr>
nmap <silent> <Leader>n :tabnew<Space>

nnoremap <leader>sr :%s/\<<C-r><C-w>\>//g<left><left>

map ‘ gt<cr>
map “ gT<cr>

