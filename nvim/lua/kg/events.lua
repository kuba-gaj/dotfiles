local events = require("kg.utils.events")

events.addEventListener("LuaHighlight", { "TextYankPost *" }, function()
	vim.highlight.on_yank({ timeout = 500 })
end)

vim.cmd([[
  autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform
]])
