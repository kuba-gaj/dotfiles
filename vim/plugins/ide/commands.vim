Plug 'thaerkh/vim-workspace'
nnoremap <leader>wo :ToggleWorkspace<CR>
let g:workspace_session_directory = $HOME . '/.vim/sessions/'

" function CloseHiddenBuffers

" let g:workspace_persist_undo_history = 1  " enabled = 1 (default), disabled = 0
" let g:workspace_undodir='.undodir'

" autosave always on, even outside of a session
" let g:workspace_autosave_always = 1

" disable autosave in workspace
" let g:workspace_autosave
