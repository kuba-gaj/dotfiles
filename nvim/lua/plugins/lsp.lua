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
        -- monorepo fix, also looks like it fixes memory issues
        -- i override vim.g.root_spec to have cwd/root pickers working correctly
        root_dir = function()
          local lazyvimRoot = require("lazyvim.util.root")
          -- use git for lsp root or fallback to default option vim.g.root_spec
          return lazyvimRoot.git() or lazyvimRoot.detect()
        end,
        settings = {
          vtsls = {
            autoUseWorkspaceTsdk = true,
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
                -- entriesLimit = 25,
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
              -- autoImportFileExcludePatterns = { "*trint-operation*" },
            },
            tsserver = {
              maxTsServerMemory = 8000,
              -- deprecated in favor of useSyntaxServer
              useSeparateSyntaxServer = false,
              -- Controls if TypeScript launches a dedicated server to more quickly handle syntax related operations, such as computing code folding.
              useSyntaxServer = "auto", --auto,always,never
              -- in /tmp/tsserver-log-*/tsserver.log
              log = "off", -- off, terse, normal, verbose
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
