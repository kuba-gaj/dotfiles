local present, neogen = pcall(require, "neogen")

if not present then
  return
end

neogen.setup {
  enabled = true,
}

local r = require "kg.utils.remaps"

r.map("n", "<leader>tc", neogen.generate, "Add documentation for the method/class/function ")
