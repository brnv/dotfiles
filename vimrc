" vundle
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" !vundle

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/UltiSnips'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'kana/vim-smartinput'
"Bundle 'Blackrush/vim-gocode'
Bundle 'Valloric/YouCompleteMe'
Bundle 'osyo-manga/vim-over'
Bundle 'fatih/vim-go'

syntax on

colorscheme solarized
set background=dark

nnoremap <C-l> :tabn<CR>
nnoremap <C-h> :tabp<CR>
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>
vnoremap <C-j> <C-f>
vnoremap <C-k> <C-b>
nnoremap <C-t> :tabnew<CR>
nnoremap <S-l> :tabmove +1<CR>
nnoremap <S-h> :tabmove -1<CR>
nmap <F2> :w<CR>

set encoding=utf-8
set autoindent

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set showcmd
set ruler
set relativenumber
set backspace=indent,eol,start

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

nnoremap <S-Tab> %
vnoremap <S-Tab> %

set wrap
set textwidth=75
set formatoptions=qrn1
set colorcolumn=80

set autoread

" UltiSnips works fine with YCM
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
" !UltiSnips works fine with YCM

let g:airline_powerline_fonts = 1

filetype plugin indent on

set laststatus=2

let g:Powerline_symbols = 'fancy'

nnoremap <Bslash> :nohl<CR>

set directory=~/tmp/

augroup hilight_over_80
	au!
	au VimResized,VimEnter * set cc= | for i in range(80, &columns > 80 ? &columns : 80) | exec "set cc+=" . i | endfor
augroup end

set list
set lcs=trail:·,tab:\ \ 
set noexpandtab

let mapleader="\<space>"
noremap <leader>~ :tabnew ~/.vimrc<CR>
