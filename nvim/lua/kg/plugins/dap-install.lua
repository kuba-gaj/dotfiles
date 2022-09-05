local present, dap_install = pcall(require, "dap-install")

if not present then
	return
end

dap_install.setup({})
-- dap_install.config("chrome", {})
-- dap_install.config("go", {})
dap_install.config("jsnode", {})

local dap = require('dap')
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}
dap.configurations.typescript = {
  {
    name = 'Debug',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
    outFiles = {"${workspaceFolder}/build/**/*.js"},
    -- for serverless
    -- "program": "${workspaceRoot}/node_modules/.bin/sls",
    -- args = {
    --   "invoke",
    --   "local",
    --   "-f",
    --   "hello",
    --   "--data",
    --   "{}"
    -- }
  },
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
  -- ENVIRONMENT=dev AWS_PROFILE=trint-dev yarn generate-env && PLATFORM_TENANT=dev nodemon --watch src --verbose --exec 'node --inspect -r dotenv/config -r ts-node/register ./src/index.ts'
}
-- local M = {}
-- M.dap_install_servers = function()
-- 	local function installDebugServer(debugServer)
-- 		vim.cmd("DIInstall " .. debugServer)
-- 	end

-- 	installDebugServer("chrome")
-- 	installDebugServer("jsnode")
-- 	installDebugServer("go")
-- end

local r = require("kg.utils.remaps")

r.which_key("<leader>ds", "servers")
-- r.noremap("n", "<leader>dsi", M.dap_install_servers(), "Install DAP servers")

r.noremap("n", "<leader>dsl", "<cmd>DIList<CR>", "DAP servers install info")

