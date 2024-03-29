local present, lspconfig = pcall(require, "lspconfig")
if not present then
  return
end

local vim = vim
require "kg.lsp.null-ls"
local remaps = require "kg.lsp.remaps"

local presentLspStatus, lspStatus = pcall(require, "lsp-status")
local presentCmpNvimLsp, cmpNvimLsp = pcall(require, "cmp_nvim_lsp")
local presentAerial, aerial = pcall(require, "aerial")
local presentLspSignature, lspSignature = pcall(require, "lsp_signature")
local presentNavic, navic = pcall(require, "nvim-navic")

vim.lsp.set_log_level "error" -- 'trace', 'debug', 'info', 'warn', 'error'

local function on_attach(client, bufnr)
  -- print(client.name)
  remaps.set_default_on_buffer(client, bufnr)

  if presentLspStatus then
    lspStatus.on_attach(client, bufnr)
  end

  if presentAerial then
    aerial.on_attach(client, bufnr)
  end

  if presentLspSignature then
    lspSignature.on_attach { floating_window = false, timer_interval = 500 }
  end

  if presentNavic then
    if client.name ~= "eslint" and client.name ~= "angularls" then
      navic.attach(client, bufnr)
    end
  end
end

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  virtual_text = true,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focus = false,
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

if presentLspStatus then
  lspStatus.register_progress()
  capabilities = vim.tbl_extend("keep", capabilities, lspStatus.capabilities)
end

if presentCmpNvimLsp then
  capabilities = vim.tbl_extend("keep", capabilities, cmpNvimLsp.update_capabilities(capabilities))
end

local servers = {
  bashls = {},
  cssls = {},
  dockerls = {},
  eslint = require "kg.lsp.servers.eslint"(on_attach),
  graphql = {},
  html = {},
  jsonls = require "kg.lsp.servers.jsonls"(capabilities),
  sumneko_lua = require "kg.lsp.servers.sumneko_lua"(on_attach),
  tailwindcss = {},
  terraformls = {},
  yamlls = require "kg.lsp.servers.yamlls"(capabilities),
  solang = {},
  solc = {}, -- official solc from ethereum
  solidity_ls = {}, -- not workign atm, this is vs-code wtih code completion
}

local default_lsp_config = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 200,
    allow_incremental_sync = true,
  },
}

local server_names = {}
for server_name, _ in pairs(servers) do
  table.insert(server_names, server_name)
end

local present_lsp_installer, lsp_installer = pcall(require, "nvim-lsp-installer")
if present_lsp_installer then
  lsp_installer.setup { ensure_installed = server_names }
end

local present_typescript, typescript = pcall(require, "typescript")
if present_typescript then
  typescript.setup({
    server = {
      on_attach = function(_, bufnr)
        remaps.set_typescript(bufnr)
      end,
    },
  })
end

for server_name, server_config in pairs(servers) do
  local merged_config = vim.tbl_deep_extend("force", default_lsp_config, server_config)

  lspconfig[server_name].setup(merged_config)

  if server_name == "rust_analyzer" then
    local present_rust_tools, rust_tools = pcall(require, "rust-tools")

    if present_rust_tools then
      rust_tools.setup { server = merged_config }
    end
  end
end
