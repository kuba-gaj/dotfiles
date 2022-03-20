-- Add the key mappings only for Markdown files in a zk notebook.
if require("zk.util").notebook_root(vim.fn.expand('%:p')) ~= nil then
  -- local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end
local r = require("kg.utils.remaps")
  local function map(type, input, output, unique_identifier, description, extraOptions)
		local options = { buffer = 0 }
		if extraOptions ~= nil then
			options = vim.tbl_deep_extend("force", options, extraOptions)
		end
		r.noremap(type, input, output, unique_identifier, description, options)
  end

  local opts = { noremap=true, silent=false }
  -- Open the link under the caret.
  map("n", "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>", "zk_open_link", "Open the link under the caret.")
  -- This overrides the global `<leader>zn` mapping to create the note in the same directory as the current buffer.
  map("n", "<leader>zn", "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", 'zk_new_note_buf', 'Create new note')
  -- Create a new note in the same directory as the current buffer, using the current selection for title.
  map("v", "<leader>znt", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", 'zk_new_note_vis_title', 'Create new note using selection for title');
  -- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
  map("v", "<leader>znc", ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", 'zk_new_note_vis_content', 'Create new note using selection for content')

  -- Open notes linking to the current buffer.
  map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", 'zk_backlinks', 'Open notes linking to the current buffer')
  -- Alternative for backlinks using pure LSP and showing the source context.
  --map('n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- Open notes linked by the current buffer.
  map("n", "<leader>zl", "<Cmd>ZkLinks<CR>", 'zk_links', 'Open notes linked by the current buffer')
  -- Preview a linked note.
  -- done by lsp?
  -- map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- Open the code actions for a visual selection.
  map("v", "<leader>za", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
  -- support conceal level for links
  vim.wo.conceallevel = 2
end
