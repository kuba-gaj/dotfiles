local r = require "kg.utils.remaps"
local telescope = require "telescope"
local builtin = require "telescope.builtin"
local functions = require "kg.utils.functions"
local telescope_functions = require "kg.plugins.telescope-functions"

telescope.setup {
  defaults = {
    -- file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    vimgrep_arguments = {
      "rg",
      "--hidden",
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
    -- layout_config = { prompt_position = "bottom" },
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
    git_files = { previewer = true },
    registers = { theme = "dropdown" },
    -- lsp_references = { previewer = false },
    lsp_code_actions = {
      theme = "cursor",
      layout_config = {
        height = 12,
      },
    },
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
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      },
    },
  },
}

telescope.load_extension "ui-select"

if functions.is_linux() then
  telescope.load_extension "fzf"
end

if pcall(require, "nvim-mapper") then
  telescope.load_extension "mapper"
end

if pcall(require, "project_nvim") then
  telescope.load_extension "projects"
end

if pcall(require, "harpoon") then
  telescope.load_extension "harpoon"
end

if pcall(require, "nvim-notify") then
  telescope.load_extension "notify"
end

if pcall(require, "git-worktree") then
  telescope.load_extension "git_worktree"
end

if pcall(require, "dap") then
  telescope.load_extension "dap"
end

r.noremap("n", "<leader>pp", "<cmd>Telescope projects<CR>", "Projects")
r.noremap("n", "<leader>ps", builtin.live_grep, "Live grep")
-- r.noremap(
-- 	"n",
-- 	"<leader>pS",
-- 	telescope_functions.live_grep_in_folder,
-- 	"telescope_live_grep_in_folder",
-- 	"Live grep in folder"
-- )
--
r.noremap("n", "<leader>pf", builtin.find_files, "Find files")
r.noremap("n", "<leader>pF", telescope_functions.find_git_files, "Find git files")
-- r.noremap("n", "<leader>po", builtin.oldfiles, "Find files")
-- r.noremap("n", "<leader>pg", builtin.git_files, "Find git files")
r.noremap("n", "<leader>cc", telescope_functions.search_config, "Search neovim config")
r.noremap("n", "<leader>/h", builtin.highlights, "Search highlights")
r.noremap("n", "<leader>/C", builtin.command_history, "Search command history")
r.noremap("n", "<leader>/c", builtin.commands, "Search commands")
r.noremap("n", "<leader>/r", builtin.registers, "Search registers")
r.noremap("n", "<leader>/m", builtin.marks, "Search marks")
r.noremap("n", "<leader>/M", builtin.keymaps, "Search keymaps")
r.noremap("n", "<leader>/t", builtin.treesitter, "Search treesitter")
r.noremap("n", "<leader>/gb", builtin.git_branches, "Search git branches")
r.noremap("n", "<leader>/gc", builtin.git_commits, "Search git commits")
r.noremap("n", "<leader>bl", builtin.buffers, "Search buffers")
r.noremap("n", "<leader>bc", builtin.git_bcommits, "Search buffer git commits")
