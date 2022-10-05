set rtp-=~/.vim
set rtp^=~/.vim

syntax on
filetype plugin indent on

set shortmess+=sAIc

set encoding=utf-8
set printencoding=cp1251
set fileformat=unix

set textwidth=79
set timeoutlen=400
set wildmenu

set undofile
set undodir=$HOME/.vim/runtime/undo/
set directory=$HOME/.vim/runtime/tmp/
set backupdir=$HOME/.vim/runtime/backup/
set writebackup
set backup

set lazyredraw
set ttyfast

set number
set relativenumber

set history=500

set hlsearch
set incsearch

set ignorecase
set smartcase

set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set backspace=2
set splitright

set laststatus=2

set gdefault
set completeopt-=preview
set nowrap
let g:updatetime=150
set updatetime=150

set timeoutlen=400
set showtabline=0
set cino=(s,m1,+0

set list
set lcs=trail:·,tab:→\ "

set pastetoggle=<F11>

au operations VimEnter,WinEnter,BufRead,BufNewFile * set nofoldenable
au operations VimEnter,WinEnter,BufRead,BufNewFile * au! matchparen

set noequalalways
set winminheight=0
set clipboard=unnamedplus
set signcolumn=yes

set tags=./.tags;/

if has('nvim')
    set viminfo+=n~/.vim/runtime/neoviminfo
else
    set viminfo+=n~/.vim/runtime/viminfo
endif

au FileType help setlocal number

au BufWritePre * if !isdirectory(expand('%:h')) | call mkdir(expand('%:h'),'p') | endif


func! _snapshot()
   silent execute "!vim-bundle-save >/dev/null 2>&1 &"
endfunc!
command! -bar Snapshot call _snapshot()

au operations BufWritePost ~/.vimrc
    \ source % | Snapshot

au operations BufWritePost */.config/sxhkd/sxhkdrc silent !pkill -USR1 sxhkd
au operations BufWritePost */.i3/config silent !i3-msg restart

"set cc=80,100

au operations BufRead *.noml set ft=noml.dracula

au operations FileType html setlocal sw=2

au operations BufRead */.vimperator/*.vim,.vimperatorrc set ft=vimperator

map Q <nop>
map K <nop>

imap <C-F> tx<TAB>
vmap <C-F> ctx<TAB>

imap <C-D> context.

"nnoremap <C-E><C-D> :cd %:p:h<CR>:pwd<CR>

nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>

nnoremap X S<ESC>
vnoremap $ g_

nnoremap > >>
nnoremap < <<

nnoremap <Leader>` :tabedit ~/.vimrc<CR>
nnoremap <Leader>% :so ~/.vimrc<CR>

vnoremap <silent> > >gv
vnoremap <silent> < <gv

inoremap jk <ESC>

nnoremap g< '<
nnoremap g> '>

nnoremap g. '>
nnoremap g, '<

nnoremap <Leader>vs :vsp<CR>

nnoremap <Leader>e :e!<CR>

nnoremap <Leader>q <ESC>:q<CR>
nnoremap <silent> <C-S> :w<CR>
inoremap <silent> <C-S> <Esc>:w<CR>

nnoremap <Leader>n <ESC>:bdelete!<CR>
nnoremap <Leader>q <ESC>:qa!<CR>

nnoremap <Leader>d V"_d<Esc>
vnoremap <Leader>d "_d

vnoremap <Leader>s y<ESC>:%s/<C-r>"/

vnoremap <Leader><C-y> "kyy
vnoremap <Leader><C-d> "kdgvd
vnoremap <Leader><C-x> "kygvx
vnoremap <Leader><C-p> "kp
vnoremap <Leader><C-P> "kP
vnoremap <Leader><C-s> "ks

nnoremap <Leader><C-x> v"kx
nnoremap <Leader><C-p> "kp
nnoremap <Leader><C-P> "kP

nnoremap <Leader>] :tnext<CR>

"nnoremap <C-T><C-T> :retab<CR>

nnoremap <C-E><C-E><C-R> :silent !rm -rf ~/.vim/view/*<CR>:redraw!<CR>

imap <C-A> <C-O>A

nmap <C-_> <C-W>_
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

imap <C-E> <C-R>=strpart(search("[)}\"'`\\]]", "c"), -1, 0)<CR><Right>

inoremap <C-H> <C-O>o

imap <C-U> <ESC>ua

nnoremap Q qq
nnoremap @@ @q

au operations BufRead,BufNewFile ~/.zshrc set ft=zsh.sh
au operations BufRead,BufNewFile *.zsh    set ft=zsh.sh

au operations BufRead,BufNewFile *.service set noet ft=systemd
au operations BufRead,BufNewFile PKGBUILD set et ft=pkgbuild.sh
au operations BufRead incident.md set et ft=incident.markdown
au operations BufNewFile incident.md set et ft=incident|Skeleton|set ft=incident.markdown

au operations BufRead,BufNewFile *mcabberrc* set noet ft=mcabberrc.sh

au operations BufRead,BufNewFile *.snippets set noet ft=snippets.python
au operations BufRead,BufNewFile *.skeleton set noet ft=snippets.python

au operations BufRead,BufNewFile *.chart set noet ft=mermaid
au operations BufRead,BufNewFile task set noet ft=task

au operations WinEnter * wincmd =

nmap K :s///g<CR><C-O>i

func! _open_random()
    let filename = system("git ls-files *.go | sort -R | head -n 1")
    let current = expand("%:p:t")
    if current == filename
        call _open_random()
        return
    endif

    execute ":e " filename
endfunc!

nmap <silent> <Leader>m :call _open_random()<CR>

let @k="^f=i:"
let @j="^t=x"

func! _tab_space()
    keepjumps %s/\t/    /
    normal ''
endfunc!

nmap @t :call _tab_space()<CR>

imap <C-Y> <Down>
cmap <C-F> <NOP>

vmap <Leader> S<Space><Space>

func! _macros_mode_toggle()
    if !get(g:, "macro_toggle_recording")
        let g:macro_toggle_recording = 0
    endif

    if g:macro_toggle_recording == 0
        normal qx
    else
        normal q
    endif

    let g:macro_toggle_recording = !g:macro_toggle_recording
endfunc!

func! DiffApplyTop()
    let start = line('.')
    call search(">>>>>>", "cs")
    let end = line('.')
    execute start.",".end "delete"
    call search("<<<<<", "bcs")
    execute "delete"
    nohlsearch
endfunc!

func! DiffApplyBottom()
    let start = line('.')
    call search("<<<<<", "bcs")
    let end = line('.')
    execute start.",".end "delete"
    call search(">>>>>", "bcs")
    execute "delete"
    nohlsearch
endfunc!

func! DiffEnable()
    nmap <buffer> <C-F><C-D> :Grep '\=\=\=\=\=\=\='<CR><CR>
    nmap <buffer> rr :/=====<CR>zz:noh<CR>
    nmap <buffer> rk :call DiffApplyTop()<CR>rr
    nmap <buffer> rj :call DiffApplyBottom()<CR>rr
endfunc!

command!
    \ Diff
    \ call DiffEnable()

func! VerboseToggle()
     if !&verbose
        set verbosefile=~/.log/vim/verbose.log
        set verbose=15
    else
        set verbose=0
        set verbosefile=
    endif
endfunc!

command!
    \ Verbose
    \ call VerboseToggle()


nmap Y yy

augroup setup_colorscheme
    au!
    au VimEnter * call _setup_colorscheme()
augroup end

nnoremap <silent> <Leader>/ :noh<CR>
nnoremap <leader>f /\v^func\s+.*\zs

func! _get_github_link()
    silent call system("github-link " . expand('%:p') . " " . line('.'))
endfunc!

nnoremap <Leader>g :call _get_github_link()<CR>

func! _fzf_github()
    silent call system("fzf-github")
endfunc!

nnoremap <Leader>i :call _fzf_github()<CR>

func! _prompt_new_file_where_current_file()
    execute "normal :e"
endfunc!

nnoremap <Leader>x :vsp <C-R>=expand('%:h')<CR>/
nnoremap <Leader>t :vsp<Space>

inoremap <expr> <DOWN> coc#pum#visible() ? coc#pum#next(1) : "\<DOWN>"
inoremap <expr> <UP>   coc#pum#visible() ? coc#pum#prev(1) : "\<UP>"
