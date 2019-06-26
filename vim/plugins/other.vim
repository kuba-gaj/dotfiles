" Sleuth and EditorConfig will adjust style and indent either heuristically
" (former) or explicitly (later). Note, EditorConfig will take precedence if
" a .editorconfig file is found.
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
  let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
Plug 'takac/vim-hardtime'
  let g:hardtime_default_on = 1


