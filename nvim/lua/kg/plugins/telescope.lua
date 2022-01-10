local r = require("kg.utils.remaps")
local telescope = require("telescope")
local functions = require("kg.utils.functions")

telescope.setup({
	defaults = {
		-- file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim",
		},
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = { prompt_position = "bottom" },
	},
	pickers = {
		buffers = {
			sort_lastused = true,
			sort_mru = true,
			previewer = false,
			theme = "dropdown",
			ignore_current_buffer = true,
		},
		find_files = {
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
			hidden = true,
		},
		git_files = { previewer = false, theme = "dropdown" },
		registers = { theme = "dropdown" },
		lsp_references = { previewer = false },
		lsp_code_actions = { theme = "cursor" },
		lsp_range_code_actions = { theme = "cursor" },
		loclist = { previewer = false },
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = false, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})

functions.link_highlight("TelescopeBorder", "GruvboxBg2", true)
functions.link_highlight("TelescopePromptBorder", "GruvboxBg2", true)
functions.link_highlight("TelescopeResultsBorder", "GruvboxBg2", true)
functions.link_highlight("TelescopePreviewBorder", "GruvboxBg2", true)

if functions.is_linux() then
	telescope.load_extension("fzf")
end

if pcall(require, "nvim-mapper") then
	telescope.load_extension("mapper")
end

if pcall(require, "project_nvim") then
	telescope.load_extension("projects")
end

if pcall(require, "session_manager") then
	telescope.load_extension("sessions")
end

if pcall(require, "harpoon") then
	telescope.load_extension("harpoon")
end

if pcall(require, "nvim-notify") then
	telescope.load_extension("notify")
end

if pcall(require, "dap") then
	telescope.load_extension("dap")
end

r.nnoremap("<leader>pp", "<cmd>Telescope projects<CR>", "telescope", "telescope_projects", "Projects")
r.nnoremap(
	"<leader>ps",
	"<cmd>lua require('telescope.builtin').live_grep()<CR>",
	"telescope",
	"telescope_live_grep",
	"Live grep"
)
r.nnoremap(
	"<leader>pf",
	"<cmd>lua require('telescope.builtin').find_files()<CR>",
	"telescope",
	"telescope_old_files",
	"Find files"
)
r.nnoremap(
	"<leader>pg",
	"<cmd>lua require('telescope.builtin').git_files()<CR>",
	"telescope",
	"telescope_git_files",
	"Find git files"
)
r.nnoremap("<leader>mm", "<cmd>lua require('telescope.builtin').keymaps()<CR>", "telescope", "telescope_mappings", "")

r.nnoremap(
	"<leader>/h",
	"<cmd>lua require('telescope.builtin').command_history()<CR>",
	"telescope",
	"telescope_command_history",
	"Search command history"
)
r.nnoremap(
	"<leader>/c",
	"<cmd>lua require('telescope.builtin').commands()<CR>",
	"telescope",
	"telescope_commands",
	"Search commands"
)
r.nnoremap(
	"<leader>/r",
	"<cmd>lua require('telescope.builtin').registers()<CR>",
	"telescope",
	"telescope_registers",
	"Search registers"
)
r.nnoremap(
	"<leader>/m",
	"<cmd>lua require('telescope.builtin').marks()<CR>",
	"telescope",
	"telescope_marks",
	"Search marks"
)
r.nnoremap("<leader>/n", "<cmd>Telescope notify<CR>", "telescope", "telescope_notify", "Search notifications")
r.nnoremap(
	"<leader>/t",
	"<cmd>lua require('telescope.builtin').treesitter()<CR>",
	"telescope",
	"telescope_treesitter",
	"Search treesitter"
)
r.nnoremap(
	"<leader>/gb",
	"<cmd>lua require('telescope.builtin').git_branches()<CR>",
	"telescope",
	"telescope_git_branches",
	"Search git branches"
)
r.nnoremap(
	"<leader>/gc",
	"<cmd>lua require('telescope.builtin').git_commits()<CR>",
	"telescope",
	"telescope_git_commits",
	"Search git commits"
)
r.nnoremap(
  "<leader>/M",
  "<cmd>Telescope mapper<CR>",
  "telescope",
  "telescope_mapper",
  "Search mappings"
)
r.nnoremap(
	"<leader>bl",
	"<cmd>lua require('telescope.builtin').buffers()<CR>",
	"telescope",
	"telescope_buffers",
	"Search buffers"
)
r.nnoremap(
	"<leader>bc",
	"<cmd>lua require('telescope.builtin').git_bcommits()<CR>",
	"telescope",
	"telescope_git_bcommits",
	"Search buffer git commits"
)
