local events = require("kg.utils.events")

events.addEventListener("LuaHighlight", { "TextYankPost *" }, function()
	require("vim.highlight").on_yank({ timeout = 500 })
end)
