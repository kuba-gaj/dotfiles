local M = {}

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
M.lsp_install_servers = function()
    local function installLanguageServer(languageServer)
      vim.cmd ('LspInstall ' .. languageServer)
    end

    installLanguageServer('tsserver')
    installLanguageServer('efm')
    installLanguageServer('sumneko_lua')
    installLanguageServer('bashls')
    installLanguageServer('jsonls')
    installLanguageServer('yamlls')
    installLanguageServer('html')
    installLanguageServer('cssls')
    installLanguageServer('dockerls')
    installLanguageServer('graphql')
end

return M
