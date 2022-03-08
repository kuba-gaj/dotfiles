local r = require("kg.utils.remaps")

vim.g.grepper = {
  tools = {"rg", "git"},
  dir = 'repo,cwd',
  searchreg = 1,
}

r.map({"n", "v"}, "gs", "<Plug>(GrepperOperator)", "grep_operator", "Grep operator")
r.map("n", "<leader>pG", ":Grepper<CR>", "grep", "Grep")

vim.cmd(([[
    aug Grepper
        au!
        au User Grepper ++nested %s
    aug END
]]):format([[call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': '\%#' . getreg('/')}}})]]))
-- next_tool = '<leader>g',
-- vim.g.grepper.jump = 1
-- vim.g.grepper.simple_prompt = 1
-- vim.g.grepper.quickfix = 1

-- r.noremap()
