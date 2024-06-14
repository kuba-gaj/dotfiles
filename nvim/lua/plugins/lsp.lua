return {
  "neovim/nvim-lspconfig",
  -- enabled = true,
  opts = {
    -- python tweaks
    servers = {
      basedpyright = {
        disableOrganizeImports = true, -- using Ruff
      },
      pyright = {
        enabled = false,
        disableOrganizeImports = true, -- using Ruff
      },
      vtsls = {
        settings = {
          maxTsServerMemory = 16300,
          vtsls = {
            maxTsServerMemory = 16300,
          },
          typescript = {
            maxTsServerMemory = 16300,
            tsserver = {
              useSeparateSyntaxServer = false,
              useSyntaxServer = "never",
            },
          },
        },
      },
    },
  },
}
