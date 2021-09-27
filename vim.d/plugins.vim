call plug#begin('~/.vim/bundle')

if $BACKGROUND == "dark"
    Plug 'reconquest/vim-colorscheme'
    func! _setup_colorscheme()
        colorscheme reconquest
    endfunc!
endif

"source ~/dotfiles/vim.d/mess.vim
"
"

Plug 'kovetskiy/ale'
    let g:ale_enabled = 0
    let g:ale_fixers = {
    \    'json': 'fixjson'
    \}
    let g:ale_fix_on_save = 0
    let g:ale_linters = {}

Plug 'pangloss/vim-javascript', { 'for': 'js' }
    source ~/dotfiles/vim.d/62-langs-javascript.vim

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
    source ~/dotfiles/vim.d/11-fzf.vim

Plug 'kovetskiy/coc.nvim', {'do': { -> coc#util#install()}}
    source ~/dotfiles/vim.d/40-coc.vim

Plug 'neoclide/coc-tslint-plugin', {'do': 'yarn install --frozen-lockfile'}

Plug 'reconquest/vim-pythonx', { 'do' : ':UpdateRemotePlugins' }
    let g:pythonx_highlight_completion = 0
    let g:pythonx_go_info_mode = 'coc'

Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'scrooloose/nerdcommenter'
    let g:NERDCustomDelimiters = { 'typescriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' } }

Plug 'itchyny/lightline.vim'
    source ~/dotfiles/vim.d/46-lightline.vim

Plug 'rakr/vim-one'
Plug 'dracula/vim'

Plug 'lokikl/vim-ctrlp-ag'
    let g:grep_last_query = ""

    func! _grep(query)
        let g:grep_last_query = a:query

        let @/ = a:query
        call fzf#vim#ag(a:query, {'options': '--delimiter : --nth 4..'})
    endfunc!

    func! _grep_word()
        let l:word = expand('<cword>')
        call _grep(l:word)
    endfunc!

    func! _grep_slash()
        let l:slash = strpart(@/, 2)
        call _grep(l:slash)
    endfunc!

    func! _grep_recover()
        call _grep(g:grep_last_query)
    endfunc!

    command! -nargs=* Grep call _grep(<q-args>)

    nnoremap <C-F> :Grep<CR>
    nnoremap <C-E><C-F> :call _grep_word()<CR>

Plug 'danro/rename.vim'

Plug 'sirver/ultisnips', { 'frozen': 1 }
Plug 'reconquest/snippets'
    source /home/operator/dotfiles/source/vim.d/50-snippets.vim

Plug 'kovetskiy/synta'
    let g:synta_go_highlight_calls = 0
    let g:synta_go_highlight_calls_funcs = 1
    let g:synta_use_sbuffer = 0
    let g:synta_use_go_fast_build = 0
    let g:synta_go_build_recursive = 1

Plug 'FooSoft/vim-argwrap', {'on': 'ArgWrap'}

source /home/operator/dotfiles/source/vim.d/63-langs-go.vim

Plug 'tpope/vim-surround'

source ~/dotfiles/vim.d/063-langs-go.vim

call plug#end()
