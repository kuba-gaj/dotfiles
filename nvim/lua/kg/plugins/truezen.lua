local true_zen = require("true-zen")

true_zen.setup({
	integrations = {
		gitsigns = true,
		galaxyline = true,
	},
})

local r = require("kg.utils.remaps")

-- r.which_key("<leader>z", "zen")
r.noremap("n", "<leader>bz", "<cmd>:TZFocus<CR>", "zen_focus", "Zen Focus")
