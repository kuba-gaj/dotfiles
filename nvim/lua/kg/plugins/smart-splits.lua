local present, smart_splits = pcall(require, "smart-splits")

if not present then
  return
end

local r = require "kg.utils.remaps"
-- resizing splits
r.noremap("n", "<left>", smart_splits.resize_left, "resize left")
r.noremap("n", "<down>", smart_splits.resize_down, "resize down")
r.noremap("n", "<up>", smart_splits.resize_up, "resize up")
r.noremap("n", "<right>", smart_splits.resize_right, "resize right")
-- r.noremap("n", "<M-h>", smart_splits.resize_left, "resize left")
-- r.noremap("n", "<M-j>", smart_splits.resize_down, "resize down")
-- r.noremap("n", "<M-k>", smart_splits.resize_up, "resize up")
-- r.noremap("n", "<M-l>", smart_splits.resize_right, "resize right")
-- moving between splits
r.noremap("n", "<C-h>", smart_splits.move_cursor_left, "move left")
r.noremap("n", "<C-j>", smart_splits.move_cursor_down, "move down")
r.noremap("n", "<C-k>", smart_splits.move_cursor_up, "move up")
r.noremap("n", "<C-l>", smart_splits.move_cursor_right, "move right")

-- nmap <C-h> :lua require('smart-splits').move_cursor_left()<CR>
-- nmap <C-j> :lua require('smart-splits').move_cursor_down()<CR>
-- nmap <C-k> :lua require('smart-splits').move_cursor_up()<CR>
-- nmap <C-l> :lua require('smart-splits').move_cursor_right()<CR>
