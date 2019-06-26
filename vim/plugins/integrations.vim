Plug 'tpope/vim-fugitive'
  nnoremap <silent> <Space>B :Gblame<CR>
  nnoremap <silent> <Space>G :Gstatus<CR>

if has("nvim")
  Plug 'rbgrouleff/bclose.vim'
endif

Plug 'iberianpig/tig-explorer.vim'
  " open tig with current file
  nnoremap <Leader>T :TigOpenCurrentFile<CR>

  " open tig with Project root path
  nnoremap <Leader>ti :TigOpenProjectRootDir<CR>

  " open tig grep
  nnoremap <Leader>tg :TigGrep<CR>

  " resume from last grep
  nnoremap <Leader>tr :TigGrepResume<CR>

  " open tig grep with the selected word
  vnoremap <Leader>tg y:TigGrep<Space><C-R>"<CR>

  " open tig grep with the word under the cursor
  nnoremap <Leader>tcg :<C-u>:TigGrep<Space><C-R><C-W><CR>

" open tig blame with current file
nnoremap <Leader>tb :TigBlame<CR>
Plug 'christoomey/vim-tmux-navigator'
  " Disable tmux navigator when zooming the Vim pane
  let g:tmux_navigator_disable_when_zoomed = 0
