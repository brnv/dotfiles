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

map <leader>p :PlugUpdate<CR>

call plug#begin('~/.vim/plugins')

Plug 'FooSoft/vim-argwrap'
    nnoremap <silent> <leader>a :ArgWrap<CR>
    let g:argwrap_tail_comma = 1

Plug 'altercation/vim-colors-solarized'

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
    vmap <leader>sa :<C-w>UltiSnipsEdit<CR>Go<CR>s<C-J><C-r>*<C-J>
    "map <leader>s :UltiSnipsEdit<CR>G

Plug 'tpope/vim-fugitive'

Plug 'bling/vim-airline'
    let g:airline_powerline_fonts = 1
    let g:Powerline_symbols = 'fancy'

Plug 'kana/vim-smartinput'

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

    au operations FileType go nmap <buffer> <Leader>, :call synta#go#build()<CR>
    au operations FileType go imap <buffer> <Leader>, <ESC>:call synta#go#build()<CR>
    au operations FileType go nmap <buffer> <Leader>l :GoLint .<CR>

    au operations FileType go nmap <buffer> <C-T> :call synta#quickfix#next()<CR>
    au operations FileType go nmap <buffer> <C-E><C-R> :call synta#quickfix#prev()<CR>
    au operations FileType go nmap <buffer> <C-E><C-T> :call synta#quickfix#error()<CR>

Plug 'tpope/vim-surround'
    nmap <leader>( <ESC>ysw)
    nmap <leader>' <ESC>#ysw'\
    nmap <leader>" <ESC>#ysw"\

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
    let g:choosewin_label = 'SDFHJKL'
    nmap <leader>d :ChooseWin<CR>

Plug 'danro/rename.vim'

Plug 'reconquest/vim-pythonx'
Plug 'reconquest/snippets'

Plug 'kovetskiy/vim-ski'
    let g:skeletons_dir=$HOME.'/.vim/skeletons/'

Plug 'kovetskiy/vim-go-utils', { 'for': 'go' }
    inoremap <C-E> <C-R>=GoCompleteSnippet()<CR>

Plug 'scrooloose/syntastic', { 'for': 'php' }
    let g:syntastic_php_checkers = ["php"]
    augroup php_helpers
    au FileType php map <leader>c :SyntasticCheck phpmd<CR>
    augroup end

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
    map <C-P> :FZF -m<CR>
    "@TODO: follow symlinks & dotfiles visible

"Plug 'wookiehanover/jshint.vim', { 'for': 'javascript' }
"    let g:JSHintUpdateWriteOnly=1

Plug 'Shougo/vimshell.vim'

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

Plug 'takac/vim-hardtime'
    let g:list_of_insert_keys = []
    let g:list_of_visual_keys = []
    let g:list_of_normal_keys = ["<Leader>w"]

    let g:hardtime_showerr = 1
    let g:hardtime_timeout = 5000
    let g:hardtime_default_on = 1

Plug 'vim-scripts/grep.vim'
    nnoremap <silent> <F3> yaw:Grep <C-R>" *<CR>

Plug 'kovetskiy/vim-hacks'

" go get github.com/kovetskiy/gotags
Plug 'kovetskiy/synta'

Plug 'kovetskiy/vim-bash'

Plug 'seletskiy/ashium'
    nmap <C-M><C-M> :py ashium.commit()<CR>

    augroup review_setting
        au!
        au FileType diff nnoremap <buffer> <CR> o<C-R>=(getline('.')[0] == '#')
            \ ? ' '
            \ : '# '<CR>
        au FileType diff nnoremap <leader>s /^+$<CR>
    augroup end

Plug 'kovetskiy/ycm-sh'

"Plug 'hallettj/jslint.vim'
"Plug 'Shougo/vimproc'
"Plug 'seletskiy/vim-nunu'
"Plug 'gmarik/vundle'
"Bundle 'Blackrush/vim-gocode'
"let g:syntastic_python_python_exec = '/usr/bin/python2.7'
"Plug 'kien/ctrlp.vim'
"Plug 'Shougo/vimproc.vim'
"Plug 'wojtekmach/vim-rename'
""Plug 'ctrlpvim/ctrlp.vim'
"    let g:ctrlp_follow_symlinks = 1
"    let g:ctrlp_show_hidden = 1
"    map <leader>p :CtrlPClearAllCaches<CR>

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
map <leader>w <Esc>:w<CR>
map <leader>q <Esc>:q<CR>
nmap <leader>t :read !date<CR>
map Q qq
map ! :g//norm @q<CR>
nmap <leader>n :vsplit<CR>
"nmap <leader>m :vnew<CR>:VimShell<CR>mysql<CR>
map <leader>k v$:s/->/->\r\t\t\t<CR>\:retab<CR>
nmap # #N
nmap <leader>v :split<CR>
"nmap <F11> :set paste<CR>i<C-R>*<Esc>:set nopaste<CR>
nmap <F11> :read !xsel<CR>
map <leader>; <ESC>$a;<ESC>
"map <C-b> <C-^>
" Motions
map <M-j> <Esc>
vnoremap <S-Tab> %

" Miscellaneous
let g:EclimCompletionMethod = 'omnifunc'
nnoremap q: <NOP>

" Autocommands
augroup starting_cursor_position
    au!
    au BufReadPost * call setpos(".", getpos("'\""))
augroup end

augroup filetypes
    au!
    au BufEnter *.pl,*.pro,*.P set ft=prolog
augroup end

augroup expandtab
    au!
    au FileType php,erlang,prolog,java,vim,xml,javascript,json set et
augroup end

augroup javac_classpath_for_eclimd
    au!
    au FileType java let g:syntastic_java_javac_classpath = $ANDROID_HOME.
                \"/platforms/android-19/android.jar".
                \":".substitute(expand("%:p"), "\\(.*/src\\).*", "\\1", "")
augroup end

augroup eclimd
    au!
    au FileType java nmap <leader>, :Java %<CR>
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

function! TogglePhpHtmlFiletype()
    if &ft == "html"
        set ft=php
    elseif &ft == "php"
        set ft=html
    endif
endfunction

function! FormatHtmlInPhp()
    set ft=html
    normal gg=G
    set ft=php
    normal gg=G
    set ft=html
endfunction

augroup filetype_toggle_php_html
    au!
    au FileType php map <leader>e :call TogglePhpHtmlFiletype()<CR>
augroup end

augroup format_html_in_php
    au!
    au FileType html map <leader>t :call FormatHtmlInPhp()<CR>
augroup end

augroup format
    au!
    au FileType php map <leader>t ggvG=
augroup end
