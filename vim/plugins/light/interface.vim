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

if has("nvim")
  Plug 'junegunn/fzf.vim'
    let g:fzf_layout = { "window": "silent botright 16split enew" }
    let g:fzf_commits_log_options = '--graph --color=always
          \ --format="%C(yellow)%h%C(red)%d%C(reset)
          \ - %C(bold green)(%ar)%C(reset) %s %C(blue){%an}%C(reset)"'
    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1
    nnoremap <silent> <Space><Space> :Files<CR>
    nnoremap <silent> <Space>-       :Files <C-r>=expand("%:h")<CR>/<CR>
    nnoremap <silent> <Space>'       :Marks<CR>
    nnoremap <silent> <Space>,       :Buffers<CR>
    nnoremap <silent> <Space>]       :Tags<CR>
    nnoremap <silent> <Space>b]      :BTags<CR>
    nnoremap <silent> <Space>c       :Commits<CR>
    nnoremap <silent> <Space>bc      :BCommits<CR>
    nnoremap <silent> <Space>h       :Helptags<CR>
    nnoremap <silent> <Space>s       :Snippets<CR>
    nnoremap <silent> <Space>m       :Maps<CR>
    nnoremap <silent> <Space>c       :Commands<CR>
    nnoremap          \f             :Rg<Space>
    nnoremap <silent> \l             :Lines<CR>
    nnoremap <silent> \bl            :BLines<CR>

  Plug 'pbogut/fzf-mru.vim'
    nnoremap <silent> <Space>r :FZFMru<CR>

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
endif

Plug 'airblade/vim-gitgutter'

