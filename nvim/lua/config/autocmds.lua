-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "rust",
--   -- command = "setlocal shiftwidth=4 tabstop=4",
--   callback = function()
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.tabstop = 4
--   end,
-- })

-- harpoon marks
local api = vim.api

local function harpoon_ns()
  return api.nvim_create_namespace("harpoon_sign")
end
api.nvim_set_hl(0, "HarpoonSign", { fg = "#8aadf4", bold = true })

local function harpoon_sign(row)
  api.nvim_buf_set_extmark(0, harpoon_ns(), row - 1, -1, {
    sign_text = " ", -- check your `signcolumn` option
    sign_hl_group = "HarpoonSign",
  })
end

api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*",
  callback = function()
    api.nvim_buf_clear_namespace(0, harpoon_ns(), 0, -1)
    local filename = vim.fn.expand("%:p:.")
    local harpoon_marks = require("harpoon"):list().items
    for _, mark in ipairs(harpoon_marks) do
      if mark.value == filename then
        harpoon_sign(mark.context.row)
        return
      end
    end
  end,
})

--
-- Position the (global) quickfix window at the very bottom of the window
-- (useful for making sure that it appears underneath splits)
--
-- NOTE: Using a check here to make sure that window-specific location-lists
-- aren't effected, as they use the same `FileType` as quickfix-lists.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  -- command = "setlocal shiftwidth=4 tabstop=4",
  callback = function()
    -- print("qf filetype")
    if vim.fn.getwininfo(vim.fn.win_getid())[1].loclist ~= 1 then
      -- print("wincmd J")
      vim.cmd("wincmd J")
    end
  end,
})
-- autocmd FileType qf if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif
