local vim = vim
local present, nvim_tree = pcall(require, "nvim-tree")

if not present then
  return
end

-- nvim_tree_bindings
local tree_cb = require("nvim-tree.config").nvim_tree_callback
local list = {
  { key = "a", cb = tree_cb "create" },
  { key = "d", cb = tree_cb "remove" },
  { key = "x", cb = tree_cb "cut" },
  { key = "c", cb = tree_cb "copy" },
  { key = "p", cb = tree_cb "paste" },
  { key = "q", cb = tree_cb "close" },
  { key = "-", cb = tree_cb "close" },
  { key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb "edit" },
  { key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb "cd" },
  { key = "<C-v>", cb = tree_cb "vsplit" },
  { key = "<C-x>", cb = tree_cb "split" },
  { key = "<C-t>", cb = tree_cb "tabnew" },
  { key = "<", cb = tree_cb "prev_sibling" },
  { key = ">", cb = tree_cb "next_sibling" },
  { key = "P", cb = tree_cb "parent_node" },
  { key = "<BS>", cb = tree_cb "close_node" },
  { key = "<S-CR>", cb = tree_cb "close_node" },
  { key = "<Tab>", cb = tree_cb "preview" },
  { key = "K", cb = tree_cb "first_sibling" },
  { key = "J", cb = tree_cb "last_sibling" },
  { key = "I", cb = tree_cb "toggle_ignored" },
  { key = "H", cb = tree_cb "toggle_dotfiles" },
  { key = "R", cb = tree_cb "refresh" },
  { key = "r", cb = tree_cb "rename" },
  { key = "<C-r>", cb = tree_cb "full_rename" },
  { key = "y", cb = tree_cb "copy_name" },
  { key = "Y", cb = tree_cb "copy_path" },
  { key = "gy", cb = tree_cb "copy_absolute_path" },
  { key = "[c", cb = tree_cb "prev_git_item" },
  { key = "]c", cb = tree_cb "next_git_item" },
  { key = "g?", cb = tree_cb "toggle_help" },
}

nvim_tree.setup {
  diagnostics = { enable = true }, -- todo: enable when it stops throwing errors
  -- project integration
  -- update_cwd = true,
  update_focused_file = { enable = true, update_cwd = false },
  view = { width = "300", auto_resize = true, mappings = { list = list } },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = false,
      },
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true
  },
  renderer = {
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = false,
      }
    },
    highlight_git = false,
    highlight_opened_files = "all", -- 0 "none", 1 "icons", 2 "name", 3 "all"
    group_empty = true
  }
}

local r = require "kg.utils.remaps"
r.noremap("n", "-", "<cmd>NvimTreeFindFileToggle<CR>", "Toggle explorer")
