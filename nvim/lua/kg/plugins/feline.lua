local present, feline = pcall(require, "feline")
local vim = vim;

if not present then
	vim.notify("could not load feline")
	return
end

local lsp_provider = require("feline.providers.lsp")
local u = require("kg.plugins.feline_util")
local winbar = require("kg.plugins.feline_winbar")

-- "┃", "█", "", "", "", "", "", "", "●"

local function vi_mode_hl()
	return u.vi.colors[vim.fn.mode()] or "FlnViBlack"
end

local function vi_sep_hl()
	return u.vi.sep[vim.fn.mode()] or "FlnBlack"
end

local c = {
	vimode = {
		provider = function()
			return string.format(" %s ", u.get_current_mode())
		end,
		hl = vi_mode_hl,
		right_sep = { str = " ", hl = vi_sep_hl },
	},
	gitbranch = {
		provider = "git_branch",
		icon = " ",
		hl = "FlnGitBranch",
		enabled = function()
			return vim.b.gitsigns_status_dict ~= nil
		end,
	},

	git_diff_added = {
		provider = "git_diff_added",
		hl = "FlnGitAdded",
	},
	git_diff_changed = {
		provider = "git_diff_changed",
		hl = "FlnGitChanged",
	},
	git_diff_removed = {
		provider = "git_diff_removed",
		hl = "FlnGitRemoved",
		right_sep = { str = "  ", hl = "FlnGitBranch" },
	},
	file_info = {
		provider = "file_info",
		hl = "FlnFileInfo",
		left_sep = { str = u.icons.slant_right, hl = "FlnFileInfoSep" },
	},
	file_type = {
    provider = "file_type",
		hl = "FlnFileType",
		left_sep = { str = " " .. u.icons.slant_left, hl = "FlnFileTypeToDiagnostic" },
		right_sep = { str = " ", hl = "FlnFileType" },
	},
	file_enc = {
    provider = "file_encoding",
		hl = "FlnFileEnc",
    right_sep = { str = " ", hl = "FlnFileEnc" },
	},
	cur_position = {
    provider = "position",
		hl = vi_mode_hl,
		left_sep = { str = u.icons.left_filled, hl = vi_sep_hl },
    right_sep = { str = " ", hl = vi_mode_hl },
	},
	cur_percent = {
		provider = function()
			return " " .. require("feline.providers.cursor").line_percentage()
		end,
		hl = vi_mode_hl,
		left_sep = { str = u.icons.left, hl = vi_mode_hl },
	},
	scroll_bar = {
		provider = "scroll_bar",
		hl = vi_sep_hl,
	},

	default = { -- needed to pass the parent StatusLine hl group to right hand side
		provider = "",
		hl = "StatusLine",
	},
	lsp_status = {
		provider = function()
			return u.get_lsp_client("none", { "null-ls" })
		end,
		hl = "FlnStatus",
		left_sep = { str = u.icons.left_filled, hl = "FlnStatusBg" },
		right_sep = { str = u.icons.slant_right, hl = "FlnStatusToDiagnostic" },
	},
	lsp_error = {
		provider = function()
			return lsp_provider.diagnostic_errors()
		end,
		hl = "FlnError",
	},
	lsp_warn = {
		provider = function()
			return lsp_provider.diagnostic_warnings()
		end,
		hl = "FlnWarn",
	},
	lsp_info = {
		provider = function()
			return lsp_provider.diagnostic_info()
		end,
		hl = "FlnInfo",
	},
	lsp_hint = {
		provider = function()
			return lsp_provider.diagnostic_hints()
		end,
		hl = "FlnHint",
	},

	in_fileinfo = {
		provider = "file_info",
		hl = "StatusLine",
	},
	in_position = {
		provider = "position",
		hl = "StatusLine",
	},
}

local active = {
	{ -- left
		c.vimode,
		c.gitbranch,
		c.git_diff_added,
		c.git_diff_changed,
		c.git_diff_removed,
		c.file_info,
		c.default, -- must be last
	},
	{ -- right
		c.lsp_status,
		c.lsp_error,
		c.lsp_warn,
		c.lsp_info,
		c.lsp_hint,
		c.file_type,
		c.file_enc,
		c.cur_position,
		c.cur_percent,
		c.scroll_bar,
	},
}

local inactive = {
	{ c.in_fileinfo }, -- left
	{ c.in_position }, -- right
}

feline.setup({
	components = { active = active, inactive = inactive },
	highlight_reset_triggers = {},
	force_inactive = {
		filetypes = {
			"NvimTree",
			"packer",
			"dap-repl",
			"dapui_scopes",
			"dapui_stacks",
			"dapui_watches",
			"dapui_repl",
			"LspTrouble",
			"qf",
			"help",
			"TelescopePrompt",
			"__CtrlSF__",
		},
		buftypes = { "terminal" },
		bufnames = {},
	},
	disable = {
		filetypes = {
			"dashboard",
			"startify",
			"alpha",
			"CTRLSF",
      "LSP_INSTALLER",
		},
	},
})

feline.winbar.setup({
  components = {
    active = { winbar },
    inactive = {},
  },
  force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {},
  },
})
