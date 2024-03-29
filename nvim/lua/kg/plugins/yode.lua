local present, yode = pcall(require, "yode-nvim")

if not present then
  return
end

yode.setup {}

local r = require "kg.utils.remaps"

r.which_key("<leader>y", "yode")

r.map("", "<leader>yc", ":YodeCreateSeditorFloating<CR>", "Create floating Yode editor"
)
r.map("", "<leader>yr", ":YodeCreateSeditorReplace<CR>", "Create replace Yode editor")

-- vim.cmd("map <Leader>yc :YodeCreateSeditorFloating<CR>")
r.map("n", "<leader>yd", "<cmd>:YodeBufferDelete<CR>", "Delete Yode buffer")
-- r.map("i", "<leader>yd", "<esc><cmd>:YodeBufferDelete<CR>", "Delete Yode buffer")

-- map <C-W>r :YodeLayoutShiftWinDown<CR>
-- map <C-W>R :YodeLayoutShiftWinUp<CR>
-- map <C-W>J :YodeLayoutShiftWinBottom<CR>
-- map <C-W>K :YodeLayoutShiftWinTop<CR>
