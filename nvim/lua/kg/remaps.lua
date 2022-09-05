local r = require("kg.utils.remaps")
local functions = require("kg.utils.functions")
-- quit
r.noremap("n", "<C-q>q", ":confirm qall<CR>", "Quits all with confirm")
r.noremap("n", "Q", "<cmd>q<CR>", "Quits editor")
r.noremap("n", "<leader>Q", "<cmd>q!<CR>", "Force quits editor")

-- reload
r.noremap("n", "<leader><CR>", functions.reload, "Reloads configuration")

-- undo
r.noremap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", "Toggle undo history")

-- move upper/down on visual
r.noremap("v", "K", '<cmd>m "<-2<CR>gv=gv"', "Move upper on visual")
r.noremap("v", "J", '<cmd>m ">+1<CR>gv=gv"', "Move down on visual")

-- Keep visual mode indenting
r.noremap("v", "<", "<gv", "Keep visual mode indenting")
r.noremap("v", ">", ">gv", "Keep visual mode indenting")

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
r.noremap("v", "x", '"_d', "Don't yank on delete char")
r.noremap("v", "X", '"_d', "Don't yank on delete char")

-- when going to next search, we center screen
r.noremap("n", "n", "nzzzv", "When going to next search, we center screen")
r.noremap("n", "N", "Nzzzv", "When going to previous search, we center screen")

-- navigate quick fix
r.noremap("n", "]q", ":cnext<CR>", "Navigate to next quickfix")
r.noremap("n", "[q", ":cprev<CR>", "Navigate to previous quickfix")

-- yanking
r.noremap("n", "gy", '"+y', "Copy to system clipboard")
r.noremap("n", "gY", '"+Y', "Copy to system clipboard until end of the line")
r.noremap("n", "gp", '"+p', "Paste from system clipboard")
r.noremap("n", "gP", '"+P', "Paste from system clipboard until end of the line")
r.noremap("v", "gy", '"+y', "Copy to system clipboard")
r.noremap("v", "gY", '"+Y', "Copy to system clipboard until end of the line")
r.noremap("v", "gp", '"+p', "Paste from system clipboard")
r.noremap("v", "gP", '"+P', "Paste from system clipboard until end of the line")

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
-- r.noremap("n", "<C-h>", "<C-w>h", "Remaps <C-h> to handle windows")
-- r.noremap("n", "<C-j>", "<C-w>j", "Remaps <C-j> to handle windows")
-- r.noremap("n", "<C-k>", "<C-w>k", "Remaps <C-k> to handle windows")
-- r.noremap("n", "<C-l>", "<C-w>l", "Remaps <C-l> to handle windows")

-- Resizing
r.noremap("n", "<leader>w+", "<cmd>vertical resize +5<CR>", "Increase window size")
r.noremap("n", "<leader>w-", "<cmd>vertical resize -5<CR>", "Decrease window size")

-- buffers
r.noremap("n", "<leader>bd", "<cmd>bd<CR>", "Deletes buffer")
r.noremap("n", "<leader>bD", "<cmd>bd!<CR>","Force delete buffer")
r.noremap("n", "<leader>bo", "<cmd>BufOnly<CR>","Deletes all other buffers except yours")
r.noremap("n", "<leader>bad", "<cmd>%bd<CR>", "Deletes all buffers")
r.noremap("n", "<leader>bw", "<cmd>update<CR>", "Saves/writes/updates buffer")
r.noremap("n", "<leader>bW", "<cmd>update!<CR>", "Force save/write/update buffer")
