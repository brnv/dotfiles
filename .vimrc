set nocompatible

syntax on

let mapleader="\<space>"

" Plug.vim section
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugins')

Plug 'altercation/vim-colors-solarized'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/UltiSnips'
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']
    vmap <leader>sa :<C-w>UltiSnipsEdit<CR>Go<CR>snippet name "desc"<CR><C-r>*<CR><CR><C-w>endsnippet<ESC>
    map <leader>s :UltiSnipsEdit<CR>G

Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
    let g:airline_theme = 'raven'
    let g:airline_powerline_fonts = 1
    let g:Powerline_symbols = 'fancy'

Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_follow_symlinks = 1
    let g:ctrlp_show_hidden = 1
    map <leader>p :CtrlPClearAllCaches<CR>

Plug 'kana/vim-smartinput'
Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }
    nmap H :OverCommandLine %s/<CR>
    vmap H :OverCommandLine s/<CR>

Plug 'fatih/vim-go', { 'for': 'go' }
    let g:go_fmt_command = "goimports"

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'cespare/vim-toml'
Plug 'majutsushi/tagbar'
Plug 'junegunn/seoul256.vim'
Plug 'Shougo/unite.vim'
Plug 'kovetskiy/ash.vim'
    augroup ash
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

Plug 'vim-scripts/EasyMotion'
    map <leader>f <Space><Space>w
    map <leader>b <Space><Space>b

Plug 't9md/vim-choosewin'
    let g:choosewin_overlay_enable = 1
    let g:choosewin_label = 'SDFHJKL'
    nmap <leader>d :ChooseWin<CR>

Plug 'wojtekmach/vim-rename'
Plug 'seletskiy/vim-pythonx'
    augroup go_helpers
        au!
        au FileType go inoremap <C-L> <C-\><C-O>:py go.cycle_by_var_name()<CR>
        au FileType go smap <C-L> <BS><C-L>
        au FileType go inoremap <buffer> . <C-\><C-O>:py go.autoimport()<CR>.
    augroup end

Plug 'kovetskiy/vim-ski'
    let g:skeletons_dir=$HOME.'/.vim/skeletons/'

Plug 'kovetskiy/vim-go-complete-utils', { 'for': 'go' }
    augroup go_functions
    au FileType go inoremap <C-Y> <C-R>=GoCompleteSnippet()<CR>
    augroup end

"Plug 'Shougo/vimproc'
"Plug 'seletskiy/vim-nunu'
"Plug 'gmarik/vundle'
"Bundle 'Blackrush/vim-gocode'
"Plug 'scrooloose/syntastic'
"let g:syntastic_python_python_exec = '/usr/bin/python2.7'
"Plug 'kien/ctrlp.vim'
"Plug 'Shougo/vimproc.vim'
call plug#end()

" Options
set encoding=utf-8
set fileformat=unix
set wildmenu
set autoindent
set undofile
set undodir=~/.vim/tmp/
set backupdir=$HOME/.vim/tmp
set directory=~/.vim/tmp/
set ttyfast
set lazyredraw
set tabstop=4
set shiftwidth=4
set softtabstop=4
set showcmd
set ruler
set backspace=indent,eol,start
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set nowrap
set textwidth=75
set formatoptions=qrn1
set colorcolumn=80
set autoread
set laststatus=2
set list
set lcs=trail:·,tab:\ \ 
set noexpandtab
set relativenumber
set number
set timeoutlen=400
set splitright
set updatetime=1000
set showtabline=1
set pastetoggle=<F11>

filetype plugin indent on

" Speeding up work
map <leader>r :so ~/.vimrc<CR>
map <leader>~ :tabnew ~/.vimrc<CR>
map <leader>j <Space>cl
map <leader>u <Space>cu
map <leader>w <ESC>:w<CR>
map Q qq
map ! :g//norm @q<CR>
nmap <leader>n :vnew<CR>

" Motions
map <M-j> <Esc>
nnoremap <C-j> <C-f>
nmap <C-j> <S-]>
nmap <C-k> <S-[>
vnoremap <S-Tab> %
vmap <C-k> <C-b>

" Miscellaneous
let g:EclimCompletionMethod = 'omnifunc'
nnoremap <Bslash> :nohl<CR>

" Autocommands
augroup starting_cursor_position
    au!
    au BufReadPost * call setpos(".", getpos("'\""))
augroup end

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
    au FileType php,erlang,prolog,java,vim set et
augroup end

augroup javac_classpath_for_eclimd
    au!
    au FileType java let g:syntastic_java_javac_classpath = $ANDROID_HOME.
                \"/platforms/android-19/android.jar".
                \":".substitute(expand("%:p"), "\\(.*/src\\).*", "\\1", "")
augroup end

" Colorschemes
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
