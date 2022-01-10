local true_zen = require("true-zen")

true_zen.setup({
	integrations = {
		gitsigns = true,
		galaxyline = true,
	},
})

local r = require("kg.utils.remaps")

r.noremap("n", "<leader>zz", "<cmd>:TZFocus<CR>", "zen_focus", "Zen Focus")
