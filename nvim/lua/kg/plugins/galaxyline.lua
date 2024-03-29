local present, gl = pcall(require, "galaxyline")

if not present then
	return
end

local gruvbox = require("gruvbox.palette")
local condition = require("galaxyline.condition")
local gps = require("nvim-gps")
local fileinfo = require("galaxyline.providers.fileinfo")
local lspclient = require("galaxyline.providers.lsp")

local gls = gl.section
gl.short_line_list = { "NvimTree", "vista", "dbui" }

local colors = {
	bg = gruvbox.dark0,
	fg = gruvbox.light1,
	section_bg = gruvbox.dark0_hard,
	yellow = gruvbox.neutral_yellow,
	cyan = gruvbox.neutral_aqua,
	green = gruvbox.neutral_green,
	orange = gruvbox.neutral_orange,
	purple = gruvbox.neutral_purple,
	magenta = gruvbox.bright_purple,
	blue = gruvbox.neutral_blue,
	red = gruvbox.neutral_red,
}

local mode_color = function()
	local mode_colors = {
		n = colors.blue,
		i = colors.green,
		c = colors.orange,
		v = colors.magenta,
		V = colors.purple,
		[""] = colors.magenta,
		R = colors.red,
		s = colors.red,
		t = colors.red,
	}
	local mode = vim.fn.mode()
	if mode_colors[mode] then
		return mode_colors[mode]
	else
		print(mode .. " not mapped")
	end
end

local mode_alias = function()
	local mode_map = {
		n = "N",
		i = "I",
		c = "C",
		v = "V",
		V = "VL",
		[""] = "VB",
		R = "R",
		s = "s",
		t = "t",
	}

	local mode = vim.fn.mode()
	if mode_map[mode] then
		return mode_map[mode]
	else
		print(mode .. " not mapped")
	end
end

gls.left = {
	{
		Start = {
			provider = function()
				return "▊ "
			end,
			highlight = { colors.fg, colors.bg },
		},
	},
	{
		ViMode = {
			provider = function()
				vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color())
				return " " .. mode_alias() .. " "
			end,
			icon = "",
			highlight = { colors.bg, colors.bg },
			separator = " ",
			separator_highlight = { colors.bg, colors.section_bg },
		},
	},
	{
		FileIcon = {
			provider = "FileIcon",
			condition = condition.buffer_not_empty,
			highlight = { fileinfo.get_file_icon_color, colors.section_bg },
		},
	},
	{
		FileName = {
			provider = "FileName",
			condition = condition.buffer_not_empty,
			highlight = { colors.fg, colors.section_bg },
			separator = " ",
			separator_highlight = { colors.section_bg, colors.bg },
		},
	},
	{
		FileSize = {
			provider = "FileSize",
			condition = condition.buffer_not_empty,
			highlight = { colors.fg, colors.bg },
			separator = " ",
			separator_highlight = { colors.bg, colors.section_bg },
		},
	},
	{
		DiagnosticError = {
			provider = "DiagnosticError",
			icon = " ",
			highlight = { colors.red, colors.section_bg },
		},
	},
	{
		DiagnosticWarn = {
			provider = "DiagnosticWarn",
			icon = " ",
			highlight = { colors.yellow, colors.section_bg },
		},
	},
	{
		DiagnosticHint = {
			provider = "DiagnosticHint",
			icon = " ",
			highlight = { colors.cyan, colors.section_bg },
		},
	},
	{
		DiagnosticInfo = {
			provider = "DiagnosticInfo",
			icon = " ",
			highlight = { colors.blue, colors.section_bg },
		},
	},
	{
		ShowLspClient = {
			provider = function()
				return lspclient.get_lsp_client("")
			end,
			condition = condition.checkwidth,
			highlight = { colors.section_fg, colors.section_bg },
			separator = " ",
			separator_highlight = { colors.section_bg, colors.bg },
		},
	},
}

gls.mid = {
	{
		NvimGps = {
			highlight = { colors.section_fg, colors.section_bg },
			provider = function()
				return gps.get_location()
			end,
			condition = function()
				return gps.is_available()
			end,
		},
	},
}

gls.right = {
	{
		GitIcon = {
			provider = function()
				return " "
			end,
			condition = condition.check_git_workspace,
			highlight = { colors.red, colors.section_bg },
			separator = "",
			separator_highlight = { colors.section_bg, colors.bg },
		},
	},
	{
		GitBranch = {
			provider = "GitBranch",
			condition = condition.check_git_workspace,
			highlight = { colors.fg, colors.section_bg },
		},
	},
	{
		DiffAdd = {
			provider = "DiffAdd",
			condition = condition.check_git_workspace,
			icon = "",
			highlight = { colors.green, colors.section_bg },
		},
	},
	{
		DiffModified = {
			provider = "DiffModified",
			condition = condition.check_git_workspace,
			icon = "柳",
			highlight = { colors.orange, colors.section_bg },
		},
	},
	{
		DiffRemove = {
			provider = "DiffRemove",
			condition = condition.check_git_workspace,
			icon = "",
			highlight = { colors.red, colors.section_bg },
		},
	},
	{
		FileEncode = {
			provider = "FileEncode",
			condition = condition.buffer_not_empty,
			highlight = { colors.cyan, colors.bg, "bold" },
			separator = "",
			separator_highlight = { colors.section_bg, colors.bg },
		},
	},
	{
		FileFormat = {
			provider = "FileFormat",
			condition = condition.buffer_not_empty,
			highlight = { colors.cyan, colors.bg, "bold" },
			separator = " ",
			separator_highlight = { colors.bg, colors.bg },
		},
	},
	{
		BufferType = {
			provider = function()
				local fname = fileinfo.get_current_file_name()
				for _, v in ipairs(gl.short_line_list) do
					if v == vim.bo.filetype then
						return ""
					end
				end
				return fname
			end,
			condition = condition.buffer_not_empty,
			highlight = { colors.cyan, colors.bg, "bold" },
			separator = " ",
			separator_highlight = { colors.bg, colors.bg },
		},
	},
	{
		LineInfo = {
			provider = "LineColumn",
			highlight = { colors.fg, colors.bg },
			separator = " ",
			separator_highlight = { colors.bg, colors.bg },
		},
	},
}

gls.short_line_left[1] = {
	BufferType = {
		provider = "FileTypeName",
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.blue, colors.bg, "bold" },
	},
}

gls.short_line_left[2] = {
	SFileName = {
		provider = function()
			local fname = fileinfo.get_current_file_name()
			for _, v in ipairs(gl.short_line_list) do
				if v == vim.bo.filetype then
					return ""
				end
			end
			return fname
		end,
		condition = condition.buffer_not_empty,
		highlight = { colors.white, colors.bg, "bold" },
	},
}

gls.short_line_right[1] = {
	BufferIcon = { provider = "BufferIcon", highlight = { colors.fg, colors.bg } },
}

