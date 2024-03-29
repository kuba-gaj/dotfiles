local M = {}

function M.starts_with(str, start)
	return str:sub(1, #start) == start
end

function M.tprint(table)
	print(vim.inspect(table))
end

function M.tprint_keys(table)
  for k, v in pairs(table) do
    print(k)
  end
end

local reload = require("plenary.reload")

M.reload = function()
	local counter = 0

	for moduleName in pairs(package.loaded) do
		if M.starts_with(moduleName, "kg.") then
			reload.reload_module(moduleName)

			counter = counter + 1
		end
	end

	-- clear nvim-mapper keys
	vim.g.mapper_records = nil

	vim.notify("Reloaded " .. counter .. " modules!")
end

function M.is_linux()
	return vim.loop.os_uname().sysname == "Linux"
end

function M.link_highlight(from, to, override)
	local hl_exists, _ = pcall(vim.api.nvim_get_hl_by_name, from, false)
	if override or not hl_exists then
		-- vim.cmd(("highlight link %s %s"):format(from, to))
		vim.api.nvim_set_hl(0, from, { link = to })
	end
end

M.highlight = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

M.highlight_bg = function(group, col)
	-- vim.cmd("hi " .. group .. " guibg=" .. col)
	vim.api.nvim_set_hl(0, group, { bg = col })
end

-- Define fg color
-- @param group Group
-- @param color Color
M.highlight_fg = function(group, col)
	-- vim.cmd("hi " .. group .. " guifg=" .. col)
	vim.api.nvim_set_hl(0, group, { fg = col })
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
M.highlight_fg_bg = function(group, fgcol, bgcol)
	-- vim.cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
	vim.api.nvim_set_hl(0, group, { bg = bgcol, fg = fgcol })
end

M.glob_split = function(pattern)
	return vim.split(vim.fn.glob(pattern), "\n")
end

M.get_color_from_terminal = function(num, default)
  local key = "terminal_color_" .. num
  return vim.g[key] and vim.g[key] or default
end

M.from_highlight = function(hl)
  local result = {}
  local list = vim.api.nvim_get_hl_by_name(hl, true)
  for k, v in pairs(list) do
    local name = k == "background" and "bg" or "fg"
    result[name] = string.format("#%06x", v)
  end
  return result
end

return M
