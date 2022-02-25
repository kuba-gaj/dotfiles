local present, alpha = pcall(require, "alpha")

if not present then
	return
end

-- alpha.setup(require'alpha.themes.startify'.opts)
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
}

dashboard.section.buttons.val = {
	dashboard.button("e", " New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", " Find file", ":cd $HOME | Telescope find_files<CR>"),

  dashboard.button("s", " Restore Session", "<CMD>SessionManager load_last_session<CR>"),
  dashboard.button("S", " Sessions", ":SessionManager load_session<CR>"),
  dashboard.button("p", " Projects", ":Telescope projects<CR>"),
  dashboard.button("r", " Recent files", ":Telescope oldfiles<CR>"),

  dashboard.button("c", " Config", ":e $MYVIMRC | pwd<CR>"),
  dashboard.button("u p", " Update plugins", ":PackerSync<CR>"),
  -- dashboard.button("u l", " Update LSP", '<cmd>lua require("kg.lsp.functions").lsp_install_servers()<CR>'),
  dashboard.button("u l", " Update LSP", "<cmd>LspInstallInfo<CR>"),

  dashboard.button("q", " Quit NVIM", ":qa<CR>"),
}

-- local function footer()
-- 	local datetime = os.date("%d-%m-%Y  %H:%M:%S")
-- 	return datetime
-- end
--
-- dashboard.section.footer.val = footer()
-- dashboard.section.footer.opts.hl = "Constant"

-- Send config to alpha
local glob_split = require("kg.utils.functions").glob_split
local start_plugins = #glob_split("~/.local/share/nvim/site/pack/packer/start/*")
local opt_plugins = #glob_split("~/.local/share/nvim/site/pack/packer/opt/*")

dashboard.section.footer.val = {
    string.format("   %d plugins (%d loaded)", start_plugins + opt_plugins, start_plugins),
    "  https://github.com/lucax88x/configs",
}

alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
