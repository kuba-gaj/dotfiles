local present, alpha = pcall(require, 'alpha')


if not (present) then
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
    dashboard.button( "e", " New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", " Find file", ":cd $HOME | Telescope find_files<CR>"),

    dashboard.button("s", " Sessions", ":SessionManager load_session<CR>"),
    dashboard.button( "p", " Projects", ":Telescope projects<CR>"),
    dashboard.button( "r", " Recent files"   , ":Telescope oldfiles<CR>"),

    dashboard.button( "c", " Config" , ":e $MYVIMRC | pwd<CR>"),
    dashboard.button( "u p", " Update plugins", ":PackerSync<CR>"),
    dashboard.button( "u l", " Update LSP", '<cmd>lua require("kg.lsp.functions").lsp_install_servers()<CR>'),

    dashboard.button( "q", " Quit NVIM", ":qa<CR>"),
}

local function footer()
  local datetime = os.date("%d-%m-%Y  %H:%M:%S")
  return datetime
end

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
