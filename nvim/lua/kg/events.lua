local vim = vim;
local highlight_on_yank_group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_on_yank_group,
  desc = "Highlight the text that was yanked",
  callback = function ()
    vim.highlight.on_yank({ timeout = 500 })
  end
})

vim.cmd([[
  autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform
]])
