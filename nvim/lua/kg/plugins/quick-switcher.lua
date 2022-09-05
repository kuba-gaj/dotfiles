local present, quick_switcher = pcall(require, "nvim-quick-switcher")

if not present then
  return
end

local r = require "kg.utils.remaps"

r.which_key("<leader>q", "quick-switcher")

r.noremap("n", "<leader>qc", function()
  quick_switcher.toggle("component.ts", "vue")
end, "vue <-> component")

r.noremap("n", "<leader>qt", function()
  quick_switcher.toggle("spec.ts", "ts")
end, "spec <-> code")
