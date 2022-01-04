local true_zen = require("true-zen")

true_zen.setup({
	integrations = {
		gitsigns = true,
    galaxyline = true,
	}
})

local r = require("kg.utils.remaps")
r.nnoremap('<leader>zm', '<cmd>:TZMinimalist<CR>', 'zen', 'zen_minimalist', 'Zen Minimalist')
r.nnoremap('<leader>zz', '<cmd>:TZFocus<CR>', 'zen', 'zen_focus', 'Zen Focus')
r.nnoremap('<leader>za', '<cmd>:TZAtaraxis<CR>', 'zen', 'zen_ataraxis', 'Zen Ataraxis')
