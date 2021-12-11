-- quit
nnoremap('<C-q>q', ':confirm qall<CR>', 'editor', 'quit_config', 'Quits all with confirm')
nnoremap('<leader>q', '<cmd>q<CR>', 'editor', 'quit', 'Quits editor')
nnoremap('<leader>Q', '<cmd>q!<CR>', 'editor', 'quit_force', 'Force quits editor')

-- reload
nnoremap('<leader><CR>', '<cmd>lua reload()<CR>', 'editor', 'reload', 'Reloads configuration')

-- undo
nnoremap('<leader>u', '<cmd>UndotreeToggle<CR>', 'undo', 'undo', 'Toggle undo history')

-- move upper/down on visual
vnoremap('K', '<cmd>m "<-2<CR>gv=gv"', 'remap', 'remap_move_upper_on_visual', 'Move upper on visual')
vnoremap('J', '<cmd>m ">+1<CR>gv=gv"', 'remap', 'remap_move_down_on_visual', 'Move down on visual')

-- move vertically by visual line unless preceded by a count. If a movement is greater than 5 then automatically add to the jumplist.
vim.api.nvim_exec(
[[
  nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
  nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
]], false);

-- deletes in visual
vnoremap('X', '"_d', 'remap', 'remap_deletes_on_visual', 'Deletes on visual')

-- when going to next search, we center screen
nnoremap('n', 'nzzzv', 'remap', 'remap_go_next_search', 'When going to next search, we center screen')
nnoremap('N', 'Nzzzv', 'remap', 'remap_go_previous_serach', 'When going to previous search, we center screen')

-- navigate quick fix
nnoremap(']q', ':cnext<CR>', 'remap', 'remap_next_quickfix', 'Navigate to next quickfix')
nnoremap('[q', ':cprev<CR>', 'remap', 'remap_previous_quickfix', 'Navigate to previous quickfix')

-- yanking
nnoremap('gy', '"+y', 'remap', 'remap_copy_system_clipboard', 'Copy to system clipboard');
nnoremap('gY', '"+Y', 'remap', 'remap_copy_system_clipboard_eol', 'Copy to system clipboard until end of the line');
nnoremap('gp', '"+p', 'remap', 'remap_paste_system_clipboard_P', 'Paste from system clipboard');
nnoremap('gP', '"+P', 'remap', 'remap_paste_system_clipboard_p', 'Paste from system clipboard until end of the line');
vnoremap('gy', '"+y', 'remap', 'remap_copy_system_clipboard_vis', 'Copy to system clipboard');
vnoremap('gY', '"+Y', 'remap', 'remap_copy_system_clipboard_eol_vis', 'Copy to system clipboard until end of the line');
vnoremap('gp', '"+p', 'remap', 'remap_paste_system_clipboard_P_vis', 'Paste from system clipboard');
vnoremap('gP', '"+P', 'remap', 'remap_paste_system_clipboard_p_vis', 'Paste from system clipboard until end of the line');

-- maps c-n / c-t to navigate while searching with /
vim.api.nvim_exec(
[[
cnoremap <expr> <c-n> getcmdtype() =~ '[\/?]' ? '<c-g>' : '<c-n>'
cnoremap <expr> <c-p> getcmdtype() =~ '[\/?]' ? '<c-t>' : '<c-p>'
]], false)

