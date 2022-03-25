local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- npm install -g @fsouza/prettierd
-- npm install -g stylelint
-- paci selene-linter
-- paci shfmt-bin
-- paci shellcheck-bin
-- paci yamllint
-- paci hadolint-bin
-- paci fixjson
-- paci write-good
-- paci nginxbeautifier
-- paci stylua

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local with_root_file = function(builtin, file)
  return builtin.with {
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

local with_diagnostics_code = function(builtin)
  return builtin.with {
    diagnostics_format = "#{m} [#{c}]",
  }
end

null_ls.setup {
  debug = false,
  sources = {
    -- diagnostics.actionlint,
    with_root_file(diagnostics.selene, "selene.toml"),
    with_diagnostics_code(diagnostics.shellcheck),
    diagnostics.shellcheck,
    diagnostics.zsh,
    diagnostics.stylelint,
    diagnostics.yamllint,
    diagnostics.hadolint,

    -- with_root_file(formatting.stylua, "stylua.toml"),
    formatting.stylua,
    formatting.prettierd,
    formatting.stylelint,
    formatting.nginx_beautifier,
    formatting.shfmt,
    formatting.sqlformat,
    formatting.xmllint,
    formatting.fixjson,

    code_actions.gitsigns,
    code_actions.gitrebase,
    code_actions.refactoring,
    code_actions.shellcheck,
  },
}
