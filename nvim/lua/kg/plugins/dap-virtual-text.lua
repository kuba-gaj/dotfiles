local present, dap_ui = pcall(require, "dapui")

if not present then
	return
end

dap_ui.setup({})

local r = require("kg.utils.remaps")

r.noremap("n", "<leader>du", '<cmd>lua require"dapui".toggle()<CR>', "Toggle DAP UI")
