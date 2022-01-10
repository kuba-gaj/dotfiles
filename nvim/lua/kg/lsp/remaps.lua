local r = require("kg.utils.remaps")

local M = {}
-- defaults

function M.set_default_on_buffer(client, bufnr)
	local function buf_set_keymap(type, input, output, unique_identifier, description)
		r.noremap(type, input, output, unique_identifier, description, { buffer = bufnr })
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	local cap = client.server_capabilities

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- gives definition & references
	-- buf_set_keymap('n', '<leader>tt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

	if cap.definitionProvider then
		buf_set_keymap(
			"n",
			"gd",
			"<cmd>lua vim.lsp.buf.definition()<CR>",
			"lsp_preview_definition",
			"Preview definition"
		)
	end
	-- if cap.declarationProvider then
	-- map('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	-- end
	if cap.implementationProvider then
		buf_set_keymap(
			"n",
			"<leader>gi",
			"<cmd>lua vim.lsp.buf.implementation()<CR>",
			"lsp_goto_implementation",
			"Go to implementation"
		)
	end
	if cap.referencesProvider then
		-- buf_set_keymap('n','<leader>tr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
		buf_set_keymap(
			"n",
			"gr",
			"<cmd>lua require('telescope.builtin').lsp_references()<CR>",
			"lsp_references",
			"Show references"
		)
	end

	if cap.hoverProvider then
		buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "lsp_hover_docs", "Hover documentation")
		buf_set_keymap("n", "<leader>tt", "<cmd>Trouble<cr>", "lsp_trouble", "Trouble")
	end

	if cap.documentSymbolProvider then
		-- buf_set_keymap('n','<leader>to', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
		buf_set_keymap(
			"n",
			"<leader>tO",
			"<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
			"lsp_document_symbols",
			"Document symbols"
		)
		buf_set_keymap(
			"n",
			"<leader>to",
			"<cmd>AerialToggle!<CR>",
			"lsp_aerial_document_symbols",
			"(Aerial) Document symbols"
		)
	end

	buf_set_keymap(
		"n",
		"<leader>ts",
		"<cmd>lua vim.lsp.buf.signature_help()<CR>",
		"lsp_signature_help",
		"Show signature"
	)

	-- if cap.workspaceSymbolProvider then
	--   map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
	-- end

	if cap.codeActionProvider then
		buf_set_keymap(
			"n",
			"<leader>fa",
			"<cmd>lua require('telescope.builtin').lsp_code_actions({ timeout = 1000 })<CR>",
			"lsp_code_actions",
			"Code actions"
		)
		buf_set_keymap(
			"v",
			"<leader>fa",
			"<cmd>lua require('telescope.builtin').lsp_range_code_actions({ timeout = 1000 })<CR>",
			"lsp_code_actions_in_visual",
			"Code actions (visual)"
		)
	end

	-- buf_set_keymap('n','<leader>fe', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	-- buf_set_keymap('n','<leader>fe', '<cmd>:LspDiagnostics 0<CR>', opts)
	-- buf_set_keymap(
	-- 	"n",
	-- 	"<leader>fe",
	-- 	"<cmd>lua require('kg.lsp.functions').show_diagnostics()<CR>",
	-- 	"lsp_show_diagnostics",
	-- 	"Show diagnostics"
	-- )
	buf_set_keymap(
		"n",
		"<leader>fe",
		"<cmd>Trouble document_diagnostics<cr>",
		"lsp_show_diagnostics",
		"Show diagnostics"
	)
	buf_set_keymap(
		"n",
		"<leader>fE",
		"<cmd>lua vim.diagnostic.open_float()<CR>",
		"lsp_show_line_diagnostics",
		"Show line diagnostics"
	)
	buf_set_keymap(
		"n",
		"[e",
		"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
		"lsp_previous_diagnostic",
		"Previous diagnostic"
	)
	buf_set_keymap("n", "]e", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "lsp_next_diagnostic", "Next diagnostic")

	if cap.documentFormattingProvider then
		buf_set_keymap("n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", "lsp_format", "Format")
	elseif cap.documentRangeFormattingProvider then
		buf_set_keymap("n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", "lsp_range_format", "Format")
	end

	if cap.renameProvider then
		-- buf_set_keymap('n','<leader>tr','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
		buf_set_keymap(
			"n",
			"<leader>fr",
			"<cmd>lua require('renamer').rename({ empty = true })<cr>",
			"lsp_rename_empty",
			"Rename"
		)
		buf_set_keymap(
			"n",
			"<leader>rR",
			"<cmd>lua require('renamer').rename({ empty = false })<cr>",
			"lsp_rename",
			"Rename with existing value"
		)
	end

	buf_set_keymap(
		"n",
		"<leader>lsc",
		":lua print(vim.inspect(vim.lsp.get_active_clients()))<CR>",
		"lsp_debug_clients",
		"LSP clients"
	)
	buf_set_keymap("n", "<leader>lsl", ":lua print(vim.lsp.get_log_path())<CR>", "lsp_debug_logs", "LSP show log path")
	buf_set_keymap("n", "<leader>fsi", ":LspInfo()<CR>", "lsp_info", "[DEBUG] LSP Info")
end

function M.set_typescript(client, bufnr)
	local function buf_set_keymap(type, input, output, unique_identifier, description)
		r.noremap(type, input, output, unique_identifier, description, { buffer = bufnr })
	end
	local presentTsUtils, tsUtils = pcall(require, "nvim-lsp-ts-utils")

	if presentTsUtils then
		tsUtils.setup({
			auto_inlay_hints = false,
		})
		-- required to fix code action ranges and filter diagnostics
		tsUtils.setup_client(client)
	end

	buf_set_keymap("n", "<leader>fo", ":TSLspOrganize<CR>", "lsp_typescript_organize", "Organize imports")
	buf_set_keymap("n", "<leader>fc", ":TSLspFixCurrent<CR>", "lsp_typescript_fix_current", "Fix current")
	buf_set_keymap("n", "<leader>fi", ":TSLspImportAll<CR>", "lsp_typescript_import_all", "Import all")
end

r.which_key("<leader>ls", "servers")

r.noremap(
	"n",
	"<leader>lsu",
	'<cmd>lua require("kg.lsp.servers.functions").lsp_install_servers()<CR>',
	"lsp_install_server",
	"Installer LSP servers"
)

r.noremap("n", "<leader>lsl", "<cmd>LspInstallInfo<CR>", "lsp_install_server_info", "LSP servers install info")

return M
