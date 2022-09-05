local vim = vim;

vim.cmd("syntax on")


vim.o.termguicolors = true
vim.o.background = "dark"

vim.g.gruvbox_contrast_dark = "hard"
vim.cmd("colorscheme gruvbox")

local colors = require("gruvbox.palette")

local highlight = require("kg.utils.functions").highlight
local highlight_fg_bg = require("kg.utils.functions").highlight_fg_bg
local highlight_fg = require("kg.utils.functions").highlight_fg
local highlight_bg = require("kg.utils.functions").highlight_bg
local from_highlight = require("kg.utils.functions").from_highlight
local get_color_from_terminal = require("kg.utils.functions").get_color_from_terminal

local bg = colors.dark0_hard
local bg_alt = colors.dark0

-- vim.cmd([[:hi ColorColumn ctermbg=0 guibg=lightgrey]])
highlight_bg("SignColumn", colors.bg)
highlight_bg("NumberColumn", colors.bg)

-- autocomplete, like CMP
highlight_fg_bg("PMenu", colors.light1, colors.bg_alt)

-- fold preview for example
highlight_fg_bg("NormalFloat", colors.light1, colors.bg_alt)
-- no border
highlight_fg_bg("FloatBorder", bg_alt, bg_alt)

highlight_fg("StatusLine", colors.bg)

if pcall(require, "telescope") then
	-- functions.link_highlight("TelescopeBorder", "GruvboxBg2", true)
	-- functions.link_highlight("TelescopePromptBorder", "GruvboxBg2", true)
	-- functions.link_highlight("TelescopeResultsBorder", "GruvboxBg2", true)
	-- functions.link_highlight("TelescopePreviewBorder", "GruvboxBg2", true)

	highlight_fg_bg("TelescopeBorder", colors.light1, colors.bg_alt)
	highlight_fg_bg("TelescopePromptBorder", colors.bg_alt, colors.bg_alt)
	highlight_fg_bg("TelescopeResultsBorder", colors.bg_alt, colors.bg_alt)
	highlight_fg_bg("TelescopePreviewBorder", colors.bg_alt, colors.bg_alt)

	highlight_fg_bg("TelescopePromptNormal", colors.light1, colors.bg_alt)
	highlight_fg_bg("TelescopePromptPrefix", colors.light1, colors.bg_alt)

	highlight_fg_bg("TelescopeResultsTitle", colors.light1, colors.bg_alt)
	highlight_bg("TelescopeNormal", colors.bg_alt)
	highlight_bg("TelescopeSelection", colors.bg)
	-- highlight_bg("TelescopeSelection", colors.dark2)
end

if pcall(require, "nvim-tree") then
	highlight_fg("NvimTreeEmptyFolderName", colors.light1)
	highlight_fg("NvimTreeEndOfBuffer", colors.bg_alt)
	highlight_fg("NvimTreeFolderIcon", colors.light1)
	highlight_fg("NvimTreeFolderName", colors.light1)
	-- highlight_fg("NvimTreeGitDirty", red)
	-- highlight_fg("NvimTreeIndentMarker", one_bg2)
	highlight_bg("NvimTreeNormal", colors.bg_alt)
	highlight_bg("NvimTreeNormalNC", colors.bg_alt)
	highlight_fg("NvimTreeOpenedFolderName", colors.light1)
	highlight_fg("NvimTreeRootFolder", colors.light1)
	highlight_fg_bg("NvimTreeStatuslineNc", colors.bg_alt, colors.bg_alt)
	highlight_fg_bg("NvimTreeVertSplit", colors.bg_alt, colors.bg_alt)
	-- highlight_fg_bg("NvimTreeWindowPicker", red, black2)
end

if pcall(require, "cmp") then
  vim.cmd("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=" .. colors.neutral_red)
	-- highlight_fg("CmpItemAbbrDeprecated", colors.neutral_red)
	highlight_fg("CmpItemAbbrMatch", colors.neutral_blue)
	highlight_fg("CmpItemAbbrMatchFuzzy", colors.neutral_blue)
	highlight_fg("CmpItemKindVariable", colors.neutral_aqua)
	highlight_fg("CmpItemKindInterface", colors.neutral_aqua)
	highlight_fg("CmpItemKindText", colors.neutral_aqua)
	highlight_fg("CmpItemKindFunction", colors.neutral_purple)
	highlight_fg("CmpItemKindMethod", colors.neutral_purple)
	highlight_fg("CmpItemKindKeyword", colors.neutral_green)
	highlight_fg("CmpItemKindProperty", colors.neutral_green)
	highlight_fg("CmpItemKindUnit", colors.neutral_green)
end

if pcall(require, "feline") then
	local feline_theme = {
		bg = bg_alt,
		alt = bg,
		fg = colors.light1,
		hint = from_highlight("DiagnosticHint").bg or colors.neutral_aqua,
		info = from_highlight("DiagnosticInfo").bg or colors.neutral_blue,
		warn = from_highlight("DiagnosticWarn").bg or colors.neutral_orange,
		err = from_highlight("DiagnosticError").bg or colors.neutral_red,
		black = get_color_from_terminal(0, colors.dark0_hard),
		red = get_color_from_terminal(1, colors.neutral_red),
		green = get_color_from_terminal(2, colors.neutral_green),
		yellow = get_color_from_terminal(3, colors.neutral_yellow),
		blue = get_color_from_terminal(4, colors.neutral_blue),
		magenta = get_color_from_terminal(5, colors.neutral_purple),
		cyan = get_color_from_terminal(6, colors.neutral_aqua),
		white = colors.light1,
	}

	local c = feline_theme

	local groups = {
		FlnViBlack = { fg = c.white, bg = c.black, bold = true },
		FlnViRed = { fg = c.bg, bg = c.red, bold = true },
		FlnViGreen = { fg = c.bg, bg = c.green, bold = true },
		FlnViYellow = { fg = c.bg, bg = c.yellow, bold = true },
		FlnViBlue = { fg = c.bg, bg = c.blue, bold = true },
		FlnViMagenta = { fg = c.bg, bg = c.magenta, bold = true },
		FlnViCyan = { fg = c.bg, bg = c.cyan, bold = true },
		FlnViWhite = { fg = c.bg, bg = c.white, bold = true },

		FlnBlack = { fg = c.black, bg = c.white, bold = true },
		FlnRed = { fg = c.red, bg = c.bg, bold = true },
		FlnGreen = { fg = c.green, bg = c.bg, bold = true },
		FlnYellow = { fg = c.yellow, bg = c.bg, bold = true },
		FlnBlue = { fg = c.blue, bg = c.bg, bold = true },
		FlnMagenta = { fg = c.magenta, bg = c.bg, bold = true },
		FlnCyan = { fg = c.cyan, bg = c.bg, bold = true },
		FlnWhite = { fg = c.white, bg = c.bg, bold = true },

		-- Diagnostics
		FlnHint = { fg = c.int, bg = c.alt, bold = true },
		FlnInfo = { fg = c.info, bg = c.alt, bold = true },
		FlnWarn = { fg = c.warn, bg = c.alt, bold = true },
		FlnError = { fg = c.err, bg = c.alt, bold = true },
		FlnStatus = { fg = c.fg, bg = c.bg, bold = true },

		-- Dianostic Separators
		FlnStatusBg = { fg = c.bg, bg = c.alt },
		FlnStatusToDiagnostic = { fg = c.bg, bg = c.alt },
		FlnFileTypeToDiagnostic = { fg = c.bg, bg = c.alt },

		FlnAlt = { fg = c.white, bg = c.alt },
		FlnFileInfo = { fg = c.white, bg = c.alt },
		FlnFileType = { fg = c.white, bg = c.bg },
		FlnFileEnc = { fg = c.white, bg = c.bg },
		FlnAltSep = { fg = c.bg, bg = c.alt },
		FlnFileInfoSep = { fg = c.bg, bg = c.alt },
		FlnGitBranch = { fg = c.fg, bg = c.bg },
		FlnGitAdded = { fg = c.green, bg = c.bg },
		FlnGitChanged = { fg = c.yellow, bg = c.bg },
		FlnGitRemoved = { fg = c.red, bg = c.bg },
		FlnGitSeparator = { fg = c.bg, bg = c.alt },
	}

	for k, v in pairs(groups) do
		highlight(k, v)
	end
end

  -- dark0_hard = "#1d2021",
  -- dark0 = "#282828",
  -- dark0_soft = "#32302f",
  -- dark1 = "#3c3836",
  -- dark2 = "#504945",
  -- dark3 = "#665c54",
  -- dark4 = "#7c6f64",
  -- light0_hard = "#f9f5d7",
  -- light0 = "#fbf1c7",
  -- light0_soft = "#f2e5bc",
  -- light1 = "#ebdbb2",
  -- light2 = "#d5c4a1",
  -- light3 = "#bdae93",
  -- light4 = "#a89984",
  -- bright_red = "#fb4934",
  -- bright_green = "#b8bb26",
  -- bright_yellow = "#fabd2f",
  -- bright_blue = "#83a598",
  -- bright_purple = "#d3869b",
  -- bright_aqua = "#8ec07c",
  -- bright_orange = "#fe8019",
  -- neutral_red = "#cc241d",
  -- neutral_green = "#98971a",
  -- neutral_yellow = "#d79921",
  -- neutral_blue = "#458588",
  -- neutral_purple = "#b16286",
  -- neutral_aqua = "#689d6a",
  -- neutral_orange = "#d65d0e",
  -- faded_red = "#9d0006",
  -- faded_green = "#79740e",
  -- faded_yellow = "#b57614",
  -- faded_blue = "#076678",
  -- faded_purple = "#8f3f71",
  -- faded_aqua = "#427b58",
  -- faded_orange = "#af3a03",
  -- gray = "#928374",
