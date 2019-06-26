Plug 'itchyny/lightline.vim'
  let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ],
        \   'right': [ [ 'lineinfo' ],
        \              [ 'percent' ],
        \              [ 'filetype' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head',
        \   'filename': 'LightlineFilename',
        \   'cocstatus': 'StatusDiagnostic'
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

Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  let g:NERDTreeDirArrowExpandable  = "+"
  let g:NERDTreeDirArrowCollapsible = "⠶"
  let NERDTreeHijackNetrw           = 0
  let NERDTreeStatusline            = " NERDTree "
  noremap <silent> <leader>n :NERDTreeToggle<CR> <C-w>=
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
