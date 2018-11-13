set nocompatible

syntax on

let g:mapleader="\<space>"
let mapleader=g:mapleader

augroup operations
    au!
augroup end

" Plug.vim section
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

if empty(glob('~/.vim/tmp'))
    silent !mkdir -p ~/.vim/tmp
endif

call plug#begin('~/.vim/plugins')

Plug 'maralla/completor.vim'
   let g:completor_gocode_binary = $HOME . '/.go/bin/gocode'
   let g:completor_disable_ultisnips = 1
   let g:completor_python_binary = '/usr/bin/python3'

Plug 'FooSoft/vim-argwrap'
    nnoremap <silent> <leader>a :ArgWrap<CR>
    let g:argwrap_tail_comma = 1

Plug 'Valloric/YouCompleteMe'
    let g:ycm_key_list_select_completion = []
    let g:ycm_collect_identifiers_from_tags_files = 1

Plug 'SirVer/UltiSnips'
    let g:UltiSnipsUsePythonVersion=2
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsSnippetDirectories = [
    \   $HOME . '/.vim/plugins/snippets',
    \   $HOME . '/.vim/UltiSnips',
    \]

Plug 'vim-airline/vim-airline-themes'

Plug 'vim-airline/vim-airline'
    let g:airline#extensions#whitespace#symbol = '☼'
    let g:airline_powerline_fonts = 1
    let g:airline_skip_empty_sections = 1
    let g:airline#extensions#whitespace#checks = ['indent', 'trailing']

Plug 'osyo-manga/vim-over'
    vmap H :OverCommandLine s/<CR>
    nmap H :OverCommandLine %s//&<CR>

    nmap <Leader><Leader> :call _search_clear_highlighting()<CR>
    noremap n :call _search_cursorhold_register()<CR>n

    augroup _search_cursorhold_events
        au!
    augroup end

    func! _search_clear_highlighting()
        call feedkeys(":nohlsearch\<CR>")
    endfunc!

    func! _search_cursorhold_do()
        if &updatetime != g:updatetime
            exec "set updatetime =" . g:updatetime
        endif

        augroup _search_cursorhold_events
            au!
        augroup end

        call _search_clear_highlighting()
    endfunc!

    func! _search_cursorhold_register()
        set updatetime=2000

        augroup _search_cursorhold_events
            au!
            au CursorHold * call _search_cursorhold_do()
        augroup end
    endfunc!

Plug 'fatih/vim-go', { 'for': 'go' }
    let g:go_doc_keywordprg_enabled = 0
    let g:go_fmt_command = "goimports"
    let g:go_fmt_autosave = 1

    au operations VimEnter,WinEnter,BufRead,BufNewFile * set nofoldenable

    au operations FileType go nmap <buffer> <Leader>f :GoFmt<CR>
    au operations FileType go nmap <buffer> <Leader>h :GoDoc<CR>
    au operations FileType go nmap <buffer> gdg :GoDef<CR>
    au operations FileType go nmap <buffer> gdl :call go#def#JumpMode('vsplit')<CR>
    au operations FileType go nmap <buffer> gdk :call go#def#JumpMode('split')<CR>

    au operations FileType go nmap <buffer> <Leader>, :call GoSaveNBuild()<CR>
    au operations FileType go imap <buffer> <Leader>, <ESC>:call GoSaveNBuild()<CR>
    au operations FileType go nmap <buffer> <Leader>l :GoLint .<CR>

    au operations FileType go nmap <buffer> <C-T> :call synta#quickfix#next()<CR>
    au operations FileType go nmap <buffer> <C-E><C-R> :call synta#quickfix#prev()<CR>
    au operations FileType go nmap <buffer> <C-E><C-T> :call synta#quickfix#error()<CR>

    function! GoSaveNBuild()
        execute ":w"
        call synta#go#build()
    endfunction

Plug 'scrooloose/nerdcommenter'

Plug 'junegunn/seoul256.vim'

Plug 'reconquest/vim-pythonx'

Plug 'reconquest/snippets'

Plug 'reconquest/vim-colorscheme'
    let g:airline_theme = 'reconquest'

Plug 'kovetskiy/vim-ski'
    let g:skeletons_dir=$HOME.'/.vim/skeletons/'
    let g:skeletons_use_by_default=0

Plug 'kovetskiy/vim-go-utils', { 'for': 'go' }
    inoremap <C-E> <C-R>=GoCompleteSnippet()<CR>

Plug 'junegunn/fzf', {'do': './install --all' }

Plug 'kovetskiy/fzf.vim'
    map <C-P> :FZF<CR>

    let g:fzf_prefer_tmux = 1
    let g:fzf_colors =
    \ { 'fg':      [240],
      \ 'bg':      [234],
      \ 'hl':      [248],
      \ 'fg+':     [220],
      \ 'bg+':     [236],
      \ 'hl+':     [220],
      \ 'info':    [1],
      \ 'prompt':  [15],
      \ 'pointer': [220],
      \ 'spinner': [1],
      \ 'header':  ['Comment'] }
    let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

Plug 'seletskiy/vim-autosurround'
    " oh, how I like to remap different plugin mappings
    au User _OverwriteMatchemMappings
        \ autocmd VimEnter,BufEnter,FileType *
            \ inoremap <buffer> ( (<C-R>=AutoSurround(")")?'':g:MatchemMatchStart()<CR>

    au User _OverwriteMatchemMappings
        \ autocmd VimEnter,BufEnter,FileType *
            \ inoremap <buffer> { {<C-R>=AutoSurround("}")?'':g:MatchemMatchStart()<CR>

    au User _OverwriteMatchemMappings
        \ autocmd VimEnter,BufEnter,FileType * call AutoSurroundInitMappings()

    au User _VimrcRunAfterPlugEnd doautocmd User _OverwriteMatchemMappings

    doautocmd User _OverwriteMatchemMappings

Plug 'seletskiy/matchem'
    " required to be setup before ultisnips inclusion
    let g:UltiSnipsJumpForwardTrigger = '<C-J>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-K>'

    " wow, \<lt>lt>c-o> will expand to \<lt>c-o> by feedkeys, and then to
    " <c-o> by matchem.
    au User _VimrcRunAfterPlugEnd inoremap <expr> <C-O> (
        \ pumvisible()
            \ ? feedkeys("\<C-N>")
            \ : feedkeys("\<C-R>=g:MatchemRepeatFixupFlush('\<lt>lt>c-o>')\<CR>\<C-O>", 'n')
        \ ) ? '' : ''


    au User _VimrcRunAfterPlugEnd inoremap <Tab>
        \ <c-r>=g:MatchemRepeatFixupFlush('<lt>c-j>')<cr>
        \<c-r>=UltiSnips#ExpandSnippet()<cr>

    au User _VimrcRunAfterPlugEnd snoremap <Tab>
        \ <c-g><esc>:call UltiSnips#SaveLastVisualSelection()<cr>gvs

    au User UltiSnipsEnterFirstSnippet call g:MatchemRepeatFixupFlush('<lt>c-j>')

Plug 'kovetskiy/vim-hacks'

" go get github.com/kovetskiy/gotags
Plug 'kovetskiy/synta'

Plug 'kovetskiy/vim-bash'

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
set autoread
set laststatus=2
set list
set lcs=trail:·,tab:\ \ 
set expandtab
set relativenumber
set number
set timeoutlen=300
set splitright
let g:updatetime=300
set showtabline=1
set cc=80,120
set tags=./.tags;/

let g:vim_indent_cont=shiftwidth()

filetype plugin indent on

" Speeding up work
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-c> <C-w>-
nmap <C-e> <C-w>+
nmap == <C-w>=
nmap -- <C-w>_
map <S-J> }
map <S-K> {
map <leader>m :mess<CR>
nmap \ :nohlsearch<CR> :mess clear<CR>

map <leader>r :so ~/.vimrc<CR>
map <leader>~ :tabnew ~/.vimrc<CR>
map <leader>j <Space>cl
map <leader>u <Space>cu
map <leader>w <Esc>:wa<CR>
map <leader>q <Esc>:q<CR>
nmap <leader>t :read !date<CR>
map Q qq
map ! :g//norm @q<CR>
nmap <leader>n :vnew<CR>
map <leader>k v$:s/->/->\r\t\t\t<CR>\:retab<CR>
nmap # #N
nmap <leader>v :new<CR>
nmap <F11> :read !xsel<CR>
map <leader>; <ESC>$a;<ESC>

" Motions
map <M-j> <Esc>
vnoremap <S-Tab> %

set background=dark
let g:seoul256_background = 234
colo seoul256

augroup colorschemes
    au!
    au FileType go colorscheme reconquest
augroup end

" Autocommands
augroup starting_cursor_position
    au!
    au BufReadPost * call setpos(".", getpos("'\""))
augroup end
