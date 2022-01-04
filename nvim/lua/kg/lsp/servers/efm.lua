local lsp =  'lspconfig'
local functions = require 'kg.utils.functions'

local stylua = require 'kg.lsp.servers.formatters.stylua'
local prettier_d = require 'kg.lsp.servers.formatters.prettier_d'
local eslint_d = require 'kg.lsp.servers.linters.eslint_d'
local yaml_lint = require 'kg.lsp.servers.linters.yaml_lint'

local languages = {
  lua = {stylua},
  typescript = {prettier_d, eslint_d},
  javascript = {prettier_d, eslint_d},
  typescriptreact = {prettier_d, eslint_d},
  ['typescript.tsx'] = {prettier_d, eslint_d},
  javascriptreact = {prettier_d, eslint_d},
  ['javascript.jsx'] = {prettier_d, eslint_d},
  vue = {prettier_d, eslint_d},
  yaml = {prettier_d, yaml_lint},
  html = {prettier_d},
  scss = {prettier_d},
  css = {prettier_d},
  markdown = {prettier_d}
}

return function()
    return {
        root_dir = function(fname)
         local cwd = lsp.util.root_pattern("tsconfig.json")(fname) or
                   lsp.util.root_pattern(".eslintrc.json", ".git")(fname) or
                   lsp.util.root_pattern("package.json", ".git/",".zshrc")(fname);
         return cwd
        end,
        filetypes = vim.tbl_keys(languages),
        init_options = {
          documentFormatting = true,
          codeAction = true,
        },
        settings = {
          rootMarkers = { "package.json", ".git" },
          lintDebounce = 500,
          languages = languages
        }
    }
end
