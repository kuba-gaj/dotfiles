local r = require("kg.utils.remaps")

vim.g.ctrlsf_auto_focus = {
	at = "start",
}
vim.g.ctrlsf_default_root = "project"

r.map("n", "<leader>pr", "<Plug>CtrlSFPrompt", "search_all_files", "Search term in all files")
r.noremap("n", "<leader>pR", ":CtrlSFToggle<CR>", "search_all_files_toggle", "Toggle searched term in all files")
-- r.noremap("i", "<leader>pR", "<Esc>:CtrlSFToggle<CR>", "search", "Toggle searched term in all files (in insert mode)")
