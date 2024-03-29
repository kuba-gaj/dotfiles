local M = {}
local vim = vim

M.show_diagnostics = function(opts)
	opts = opts or {}
	vim.diagnostic.setloclist({ open_loclist = false })
	require("telescope.builtin").loclist(opts)
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
M.lsp_install_servers = function()
	local function installLanguageServer(languageServer)
		vim.cmd("LspInstall " .. languageServer)
	end

	installLanguageServer("tsserver")
	installLanguageServer("sumneko_lua")
	installLanguageServer("bashls")
	installLanguageServer("jsonls")
	installLanguageServer("yamlls")
	installLanguageServer("html")
	installLanguageServer("cssls")
	installLanguageServer("dockerls")
	installLanguageServer("graphql")
	installLanguageServer("efm")
	installLanguageServer("terraformls")
	installLanguageServer("eslint")
	installLanguageServer("solidity_ls")
end

return M
