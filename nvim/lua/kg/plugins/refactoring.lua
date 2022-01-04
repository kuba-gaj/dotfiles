local r = require("kg.utils.remaps")
local refactor = require("refactoring")
refactor.setup({})

r.vnoremap(
	"<leader>re",
	[[ <Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
	"refactoring",
	"refactoring_extract_function",
	"Extract Function"
)

r.vnoremap(
	"<leader>rf",
	[[ <Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
	"refactoring",
	"refactoring_extract_function_to_file",
	"Extact Function to file"
)
