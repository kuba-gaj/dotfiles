require("which-key").setup{
  triggers = "auto"
}

require("which-key").register({
  ["<leader>"] = {
    g = { name = '+git' },
    t = { name = '+type' },
    b = { name = '+buffer' },
    p = { name = '+project' },
    f = { name = '+fix' },
    s = { name = '+session' },
    m = { name = '+mark' },
    w = { name = '+window' },
    r = {
      name = '+refactor',
      -- l = { name  = 'line' },
      -- p = { name  = 'parameter' }
    },
    h = { name = '+hunk' },
    z = { name = '+zen' }
  }
});
