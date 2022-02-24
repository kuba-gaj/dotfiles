local r = require("kg.utils.remaps")
local functions = require("kg.utils.functions")
-- quit
r.noremap("n", "<C-q>q", ":confirm qall<CR>", "quit_config", "Quits all with confirm")
r.noremap("n", "Q", "<cmd>q<CR>", "quit", "Quits editor")
r.noremap("n", "<leader>Q", "<cmd>q!<CR>", "quit_force", "Force quits editor")

-- reload
r.noremap("n", "<leader><CR>", functions.reload, "reload", "Reloads configuration")

-- undo
r.noremap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", "undo", "Toggle undo history")

-- move upper/down on visual
r.noremap("v", "K", '<cmd>m "<-2<CR>gv=gv"', "remap_move_upper_on_visual", "Move upper on visual")
r.noremap("v", "J", '<cmd>m ">+1<CR>gv=gv"', "remap_move_down_on_visual", "Move down on visual")

-- Keep visual mode indenting
r.noremap("v", "<", "<gv", "remap_keep_visual_indent_1", "Keep visual mode indenting")
r.noremap("v", ">", ">gv", "remap_keep_visual_indent_2", "Keep visual mode indenting")

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
r.noremap("v", "x", '"_d', "remap_deletes_no_yank_visual_x", "Don't yank on delete char")
r.noremap("v", "X", '"_d', "remap_deletes_no_yank_visual_X", "Don't yank on delete char")

-- when going to next search, we center screen
r.noremap("n", "n", "nzzzv", "remap_go_next_search", "When going to next search, we center screen")
r.noremap("n", "N", "Nzzzv", "remap_go_previous_serach", "When going to previous search, we center screen")

-- navigate quick fix
r.noremap("n", "]q", ":cnext<CR>", "remap_next_quickfix", "Navigate to next quickfix")
r.noremap("n", "[q", ":cprev<CR>", "remap_previous_quickfix", "Navigate to previous quickfix")

-- yanking
r.noremap("n", "gy", '"+y', "remap_copy_system_clipboard", "Copy to system clipboard")
r.noremap("n", "gY", '"+Y', "remap_copy_system_clipboard_eol", "Copy to system clipboard until end of the line")
r.noremap("n", "gp", '"+p', "remap_paste_system_clipboard_P", "Paste from system clipboard")
r.noremap("n", "gP", '"+P', "remap_paste_system_clipboard_p", "Paste from system clipboard until end of the line")
r.noremap("v", "gy", '"+y', "remap_copy_system_clipboard_vis", "Copy to system clipboard")
r.noremap("v", "gY", '"+Y', "remap_copy_system_clipboard_eol_vis", "Copy to system clipboard until end of the line")
r.noremap("v", "gp", '"+p', "remap_paste_system_clipboard_P_vis", "Paste from system clipboard")
r.noremap("v", "gP", '"+P', "remap_paste_system_clipboard_p_vis", "Paste from system clipboard until end of the line")

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
r.noremap("n", "<C-h>", "<C-w>h", "remap_<C-h>", "Remaps <C-h> to handle windows")
r.noremap("n", "<C-j>", "<C-w>j", "remap_<C-j>", "Remaps <C-j> to handle windows")
r.noremap("n", "<C-k>", "<C-w>k", "remap_<C-k>", "Remaps <C-k> to handle windows")
r.noremap("n", "<C-l>", "<C-w>l", "remap_<C-l>", "Remaps <C-l> to handle windows")

-- Resizing
r.noremap("n", "<leader>w+", "<cmd>vertical resize +5<CR>", "window_increase_size", "Increase window size")
r.noremap("n", "<leader>w-", "<cmd>vertical resize -5<CR>", "window_decrease_size", "Decrease window size")

-- buffers
r.noremap("n", "<leader>bd", "<cmd>bd<CR>", "buffer_delete", "Deletes buffer")
r.noremap("n", "<leader>bD", "<cmd>bd!<CR>", "buffer_delete_force", "Force delete buffer")
r.noremap("n", "<leader>bo", "<cmd>BufOnly<CR>", "buffer_delete_others", "Deletes all other buffers except yours")
r.noremap("n", "<leader>bad", "<cmd>%bd<CR>", "buffer_delete_all", "Deletes all buffers")
r.noremap("n", "<leader>bw", "<cmd>update<CR>", "buffer_update", "Saves/writes/updates buffer")
r.noremap("n", "<leader>bW", "<cmd>update!<CR>", "buffer_update_force", "Force save/write/update buffer")
