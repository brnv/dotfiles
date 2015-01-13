set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !mkdir -p ~/.vim/autoload
	silent !curl -fLo ~/.vim/autoload/plug.vim
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')

Plug 'gmarik/vundle'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/UltiSnips'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'kana/vim-smartinput'
"Bundle 'Blackrush/vim-gocode'
Plug 'Valloric/YouCompleteMe'
Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'cespare/vim-toml'
Plug 'majutsushi/tagbar'
Plug 'junegunn/seoul256.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc'
Plug 'kovetskiy/ash.vim'

call plug#end()

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
let g:syntastic_python_python_exec = '/usr/bin/python2.7'

nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>
vnoremap <C-j> <C-f>
vnoremap <C-k> <C-b>
nnoremap <S-Tab> %
vnoremap <S-Tab> %
nmap <F2> :w<CR>
nnoremap <Bslash> :nohl<CR>
map <leader>~ :tabnew ~/.vimrc<CR>
vmap <leader>sa :<C-w>UltiSnipsEdit<CR>Go<CR>snippet name "desc" !b<CR><C-r>*<CR><CR><C-w>endsnippet<ESC>
map <leader>s :UltiSnipsEdit<CR>G
map <leader>p :CtrlPClearAllCaches<CR>
map <leader>d :Godoc<CR>
map <leader>gr :w\|!go run %<CR>
map <leader>gt :w\|!go test<CR>

nmap H :OverCommandLine %s/<CR>
vmap H :OverCommandLine s/<CR>

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

augroup filetypes
	au!
	au BufEnter *.pl,*.pro,*.P set ft=prolog
augroup end

augroup expandtab
	au!
	au FileType php,erlang,prolog set et
augroup end

augroup skeletons
	au!
	au BufNewFile *.php exec "normal I<?php\<ESC>2o"
augroup end

augroup cursor_position
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup end

if system('cat ~/.background') == "dark"
	set background=dark
	let g:seoul256_background = 234
else
	set background=light
	let g:seoul256_background = 255
endif

if system('cat ~/.colorscheme') == "seoul256"
	colo seoul256
endif

if system('cat ~/.colorscheme') == "solarized"
	colo solarized
endif

augroup syntax_hacks
	au!
	au FileType diff syn match DiffComment "^#.*"
	au FileType diff syn match DiffCommentIgnore "^###.*"
	au FileType diff call g:ApplySyntaxForDiffComments()
augroup end

augroup javac_classpath
	au!
	au FileType java let g:syntastic_java_javac_classpath = $ANDROID_HOME.
				\"/platforms/android-19/android.jar".
				\":".substitute(expand("%:p"), "\\(.*/src\\).*", "\\1", "")
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
