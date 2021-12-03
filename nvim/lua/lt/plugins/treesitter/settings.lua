-- neorg treesitter
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}
-- end neorgtreesitter

-- enable jsonc
parser_configs.jsonc.used_by = "json";

local treesitter = require'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = {"typescript", "html", "tsx", "lua", "json", "rust", "css", "javascript", "c_sharp", "norg", "graphql"},
  highlight = {
    enable = true,
  },
  matchup = {
    enable = true
  },
  context_commentstring = { enable = true }
}
