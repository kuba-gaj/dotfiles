local present, true_zen = pcall(require, "true-zen")

if not present then
  return
end

true_zen.setup {
  integrations = {
    gitsigns = true,
    galaxyline = true,
  },
}

local r = require "kg.utils.remaps"

-- r.which_key("<leader>z", "zen")
r.noremap("n", "<leader>bz", "<cmd>:TZFocus<CR>", "Zen Focus")
