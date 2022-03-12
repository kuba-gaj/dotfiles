local present, git_worktree = pcall(require, "git-worktree")

if not present then
	return
end

git_worktree.setup({
  change_directory_command = "tcd", -- default: "cd",
  update_on_change = true, -- default: true,
  update_on_change_command = "e .", -- default: "e .",
  clearjumps_on_change = true, -- default: true,
  autopush = false, -- default: false,
})

local r = require("kg.utils.remaps")
local telescope = require("telescope")

r.which_key("<leader>gw", "worktree")

r.noremap("n", "<leader>gwl", telescope.extensions.git_worktree.git_worktrees, "worktree_list_del", "Switch and Delete worktrees");
r.noremap("n", "<leader>gwc", telescope.extensions.git_worktree.create_git_worktree, "worktree_create", "Create a worktree");

