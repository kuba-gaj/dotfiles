local present, hop = pcall(require, "hop")

if not present then
  return
end

hop.setup {
  jump_on_sole_occurrence = true,
}

local hint = require "hop.hint"
local r = require "kg.utils.remaps"

r.map("n", "s", function()
  hop.hint_char2 { direction = hint.HintDirection.AFTER_CURSOR, current_line_only = false }
end, "Search")

r.map("n", "S", function()
  hop.hint_char2 { direction = hint.HintDirection.BEFORE_CURSOR, current_line_only = false }
end, "Search")

r.map("n", "f", function()
  hop.hint_char1 { direction = hint.HintDirection.AFTER_CURSOR, current_line_only = true }
end, "Search")

r.map("n", "F", function()
  hop.hint_char1 { direction = hint.HintDirection.BEFORE_CURSOR, current_line_only = true }
end, "Search")

r.map("o", "f", function()
  hop.hint_char1 {
    direction = hint.HintDirection.AFTER_CURSOR,
    current_line_only = true,
    inclusive_jump = true,
  }
end, "Search")

r.map("o", "F", function()
  hop.hint_char1 {
    direction = hint.HintDirection.BEFORE_CURSOR,
    current_line_only = true,
    inclusive_jump = true,
  }
end, "Search")

r.map("", "t", function()
  hop.hint_char1 { direction = hint.HintDirection.AFTER_CURSOR, current_line_only = true }
end, "Search")

r.map("", "T", function()
  hop.hint_char1 { direction = hint.HintDirection.BEFORE_CURSOR, current_line_only = true }
end, "Search")
