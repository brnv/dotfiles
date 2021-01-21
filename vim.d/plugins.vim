call plug#begin('~/.vim/bundle')

if $BACKGROUND == "dark"
    Plug 'reconquest/vim-colorscheme'
    func! _setup_colorscheme()
        colorscheme reconquest
    endfunc!
endif

Plug 'kovetskiy/ale'
    let g:ale_enabled = 0
    let g:ale_fixers = {}
    let g:ale_fix_on_save = 0
    let g:ale_linters = {}

Plug 'pangloss/vim-javascript', { 'for': 'js' }
    source ~/dotfiles/vim.d/62-langs-javascript.vim

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
    source ~/dotfiles/vim.d/11-fzf.vim

Plug 'kovetskiy/coc.nvim', {'do': { -> coc#util#install()}}
    "put vim.d settings

Plug 'neoclide/coc-tslint-plugin', {'do': 'yarn install --frozen-lockfile'}

Plug 'reconquest/vim-pythonx', { 'do' : ':UpdateRemotePlugins' }
    let g:pythonx_highlight_completion = 0
    let g:pythonx_go_info_mode = 'coc'

Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'scrooloose/nerdcommenter'
    let g:NERDCustomDelimiters = { 'typescriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' } }

source ~/dotfiles/vim.d/mess.vim

call plug#end()
