" vundle
set nocompatible              " be iMproved
filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" !vundle

colorscheme solarized
set background=light

Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/UltiSnips'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'kana/vim-smartinput'
"Bundle 'Blackrush/vim-gocode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'osyo-manga/vim-over'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'cespare/vim-toml'
Plugin 'majutsushi/tagbar'

syntax on

" UltiSnips works fine with YCM
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
" !UltiSnips works fine with YCM
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let mapleader="\<space>"
let g:go_fmt_command = "goimports"

nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>
vnoremap <C-j> <C-f>
vnoremap <C-k> <C-b>
nnoremap <S-Tab> %
vnoremap <S-Tab> %
nmap <F2> :w<CR>
nnoremap <Bslash> :nohl<CR>
map <leader>~ :tabnew ~/.vimrc<CR>
vnoremap <leader>a :<C-w>UltiSnipsEdit<CR>Go<CR>snippet name "desc" !b<CR><C-r>*<CR><CR><C-w>endsnippet<ESC>
map <leader>s :UltiSnipsEdit<CR>G
map <leader>p :CtrlPClearAllCaches<CR>
map <leader>d :Godoc<CR>

set encoding=utf-8
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
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
set wrap
set textwidth=75
set formatoptions=qrn1
set colorcolumn=80
set autoread
set laststatus=2
set directory=~/tmp/
set list
set lcs=trail:·,tab:\ \ 
set noexpandtab

filetype plugin indent on

augroup hilight_over_80
	au!
	au VimResized,VimEnter * set cc= | for i in range(80, &columns > 80 ? &columns : 80) | exec "set cc+=" . i | endfor
augroup end

augroup html_fmt
	au!
	"au BufWritePost *.html silent !tidy -mi % &> /dev/null
augroup end

augroup expandtab
       au!
       au FileType erlang set et
       au FileType php set et
augroup end

augroup skeletons
       au!
       au BufNewFile *.php exec "normal I<?php\<ESC>2o"
augroup end

augroup expandtab
	au!
	au FileType erlang set et
	au FileType php set et
augroup end

augroup skeletons
	au!
	au BufNewFile *.php exec "normal I<?php\<ESC>2o"
augroup end

augroup syntax_hacks
	au!
	au FileType diff syn match DiffComment "^#.*"
	au FileType diff syn match DiffCommentIgnore "^###.*"
	au FileType diff call g:ApplySyntaxForDiffComments()
augroup end

fun! g:ApplySyntaxForDiffComments()
	if &background == 'light'
		hi DiffCommentIgnore ctermfg=249 ctermbg=none
		hi DiffComment ctermfg=16 ctermbg=254
	else
		hi DiffCommentIgnore ctermfg=249 ctermbg=none
		hi DiffComment ctermfg=15 ctermbg=237
	endif
endfun
