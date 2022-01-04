local r = require("kg.utils.remaps")
-- quit
r.nnoremap("<C-q>q", ":confirm qall<CR>", "editor", "quit_config", "Quits all with confirm")
r.nnoremap("<leader>q", "<cmd>q<CR>", "editor", "quit", "Quits editor")
r.nnoremap("<leader>Q", "<cmd>q!<CR>", "editor", "quit_force", "Force quits editor")

-- reload
r.nnoremap("<leader><CR>", "<cmd>lua reload()<CR>", "editor", "reload", "Reloads configuration")

-- undo
r.nnoremap("<leader>u", "<cmd>UndotreeToggle<CR>", "undo", "undo", "Toggle undo history")

-- move upper/down on visual
r.vnoremap("K", '<cmd>m "<-2<CR>gv=gv"', "remap", "remap_move_upper_on_visual", "Move upper on visual")
r.vnoremap("J", '<cmd>m ">+1<CR>gv=gv"', "remap", "remap_move_down_on_visual", "Move down on visual")

-- Keep visual mode indenting
r.vnoremap("<", "<gv", "remap", "remap_keep_visual_indent_1", "Keep visual mode indenting")
r.vnoremap("<", "<gv", "remap", "remap_keep_visual_indent_2", "Keep visual mode indenting")

-- move vertically by visual line unless preceded by a count. 
-- If a movement is greater than 5 then automatically add to the jumplist.
vim.api.nvim_exec(
	[[
  nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
  nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
]],
	false
)

-- Don't yank on delete char
-- nnoremap('x', '"_d', 'remap', 'remap_deletes_no_yank_normal_x', 'Don\'t yank on delete char')
-- nnoremap('X', '"_d', 'remap', 'remap_deletes_no_yank_normal_X', 'Don\'t yank on delete char')
r.vnoremap("x", '"_d', "remap", "remap_deletes_no_yank_visual_x", "Don't yank on delete char")
r.vnoremap("X", '"_d', "remap", "remap_deletes_no_yank_visual_X", "Don't yank on delete char")

-- when going to next search, we center screen
r.nnoremap("n", "nzzzv", "remap", "remap_go_next_search", "When going to next search, we center screen")
r.nnoremap("N", "Nzzzv", "remap", "remap_go_previous_serach", "When going to previous search, we center screen")

-- navigate quick fix
r.nnoremap("]q", ":cnext<CR>", "remap", "remap_next_quickfix", "Navigate to next quickfix")
r.nnoremap("[q", ":cprev<CR>", "remap", "remap_previous_quickfix", "Navigate to previous quickfix")

-- yanking
r.nnoremap("gy", '"+y', "remap", "remap_copy_system_clipboard", "Copy to system clipboard")
r.nnoremap("gY", '"+Y', "remap", "remap_copy_system_clipboard_eol", "Copy to system clipboard until end of the line")
r.nnoremap("gp", '"+p', "remap", "remap_paste_system_clipboard_P", "Paste from system clipboard")
r.nnoremap("gP", '"+P', "remap", "remap_paste_system_clipboard_p", "Paste from system clipboard until end of the line")
r.vnoremap("gy", '"+y', "remap", "remap_copy_system_clipboard_vis", "Copy to system clipboard")
r.vnoremap(
	"gY",
	'"+Y',
	"remap",
	"remap_copy_system_clipboard_eol_vis",
	"Copy to system clipboard until end of the line"
)
r.vnoremap("gp", '"+p', "remap", "remap_paste_system_clipboard_P_vis", "Paste from system clipboard")
r.vnoremap(
	"gP",
	'"+P',
	"remap",
	"remap_paste_system_clipboard_p_vis",
	"Paste from system clipboard until end of the line"
)

-- maps c-n / c-t to navigate while searching with /
vim.api.nvim_exec(
	[[
cnoremap <expr> <c-n> getcmdtype() =~ '[\/?]' ? '<c-g>' : '<c-n>'
cnoremap <expr> <c-p> getcmdtype() =~ '[\/?]' ? '<c-t>' : '<c-p>'
]],
	false
)

-- windows
-- Split navigation
r.nnoremap("<C-h>", "<C-w>h", "remap", "remap_<C-h>", "Remaps <C-h> to handle windows")
r.nnoremap("<C-j>", "<C-w>j", "remap", "remap_<C-j>", "Remaps <C-j> to handle windows")
r.nnoremap("<C-k>", "<C-w>k", "remap", "remap_<C-k>", "Remaps <C-k> to handle windows")
r.nnoremap("<C-l>", "<C-w>l", "remap", "remap_<C-l>", "Remaps <C-l> to handle windows")

-- Resizing
r.nnoremap("<leader>w+", "<cmd>vertical resize +5<CR>", "window", "window_increase_size", "Increase window size")
r.nnoremap("<leader>w-", "<cmd>vertical resize -5<CR>", "window", "window_decrease_size", "Decrease window size")
-- buffers

r.nnoremap("<leader>bd", "<cmd>bd<CR>", "buffer", "buffer_delete", "Deletes buffer")

r.nnoremap("<leader>bD", "<cmd>bd!<CR>", "buffer", "buffer_delete_force", "Force delete buffer")

r.nnoremap("<leader>bo", "<cmd>BufOnly<CR>", "buffer", "buffer_delete_others", "Deletes all other buffers except yours")

r.nnoremap("<leader>bad", "<cmd>%bd<CR>", "buffer", "buffer_delete_all", "Deletes all buffers")

r.nnoremap("<leader>bw", "<cmd>update<CR>", "buffer", "buffer_update", "Saves/writes/updates buffer")

r.nnoremap("<leader>bW", "<cmd>update!<CR>", "buffer", "buffer_update_force", "Force save/write/update buffer")
