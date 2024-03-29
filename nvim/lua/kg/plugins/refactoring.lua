local present, refactoring = pcall(require, "refactoring")

if not present then
  return
end

refactoring.setup {}

local r = require "kg.utils.remaps"

r.which_key("<leader>te", "extract")
r.which_key("<leader>ti", "inline")

r.noremap("v", "<leader>tef", function()
  refactoring.refactor "Extract Function"
end, "Extract Function")

r.noremap("v", "<leader>teF", function()
  refactoring.refactor "Extract Function To File"
end, "Extact Function to file")

r.noremap("v", "<leader>tev", function()
  refactoring.refactor "Extract Variable"
end, "Extact variable")

r.noremap("v", "<leader>tiv", function()
  refactoring.refactor "Inline Variable"
end, "Inline variable")
