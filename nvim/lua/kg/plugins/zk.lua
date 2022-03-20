local present, zk = pcall(require, "zk")

if not present then
  return
end

zk.setup({
  -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
  -- it's recommended to use "telescope" or "fzf"
  picker = "telescope",

  lsp = {
    -- `config` is passed to `vim.lsp.start_client(config)`
    config = {
      cmd = { "zk", "lsp" },
      name = "zk",
      -- on_attach = ...
      -- etc, see `:h vim.lsp.start_client()`
    },

    -- automatically attach buffers in a zk notebook that match the given filetypes
    auto_attach = {
      enabled = true,
      filetypes = { "markdown" },
    },
  },
})

local r = require("kg.utils.remaps")

r.which_key("<leader>z", "notes")
r.noremap("n",  "<leader>zn",  "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", "zk_new_note", "Create a new note asking for its title" )
r.noremap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", "zk_open_notes", "Open notes")
r.noremap("n", "<leader>zt", "<Cmd>ZkTags<CR>", 'zk_open_tags', 'Open notes associated with the selected tags');
r.noremap("n", "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<CR>", 'zk_search_notes', 'Search for the notes matching a given query')
r.noremap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", 'zk_search_notes_vis', 'Search for the notes matching the current visual selection')
