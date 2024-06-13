return {
  "neovim/nvim-lspconfig",
  -- enabled = true,
  opts = {
    -- python tweaks
    servers = {
      basedpyright = {
        disableOrganizeImports = true, -- using Ruff
        -- capabilities = (function()
        --   require("lazyvim.util").lsp.on_attach(function(client)
        --     if client.name == "pyright" or client.name == "basedpyright" then
        --       client.server_capabilities.publishDiagnostics.tagSupport.valueSet = { 2 }
        --     end
        --   end)
        --
        --   -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        --   -- capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
        --   -- return capabilities
        -- end)(),
      },
      pyright = {
        enabled = false,
        disableOrganizeImports = true, -- using Ruff
        -- capabilities = (function()
        --   require("lazyvim.util").lsp.on_attach(function(client)
        --     if client.name == "pyright" or client.name == "basedpyright" then
        --       client.server_capabilities.publishDiagnostics.tagSupport.valueSet = { 2 }
        --     end
        --   end)
        --
        --   -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        --   -- capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
        --   -- return capabilities
        -- end)(),
      },
      -- python = {
      -- analysis = {
      -- Ignore all files for analysis to exclusively use Ruff for linting
      -- ignore = { "*" },
      -- typeCheckingMode = "off", -- using mypy
      -- },
      -- },
    },
    inlay_hints = { enabled = true },
    maxTsServerMemory = 16300,
    tsserver = {
      maxTsServerMemory = 16300,
      init_options = {
        maxTsServerMemory = 16300,
      },
      settings = {
        maxTsServerMemory = 16300,
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
    },
  },
}
