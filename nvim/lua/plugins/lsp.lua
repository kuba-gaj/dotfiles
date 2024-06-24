return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
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
          vtsls = {
            autoUseWorkspaceTsdk = true,
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
                -- entriesLimit = 100,
              },
            },
          },
          typescript = {
            preferences = {
              -- "Enable/disable searching `package.json` dependencies for available auto imports."
              -- "Search dependencies based on estimated performance impact.",
              -- "Never search dependencies."
              -- "Always search dependencies.",
              includePackageJsonAutoImports = "auto", -- auto, on, off
              -- Specify glob patterns of files to exclude from auto imports. Relative paths are resolved relative to the workspace root. Patterns are evaluated using tsconfig.json [`exclude`](https://www.typescriptlang.org/tsconfig#exclude) semantics.
              -- autoImportFileExcludePatterns = [],
            },
            tsserver = {
              maxTsServerMemory = 16000,
              useSyntaxServer = "auto", --auto,always,never
              useSeparateSyntaxServer = true,
              -- log = "/home/kuba/dev/tsserver.log",
              -- use cmd in setup instead to get rid of the tsserver popup
              -- nodePath = "/home/kuba/dev/node-v22.1.0-linux-x64-pointer-compression/bin/node",
            },
          },
        },
      },
    },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" or client.name == "vtsls" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
      vtsls = function(_, opts)
        -- using unofficial build with pointer compression enabled
        -- https://github.com/typescript-language-server/typescript-language-server/issues/472#issuecomment-1195166893
        -- https://github.com/yioneko/vtsls/issues/136#issuecomment-1919246219
        -- https://v8.dev/blog/pointer-compression
        local nodePath = "/home/kuba/dev/node-v22.1.0-linux-x64-pointer-compression/bin/node"
        local masonRoot = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")
        local vtslsPath = masonRoot .. "/bin/vtsls"

        opts.cmd = {
          nodePath,
          vtslsPath,
          "--stdio",
        }
        -- return opts
      end,
    },
  },
}
