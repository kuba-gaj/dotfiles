" ### Mappings
" ##
let mapleader="\<SPACE>"
" Confirm quit
noremap <silent> <C-q> :confirm qall<CR>
" Y should behave like D and C, from cursor till end of line
noremap Y y$
nnoremap <C-n> :nohlsearch<CR>

" Move vertically by visual line unless preceded by a count. If a movement is
" greater than 5 then automatically add to the jumplist.
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" ## Window management
" Navigate buffers via 'wildmenu'
nnoremap <leader><Tab> :buffer<Space><Tab>
nnoremap <silent> <leader>s :split<CR>
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <silent> <leader>t :$tabnew<CR>
nnoremap <silent> <leader>q :close<CR>
" Zoom to new tab
nnoremap <silent> <leader>Z :tab split<CR>

" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ## Function keys
nnoremap <leader>5 :vsplit $MYVIMRC<CR>
nnoremap <leader>6 :source $MYVIMRC<CR>
" ### Plugins
if has('nvim') && empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ### Mappings
call plug#begin('~/.local/share/nvim/plugged')
" todo: autopairs?
" vim unimpaired
" learn jumplists
" learn quickfix (toggle with leader leader?)
" vim gitgutter (coc?)
" vim fugitive + rhubarb
" ack.vim
" options from vscode
" ale:
"   move config per filetype
"   report issue with bg color
" try switching to minplug (maybe for vim config?)

Plug 'tpope/vim-commentary'
" support for other file types
" autocmd FileType apache setlocal commentstring=#\ %s
Plug 'tpope/vim-surround'
Plug 'takac/vim-hardtime'
  let g:hardtime_default_on = 0
  let g:hardtime_showmsg = 0
  let g:hardtime_timeout = 500
  let g:hardtime_ignore_quickfix = 1
  let g:hardtime_allow_different_key = 1
  let g:hardtime_maxcount = 2
Plug 'machakann/vim-highlightedyank'
  let g:highlightedyank_highlight_duration = 444
Plug 'sheerun/vim-polyglot'
Plug 'ntpeters/vim-better-whitespace'
  " let g:better_whitespace_ctermcolor='#DC322F'
Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-sneak'
  let g:sneak#label = 1
  map f <Plug>Sneak_f
  map F <Plug>Sneak_F
  map t <Plug>Sneak_t
  map T <Plug>Sneak_T
Plug 'lifepillar/vim-solarized8'
Plug 'junegunn/fzf.vim'
  " let g:fzf_layout = { "window": "silent botright 16split enew" }
  let g:fzf_commits_log_options = '--graph --color=always
    \ --format="%C(yellow)%h%C(red)%d%C(reset)
    \ - %C(bold green)(%ar)%C(reset) %s %C(blue){%an}%C(reset)"'
  " [Buffers] Jump to the existing window if possible
  let g:fzf_buffers_jump = 1
  nnoremap <silent> <C-p> :FZF<CR>
  " todo: needs coc-nvim
  " nnoremap <silent> <C-p> :Files<CR>
  " nnoremap <silent> <C-P> :Commands<CR>
" nnoremap <silent> <Space>-       :Files <C-r>=expand("%:h")<CR>/<CR>
" nnoremap <silent> <Space>'       :Marks<CR>
" nnoremap <silent> <Space>,       :Buffers<CR>
" nnoremap <silent> <Space>]       :Tags<CR>
" nnoremap <silent> <Space>b]      :BTags<CR>
" nnoremap <silent> <Space>c       :Commits<CR>
" nnoremap <silent> <Space>bc      :BCommits<CR>
" nnoremap <silent> <Space>h       :Helptags<CR>
" nnoremap <silent> <Space>s       :Snippets<CR>
" nnoremap <silent> <Space>m       :Maps<CR>
  nnoremap          \f             :Rg<Space>
" nnoremap <silent> \l             :Lines<CR>
" nnoremap <silent> \bl            :BLines<CR>

Plug 'airblade/vim-gitgutter'
  let g:gitgutter_override_sign_column_highlight = 0

" ----------------------------------------------------------------------------
" ALE
" ----------------------------------------------------------------------------
Plug 'w0rp/ale'
let g:airline#extensions#ale#enabled = 0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_disable_lsp = 1

" ALE automatically updates the loclist which makes it impossible to use some
" other plugins such as GV
" let g:ale_set_loclist = 0

" let g:ale_set_highlights = 0
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" highlight clear ALEError
" highlight clear ALEWarning
" highlight link ALEErrorSign LineNumber
" highlight link ALEWarningSign LineNumber
highlight link ALEWarningSign Directory
highlight link ALEErrorSign WarningMsg
" conflicts with nerd
" nnoremap <silent> <leader>ne :ALENextWrap<CR>
" nnoremap <silent> <leader>pe :ALEPreviousWrap<CR>
" nmap <silent> <leader>ep <Plug>(ale_previous_wrap)
" nmap <silent> <leader>en <Plug>(ale_next_wrap)
nmap <silent> <leader>ep <Plug>(ale_previous_wrap)
nmap <silent> <leader>en <Plug>(ale_next_wrap)

let g:ale_fixers = {
      \   'javascript': ['prettier', 'eslint'],
      \   'javascript.jsx': ['prettier', 'eslint'],
      \   'json': ['prettier'],
      \   'scss': ['prettier'],
      \   'bash': ['shfmt'],
      \   'zsh': ['shfmt'],
      \}

let g:ale_sh_shfmt_options = '-i 2 -ci'
let g:ale_fix_on_save = 1


Plug 'itchyny/lightline.vim'
  let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ],
        \   'right': [ [ 'lineinfo' ],
        \              [ 'percent' ],
	\              [ 'filetype' ],
  	\              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head',
        \   'filename': 'LightlineFilename',
        \   'cocstatus': 'StatusDiagnostic'
        \ },
        \ 'component_expand': {
	\   'linter_checking': 'lightline#ale#checking',
	\   'linter_warnings': 'lightline#ale#warnings',
	\   'linter_errors': 'lightline#ale#errors',
	\   'linter_ok': 'lightline#ale#ok',
        \ },
        \ 'component_type': {
        \   'linter_checking': 'left',
        \   'linter_warnings': 'warning',
        \   'linter_errors': 'error',
        \   'linter_ok': 'left',
        \ },
        \ }

  function! LightlineReload()
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  endfunction

  function! LightlineFilename()
    return winwidth(0) > 80 ? expand('%:f') : expand('%:t')
  endfunction

  function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
      call add(msgs, 'E' . info['error'])
    endif
    if get(info, 'warning', 0)
      call add(msgs, 'W' . info['warning'])
    endif
    return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
  endfunction

  command! LightlineReload call LightlineReload()
  command! StatusDiagnostic call StatusDiagnostic()
"

Plug 'maximbaz/lightline-ale'

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

augroup CocConfig
  autocmd!
  " coc-highlight: enable highlighting for symbol under cursor
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END


Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  " let g:NERDTreeDirArrowExpandable  = "+"
  " let g:NERDTreeDirArrowCollapsible = "⠶"
  let g:NERDTreeShowHidden = 1
  let NERDTreeHijackNetrw           = 0
  let NERDTreeStatusline            = " NERDTree "
  noremap <silent> <leader>nt :NERDTreeToggle<CR> <C-w>=
  noremap <silent> <leader>f :NERDTreeFind<CR> <C-w>=
  autocmd! BufEnter * call NERDTreeRefresh()
  function! NERDTreeRefresh()
    if &filetype == "nerdtree"
      silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
  endfunction

Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✗",
        \ "Staged"    : "✓",
        \ "Dirty"     : "*",
        \ "Untracked" : "?",
        \ "Renamed"   : "→"
        \ }
  let g:NERDTreeUpdateOnCursorHold = 0
  let g:NERDTreeUpdateOnWrite      = 0

" highlight file icons with different colors
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" File icons in vim --- keep at the bottom, below airline, nerdtree and startify
Plug 'ryanoasis/vim-devicons'

call plug#end()

" ### Settings
set autowrite       " Auto-save on switching buffers
set cursorline			" Highlight the line with the cursor
set expandtab       " Convert tab to space
set gdefault			  " Always do global substitutes
set mouse=a			    " Mouse support
set mousehide			  " Hide mouse when typing text
set noswapfile			" No backup files
set number			    " Show line numbers
set relativenumber	" Show relative line numbers
set shiftwidth=2   	" indent size in normal mode, same as softtabstop
set showbreak=↳			" Use this to wrap long lines
set smartcase			  " Case-smart searching
set softtabstop=-1  " Number of spaces to replace tab with, -1=shiftwidth
set splitbelow      " Split below current window
set splitright      " Split window to the right
set tabstop=2       " width of <tab>
" Be aware, termguicolors results in `:terminal` colors that are slightly off.
"   https://github.com/neovim/neovim/issues/7018
if has("termguicolors")
  set termguicolors " Enable 24-bit color support if available
endif
set undofile			" undo persistence 

" ## Theme
set background=light
colorscheme solarized8
