"
"Plug 'kovetskiy/vim-hacks'

"let g:vim_indent_cont = shiftwidth()

"Plug 'kovetskiy/fzf.vim'
    "let g:fzf_prefer_tmux = 1
    "au operations FileType * let g:fzf#vim#default_layout  = {'bottom': '10%'}
    "let $FZF_DEFAULT_COMMAND = 'prols'
    "func! _ctrlp()
        "call _snippets_stop()
        "exec 'FZF'
    "endfunc!

    "func! _ctrlp_buffers()
        "call _snippets_stop()
        "exec 'Buffers'
    "endfunc!

    "nnoremap <C-G> :call _ctrlp_buffers()<CR>
    "map <silent> <c-t> :call _ctrlp()<CR>
    "

"Plug 'itchyny/lightline.vim'
    "source ~/dotfiles/vim.d/46-lightline.vim

Plug 'kovetskiy/synta'
    let g:synta_go_highlight_calls = 0
    let g:synta_go_highlight_calls_funcs = 1
    let g:synta_use_sbuffer = 0
    let g:synta_use_go_fast_build = 0
    let g:synta_go_build_recursive = 1

Plug 'fatih/vim-go', {'for': 'go'}
    let g:go_fmt_command = "goimports"
    let g:go_rename_command = 'gopls'
    let g:go_snippet_engine = "skip"
    let g:go_fmt_autosave = 0
    let g:go_fmt_fail_silently = 1
    let g:go_metalinter_command="gometalinter -D golint --cyclo-over 15"
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_template_autocreate = 0
    let g:go_def_mapping_enabled = 0
    let g:go_def_mode = 'godef'

    let g:go_list_type = "quickfix"

    func! _goto_prev_func()
        call search('^func ', 'b')
        nohlsearch
        normal zt
    endfunc!

    func! _goto_next_func()
        call search('^func ', '')
        nohlsearch
        normal zt
    endfunc!

    augroup vim_go_custom
        au!
        au FileType go nmap <buffer> <Leader>h :GoDoc<CR>
        "au FileType go nmap <silent><buffer> gd :GoDef<CR>
        au FileType go nmap <silent><buffer> gl :call go#def#Jump('vsplit', 0)<CR>
        au FileType go nmap <silent><buffer> gk :call go#def#Jump('split', 0)<CR>

        au FileType go nmap <silent><buffer> <C-Y> :w<CR>:call synta#go#build()<CR>
        au FileType go imap <silent><buffer> <C-Y> <ESC>:w<CR>:call synta#go#build()<CR>
    augroup end

    let g:go_bin_path = $GOPATH . "/bin"

    "let g:go_auto_type_info = 0
    "let g:go_gocode_autobuild = 1
    "let go_auto_sameids = 1
    "let g:go_doc_keywordprg_enabled = 0

    "func! _remove_go_dummy_syn()
        "syn clear goImaginary
        "syn clear goImaginaryFloat
        "syn clear goFloat
        "syn clear goDecimalInt
        "syn clear goHexadecimalInt
        "syn clear goOctalInt
        "syn clear goOctalError

        "syn clear goSingleDecl
    "endfunc!

    "au operations BufEnter *.go call _remove_go_dummy_syn()

    "au operations FileType go nmap <buffer><silent> <C-Q> :call _goto_prev_func()<CR>

    "au operations FileType go let w:go_stack = 'fix that shit'
    "au operations FileType go let w:go_stack_level = 'fix that shit'
    "au operations FileType go nmap <silent><buffer> gd :GoDef<CR>
    "au operations FileType go nmap <silent><buffer> gl :call go#def#Jump('vsplit')<CR>
    "au operations FileType go nmap <silent><buffer> gk :call go#def#Jump('split')<CR>

    "au operations FileType go nmap <silent><buffer> <c-p> :call synta#go#build()<CR>
    "au operations FileType go imap <silent><buffer> <c-p> <ESC>:w<CR>:call synta#go#build()<CR>

Plug 'vim-scripts/l9'

Plug 'seletskiy/ultisnips'
    let g:UltiSnipsJumpForwardTrigger="<C-J>"
    let g:UltiSnipsJumpBackwardTrigger="<C-K>"

    let g:UltiSnipsUsePythonVersion = 3

    let g:snippets_dotfiles = $HOME . '/.vim/snippets/'
    let g:snippets_reconquest = $HOME . '/.vim/bundle/snippets/'

    let g:UltiSnipsSnippetDirectories = [
    \      g:snippets_reconquest,
    \      g:snippets_dotfiles,
    \]

    let g:UltiSnipsEnableSnipMate = 0
    let g:UltiSnipsExpandTrigger = '<nul>'
    let g:UltiSnipsEditSplit="horizontal"

    func! _snippets_stop()
        python "UltiSnips_Manager._leave_buffer()"
    endfunc!

    func! _snippets_get_filetype()
        let l:dot = strridx(&filetype, ".")
        if l:dot != -1
            return strpart(&filetype, 0, dot)
        endif

        return &filetype
    endfunc!

    func! _snippets_open_dotfiles()
        split
        execute "edit" g:snippets_dotfiles .
            \ _snippets_get_filetype() . ".snippets"
    endfunc!

    func! _snippets_open_reconquest()
        split
        execute "edit" g:snippets_reconquest .
            \ _snippets_get_filetype() .  ".snippets"
    endfunc!

    nnoremap <C-E><C-D> :call _snippets_open_dotfiles()<CR>
    nnoremap <C-E><C-S> :call _snippets_open_reconquest()<CR>

    smap <C-E> <C-V><ESC>a
    smap <C-B> <C-V>o<ESC>i

    au operations FileType snippets set textwidth=0

Plug 'tpope/vim-surround'

Plug 'danro/rename.vim'
    nnoremap <Leader><Leader>r :noautocmd Rename<Space>

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    au operations BufRead,BufNewFile *.md set filetype=markdown
    au operations BufRead,BufNewFile *.md set fo-=l
    let g:vim_markdown_folding_disabled=0

Plug 'AndrewRadev/sideways.vim'
    nnoremap <leader>h :SidewaysLeft<cr>
    "nnoremap <leader>l :SidewaysRight<cr>

Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

Plug 'justinmk/vim-sneak'
    " bullshit
    nmap <nop><C-E><C-S>S <Plug>Sneak_s
    vmap <nop><C-E><C-S>s <Plug>Sneak_s
    nmap <C-E><C-S><C-S> <Plug>Sneak_S
    vmap <C-E><C-S><C-S> <Plug>Sneak_S

    nmap f <Plug>Sneak_f
    nmap F <Plug>Sneak_F
    xmap f <Plug>Sneak_f
    xmap F <Plug>Sneak_F
    omap f <Plug>Sneak_f
    omap F <Plug>Sneak_F
    "replace 't' with 1-char Sneak
    nmap t <Plug>Sneak_t
    nmap T <Plug>Sneak_T
    xmap t <Plug>Sneak_t
    xmap T <Plug>Sneak_T
    omap t <Plug>Sneak_t
    omap T <Plug>Sneak_T

Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
    vnoremap <C-T> :Tabularize /

Plug 'reconquest/snippets'

Plug 'kovetskiy/vim-empty-lines'
    nnoremap <silent> <Leader><Leader>j :call DelEmptyLineBelow()<CR>
    nnoremap <silent> <Leader><Leader>k :call DelEmptyLineAbove()<CR>
    nnoremap <silent> <Leader>j :call AddEmptyLineBelow()<CR>
    nnoremap <silent> <Leader>k :call AddEmptyLineAbove()<CR>

Plug 'kovetskiy/vim-plugvim-utils', {'on': 'NewPlugFromClipboard'}
    nnoremap <Leader><Leader>c :call NewPlugFromClipboard()<CR>

Plug 'kovetskiy/vim-ski'
    let g:skeletons_dir=$HOME . '/.vim/skeletons/'

    au operations BufRead,BufNewFile */bin/* set ft=sh

Plug 'bronson/vim-trailing-whitespace'
    let g:extra_whitespace_ignored_filetypes = [
        \ 'diff', 'markdown', 'go'
    \ ]

    func! _whitespaces_fix()
        if ShouldMatchWhitespace()
            FixWhitespace
        endif
    endfunc!

    au operations BufWritePre * call _whitespaces_fix()

Plug 'sjl/gundo.vim', { 'on': 'GundoShow' }

Plug 'kovetskiy/kb-train', { 'on': 'Train' }

Plug 'justinmk/vim-syntax-extra', { 'for': 'c' }

Plug 'seletskiy/ashium'

Plug 'yssl/QFEnter'

Plug 'kovetskiy/next-indentation'
    nnoremap <C-z> :IndentationSameUp<CR>
    nnoremap <C-x> :IndentationSameDown<CR>

Plug 'rust-lang/rust.vim', {'for': 'rust' }

Plug 'rhysd/vim-go-impl'

Plug 'wellle/targets.vim'

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

Plug 'kovetskiy/vim-bash'
    "nmap gd <C-]>

    "func! _tags_sh()
    "    if &ft != "sh"
    "        return
    "    endif

    "    let tagfiles = tagfiles()
    "    if len(tagfiles) > 0
    "        let tagfile = tagfiles[0]
    "        silent execute "!tags-sh " . tagfile . " >/dev/null 2>&1 &"
    "    endif
    "endfunc!

    "au operations BufWritePost * call _tags_sh()

Plug 'FooSoft/vim-argwrap', {'on': 'ArgWrap'}
    au operations BufRead,BufNewFile *.go let b:argwrap_tail_comma = 1

    func! _search_wrappable()
        let l:bracket = '\([^\)]'
        let l:squares = '\[[^\]]'
        let l:braces  = '\{[^\}]'
        let l:pattern = '\v[^ ](' . l:bracket . '|' . l:squares . '|' . l:braces . ')'

        call search(l:pattern, 'cs')
    endfunc!
    nnoremap <silent> @l :call _search_wrappable()<CR>ll:ArgWrap<CR>
    nnoremap <silent> @; :ArgWrap<CR>
    func! _chain_wrap()
        let match = search(').', 'cs', line('.'))
        if match == 0
            return
        endif
        call cursor(match, 0)
        exec "normal" "lli\r"
        call _chain_wrap()
    endfunc!

    nnoremap <silent> @h :call _chain_wrap()<CR>

Plug 'kovetskiy/sxhkd-vim'

Plug 'PotatoesMaster/i3-vim-syntax', {'for': 'i3'}

Plug 'ddrscott/vim-side-search'
    nnoremap <Leader>s :SideSearch<space>

    func! _random_line()
        execute 'normal! '.(system('/bin/bash -c "echo -n $RANDOM"') % line('$')).'G'
        normal zz
    endfunc!

    "noremap <silent> <Tab>   :bNext<CR>:call _random_line()<CR>
    "noremap <silent> <S-Tab> :bprev<CR>:call _random_line()<CR>

Plug 'lambdalisue/gina.vim'

Plug 'rhysd/vim-crystal'

Plug 'mg979/vim-visual-multi'
    let g:VM_no_meta_mappings = 1
    let g:VM_maps = {
    \ 'Select All': '<C-A>',
    \ }
    let g:VM_leader = "\\"

    fun! VM_before_auto()
        call MacroBefore()
    endfun

    fun! VM_after_auto()
        call MacroAfter()
    endfun

    function! MacroBefore(...)
        unmap f
        unmap F
        unmap t
        unmap T
        unmap ,
        unmap ;
    endfunction!

    function! MacroAfter(...)
        map f <Plug>Sneak_f
        map F <Plug>Sneak_F
        map t <Plug>Sneak_t
        map T <Plug>Sneak_T
        map , <Plug>Sneak_,
        map ; <Plug>Sneak_;
    endfunction!

Plug 'tmhedberg/matchit'

Plug 'markonm/traces.vim'
    nnoremap M :%s/\C\V<C-R>=expand('<cword>')<CR>/
    nnoremap H :%s/\v
    vnoremap H :s/\v
    nmap L VH

Plug 'lambdalisue/gina.vim'
    let g:gina#command#blame#formatter#format="%su%=%au on %ti %ma%in"

Plug 'tpope/vim-dispatch'
    func! _setup_java()
        setlocal errorformat=[ERROR]\ %f:[%l\\,%v]\ %m
    endfunc!

    au operations FileType java call _setup_java()
    au operations FileType java nmap <silent><buffer> <c-p> :Make<CR>
    au operations FileType java nmap <silent><buffer> ; :cn<CR>
    au operations FileType java nmap <silent><buffer> <Leader>; :cN<CR>

"if has('nvim')
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "set guicursor=
"else
    "Plug 'Shougo/deoplete.nvim'
"endif

"Plug 'fishbullet/deoplete-ruby'
"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'

"Plug 'zchee/deoplete-go', { 'do': 'make'}
"let g:deoplete#enable_at_startup = 1

"func! _setup_deoplete()
    "call deoplete#custom#source(
        "\ '_', 'min_pattern_length', 1)

    "call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
    "call deoplete#custom#source('_', 'sorters', [])

    "" unlimited candidate length
    "call deoplete#custom#source('_', 'max_kind_width', 0)
    "call deoplete#custom#source('_', 'max_menu_width', 0)
    "call deoplete#custom#source('_', 'max_abbr_width', 0)
"endfunc!

"augroup _setup_deoplete
    "au!
    "au VimEnter * call _setup_deoplete()
"augroup end

"Plug 'Valloric/YouCompleteMe'
    "let g:ycm_server_python_interpreter = '/usr/bin/python3'
    "let g:ycm_show_diagnostics_ui = 0
    "let g:ycm_confirm_extra_conf = 0
    "let g:ycm_key_list_previous_completion=['<UP>']
    "let g:ycm_key_list_select_completion=['<DOWN>']

    "let g:ycm_collect_identifiers_from_tags_files = 1
    "let g:ycm_collect_identifiers_from_comments_and_strings = 1

    "let g:ycm_seed_identifiers_with_syntax = 1
    "let g:ycm_use_ultisnips_completer = 0

"if has('nvim')
    "Plug 'zchee/nvim-go', { 'do': 'make'}
"else

Plug 'terryma/vim-multiple-cursors'
    function! Multiple_cursors_before()
        let b:deoplete_disable_auto_complete = 1
    endfunction

    function! Multiple_cursors_after()
        let b:deoplete_disable_auto_complete = 0
    endfunction

Plug 'kovetskiy/urxvt.vim'
    au operations FileType go nmap <buffer>
        \ <Leader>h :call urxvt#put('go build')<CR>

Plug 'klen/python-mode', {'for': 'python'}
    let g:pymode_rope_complete_on_dot = 0
    let g:pymode_lint = 1
    let g:pymode_lint_on_write = 1
    let g:pymode_run = 0
    let g:pymode_rope_lookup_project = 0
    let g:pymode_rope_project_root = $HOME . '/ropeproject/'
    let g:pymode_folding = 0

Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }

"Plug 'kovetskiy/ycm-sh', {'for': 'sh'}

"Plug 'seletskiy/vim-autosurround'
    "func! _ultisnips_enter()
        "let v:char="	"
        "call UltiSnips#TrackChange()
        "let v:char=""
        "call UltiSnips#TrackChange()
        "return """
    "endfunc!

    "nnoremap o o<C-R>=_ultisnips_enter()<CR>
    "nnoremap O O<C-R>=_ultisnips_enter()<CR>

    "au User _overwrite_matchem
        "\ au VimEnter,BufEnter,FileType *
        "\ inoremap <CR> <C-R>=g:MatchemExpandCr(1)<CR><C-R>=_ultisnips_enter()<CR>

    "au User _overwrite_matchem
        "\ au VimEnter,BufEnter,FileType *
        "\ inoremap <buffer> ( (<C-R>=AutoSurround(")") ? "" : g:MatchemMatchStart()<CR>

    "au User _overwrite_matchem
        "\ autocmd VimEnter,BufEnter,FileType * call AutoSurroundInitMappings()


    "au User plugins_loaded doau User _overwrite_matchem
    "doau User _overwrite_matchem

Plug 'kovetskiy/vim-autoresize'

Plug 'romainl/vim-cool'

Plug 'vim-ruby/vim-ruby'
    func! _setup_ruby()
        setlocal shiftwidth=2
        setlocal cc=120
    endfunc!

    au operations BufRead,BufNewFile *.rb call _setup_ruby()

"Plug 'kovetskiy/vim-cucu'

Plug 'seletskiy/vim-nunu'

Plug 'seletskiy/matchem'
    au User _overwrite_matchem
        \ au VimEnter,BufEnter,FileType *
        \ inoremap <expr> <DOWN>  pumvisible() ? "\<C-N>" : "\<DOWN>"

    au User _overwrite_matchem
        \ au VimEnter,BufEnter,FileType *
        \ inoremap <expr> <UP>    pumvisible() ? "\<C-P>" : "\<UP>"

    doau User _overwrite_matchem
Plug 'ruby-formatter/rufo-vim'

Plug 'fvictorio/vim-extract-variable'

"Plug 'tasn/vim-tsx'
"Plug 'chr4/nginx.vim'
"Plug 'vim-syntastic/syntastic', {'for': 'swift'}
"Plug 'keith/swift.vim', {'for': 'swift'}

"if $BACKGROUND == "light"
    "Plug 'nightsense/seagrey'
    "Plug 'NLKNguyen/papercolor-theme'
    "Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim'}
    "Plug 'rakr/vim-one'

    "func! _setup_colorscheme()
        "set background="light"
        "colorscheme PaperColor
    "endfunc!
"endif
"Plug 'marijnh/tern_for_vim', {'for': 'js'}
    "au operations BufNewFile,BufRead *.js setlocal noet

"Plug 'elzr/vim-json', { 'for': 'json' }
    "au operations BufNewFile,BufRead *.json set filetype=json

