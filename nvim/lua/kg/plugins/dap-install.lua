local present, dap_install = pcall(require, "dap-install")

if not present then
	return
end

dap_install.setup({})
dap_install.config("chrome", {})

local r = require("kg.utils.remaps")

r.which_key("<leader>ds", "servers")
r.noremap("n", "<leader>dsi", function()
	require("kg.plugins.dap-install.functions").dap_install_servers()
end, "dap_install_server", "Install DAP servers")

r.noremap("n", "<leader>dsl", "<cmd>DIList<CR>", "dap_install_server_info", "DAP servers install info")

local M = {}
M.dap_install_servers = function()
	local function installDebugServer(debugServer)
		vim.cmd("DIInstall " .. debugServer)
	end

	installDebugServer("chrome")
end

return M
