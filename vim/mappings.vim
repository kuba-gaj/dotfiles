
" emulate the "system clipboard" shortcuts
" :inoremap <C-v> <ESC>"+pa
" :vnoremap <C-c> "+y
" :vnoremap <C-d> "+d

"===========================================================
" MAPPINGS
"===========================================================

"-----------------------------
" Core mappings
"-----------------------------
let mapleader = ","
" original ";" and "," with Alt
nnoremap <A-;> ;
nnoremap <A-,> ,

" Temporary workaround for: https://github.com/neovim/neovim/issues/1716
if has("nvim")
  command! W w !sudo -n tee % > /dev/null || echo "Press <leader>w to authenticate and try again"
  map <leader>w :new<cr>:term sudo true<cr>
else
  command! W w !sudo tee % > /dev/null
endif

" cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enter command mode via ';'
nnoremap ; :
" Make dot work on visual line selections.
xnoremap . :norm.<CR>
" 'qq' starts a macro recording, 'q' stops it, Q runs the macro.
nnoremap Q @q
" Execute macro 'q' over the visual selection.
xnoremap Q :'<,'> :normal @q<CR>
" Y should behave like D and C, from cursor till end of line.
noremap Y y$
if has("nvim")
    " Make escape work in the Neovim terminal.
    tnoremap <Esc> <C-\><C-n>
endif
" Confirm quit.
noremap <silent> <C-q> :confirm qall<CR>

"-----------------------------
" Navigation mappings
"-----------------------------
" should be provided by tmux-vim-navigator
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
if has("nvim")
    " Use same mappings as above to navigate Neovim terminal splits.
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l
endif
" Move vertically by visual line unless preceded by a count. If a movement is
" greater than 5 then automatically add to the jumplist.
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
" Navigate buffers via 'wildmenu'.
nnoremap <leader><Tab> :buffer<Space><Tab>
" Navigate the jumplist.
nnoremap [j <C-o>zz
nnoremap ]j <C-i>zz
" Mapping that scrolls the window when wrapping is in effect.
nnoremap [z zH
nnoremap ]z zL

"-----------------------------
" Window managment mappings
"-----------------------------
nnoremap <silent> <leader>s  :split<CR>
nnoremap <silent> <leader>v  :vsplit<CR>
nnoremap <silent> <leader>-  :botright new<CR><C-w>=
nnoremap <silent> <leader>\| :botright vnew<CR><C-w>=
nnoremap <silent> <leader>b  :botright new<CR><C-w>=:terminal<CR>
nnoremap <silent> <leader>q  :close<CR>
nnoremap <silent> <leader>t  :$tabnew<CR>p
nnoremap <silent> <C-g>s     :split<CR>
nnoremap <silent> <C-g>v     :vsplit<CR>
nnoremap <silent> <C-g>-     :botright new<CR><C-w>=
nnoremap <silent> <C-g>\|    :botright vnew<CR><C-w>=
nnoremap <silent> <C-g>b     :botright new<CR><C-w>=:terminal<CR>
nnoremap <silent> <C-g>q     :close<CR>
nnoremap <silent> <C-g>t     :$tabnew<CR>
inoremap <silent> <C-g>s     <Esc>:split<CR>
inoremap <silent> <C-g>v     <Esc>:vsplit<CR>
inoremap <silent> <C-g>-     <Esc>:botright new<CR><C-w>=
inoremap <silent> <C-g>\|    <Esc>:botright vnew<CR><C-w>=
inoremap <silent> <C-g>b     <Esc>:botright new<CR><C-w>=:terminal<CR>
inoremap <silent> <C-g>q     <Esc>:close<CR>
inoremap <silent> <C-g>t     <Esc>:$tabnew<CR>
nnoremap <leader>1           1gt
nnoremap <leader>2           2gt
nnoremap <leader>3           3gt
nnoremap <leader>4           4gt
nnoremap <leader>5           5gt
nnoremap <leader>6           6gt
nnoremap <leader>7           7gt
nnoremap <leader>8           8gt
nnoremap <leader>9           9gt
nnoremap <C-g>1              1gt
nnoremap <C-g>2              2gt
nnoremap <C-g>3              3gt
nnoremap <C-g>4              4gt
nnoremap <C-g>5              5gt
nnoremap <C-g>6              6gt
nnoremap <C-g>7              7gt
nnoremap <C-g>8              8gt
nnoremap <C-g>9              9gt
inoremap <C-g>1              <Esc>1gt
inoremap <C-g>2              <Esc>2gt
inoremap <C-g>3              <Esc>3gt
inoremap <C-g>4              <Esc>4gt
inoremap <C-g>5              <Esc>5gt
inoremap <C-g>6              <Esc>6gt
inoremap <C-g>7              <Esc>7gt
inoremap <C-g>8              <Esc>8gt
inoremap <C-g>9              <Esc>9gt
nnoremap <leader>=           <C-w>=
nnoremap <leader>R           <C-w>r
" Zoom the current file into a standalone new tab.
nnoremap <silent> <leader>Z  :tab split<CR>
if has("nvim")
    tnoremap <silent> <C-g>s  <C-\><C-N>:split<CR>
    tnoremap <silent> <C-g>v  <C-\><C-N>:vsplit<CR>
    tnoremap <silent> <C-g>-  <C-\><C-N>:botright new<CR><C-w>=
    tnoremap <silent> <C-g>\| <C-\><C-N>:botright vnew<CR><C-w>=
    tnoremap <silent> <C-g>b  <C-\><C-N>:botright new<CR><C-w>=<C-\><C-N>:terminal<CR>
    tnoremap <silent> <C-g>q  <C-\><C-N>:close<CR>
    tnoremap <silent> <C-g>t  <C-\><C-N>:$tabnew<CR>
    tnoremap <C-g>1           <C-\><C-N>1gt
    tnoremap <C-g>2           <C-\><C-N>2gt
    tnoremap <C-g>3           <C-\><C-N>3gt
    tnoremap <C-g>4           <C-\><C-N>4gt
    tnoremap <C-g>5           <C-\><C-N>5gt
    tnoremap <C-g>6           <C-\><C-N>6gt
    tnoremap <C-g>7           <C-\><C-N>7gt
    tnoremap <C-g>8           <C-\><C-N>8gt
    tnoremap <C-g>9           <C-\><C-N>9gt
endif

"-----------------------------
" Function key mappings
"-----------------------------
"
" Double up function key mappings with <Space>+number mappings for
" touchbar Macbooks which have no physical function keys.
"<F1> - unused
nnoremap <F2>     :w<CR>
nnoremap <Space>2 :w<CR>
nnoremap <F3>     :%retab<CR> :%s/\s\+$//<CR>
nnoremap <Space>3 :%retab<CR> :%s/\s\+$//<CR>
nnoremap <F4>     :%s/ /_<CR>
nnoremap <Space>4 :%s/ /_<CR>
nnoremap <F5>     :call Spelling()<CR>
nnoremap <Space>5 :call Spelling()<CR>
nnoremap <F6>     :source $MYVIMRC<CR>
nnoremap <Space>6 :source $MYVIMRC<CR>
nnoremap <F7>     :set lazyredraw!<CR>:call AutoSaveToggle()<CR>
nnoremap <Space>7 :set lazyredraw!<CR>:call AutoSaveToggle()<CR>
"<F8> - unused
"<F9> - unused
nnoremap <Space>9 :set hlsearch!<CR>
"<F10> - unused
nnoremap <Space>0 :call Listing()<CR>
nnoremap <F11>    :set hlsearch!<CR>
nnoremap <F12>    :call Listing()<CR>

"-----------------------------
" Misc mappings
"-----------------------------
"
" Format current paragraph.
nnoremap <leader>Q gqip
" Fold the current indent.
nnoremap <leader>z za
" Recalculate syntax highlighting for the entire file.
nnoremap <Space>S  :syntax sync fromstart<CR>
" Center navigation commands.
noremap n  nzz
noremap N  Nzz
noremap ]s ]szz
noremap [s [szz
" Yank/paste/delete helper mappings.
" - Copy into the 'y' register from the clipboard register
noremap  <leader>c :let @y=@*<CR>
" - Yank into the 'y' register
noremap <leader>y  "yy
" - Paste from the 'y' register
noremap <leader>p  "yp
noremap <leader>P  "yP
" - Delete into the 'black hole' register
noremap <leader>x  "_x
noremap <leader>d  "_d
" Remap refresh from Ctrl-l, now taken by split navigation, to Alt-l.
if has("gui_running") || has("nvim")
    nnoremap <A-l> :redraw!<CR>
else
    nnoremap l :redraw!<CR>
endif
" Nicer completion mappings when in insert mode.
" - ]     - 'tags' file completion
" - Space - context aware language completion (via 'omnifunc' setting)
" - c     - context aware term completion (repeat to continue adding matches)
" - d     - dictionary completion (via 'dictionary' setting)
" - f     - file path completion
" - l     - line completion (repeat an existing line)
" inoremap <C-]>     <C-x><C-]>
" inoremap <C-Space> <C-x><C-o>
" inoremap <C-c>     <C-x><C-p>
" inoremap <C-d>     <C-x><C-k>
" inoremap <C-f>     <C-x><C-f>
" inoremap <C-l>     <C-x><C-l>

" Find & replace helper mappings.
" - Star search that does not move forward to the next match
nnoremap <silent> g* :let @/='\<'.expand('<cword>').'\>'<CR>
xnoremap <silent> g* "sy:let @/=@s<CR>
" - Star search that does an immediate change on the match
nnoremap <silent> \c :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> \c "sy:let @/=@s<CR>cgn
" - Star search and substitute within the current file
nnoremap \s :let @s='\<'.expand('<cword>').'\>'<CR>:%s/<C-r>s//<Left>
xnoremap \s "sy:%s/<C-r>s//<Left>
" - Project-wide star search and substitute using Grepper plugin
" nnoremap \S
"   \ :let @s='\<'.expand('<cword>').'\>'<CR>
"   \ :Grepper -cword -noprompt<CR>
"   \ :cfdo %s/<C-r>s// \| update
"   \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" xmap \S
"   \ "sy
"   \ gvgr
"   \ :cfdo %s/<C-r>s// \| update
"   \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
"
" Accept/reject helpers after completing a '\c' cgn-based change operation
" - Go to the next match and highlight it
nnoremap <Enter> gnzz
" - Accept the change and go to the next match and highlight it
xmap <Enter>     .<Esc>gnzz
" - Reject the change and go to the next match and highlight it
xnoremap !       <Esc>ngnzz
" Nicer increment and decrement mappings.
nnoremap + <C-a>
nnoremap - <C-x>
xnoremap + g<C-a>
xnoremap - g<C-x>
" ~/.inputrc (aka Readline) like mappings for inser mode.
" - Ctrl-a - go to the start of line
" - Ctrl-e - go to the end of the line
" - Alt-b  - back a word
" - Alt-f  - forward a word
" - Alt-BS - delete backward word
" - Alt-d  - delete forward word
" inoremap <C-a>  <C-o>^
" inoremap <C-e>  <C-o>$
" inoremap <A-b>  <C-Left>
" inoremap <A-f>  <C-Right>
" inoremap <A-BS> <C-w>
" inoremap <A-d>  <C-o>dw
" As above but for command mode.
" cnoremap <C-a>  <Home>
" cnoremap <C-e>  <End>
" cnoremap <A-b>  <C-Left>
" cnoremap <A-f>  <C-Right>
" cnoremap <A-BS> <C-w>
" cnoremap <A-d>  <C-Right><C-w>

