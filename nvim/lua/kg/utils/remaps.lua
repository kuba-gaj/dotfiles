local vim = vim
local present_which_key, which_key = pcall(require, "which-key")
local keymap = vim.keymap

local M = {}

local function try_add_to_which_key_by_input(mode, input, description)
  if mode == "" then
    mode = { "n", "v", "o" }
  end
  if present_which_key then
    if type(mode) == "string" then
      which_key.register({
        [input] = description,
      }, { mode = mode })
    else
      for _, mode_name in pairs(mode) do
        which_key.register({
          [input] = description,
        }, { mode = mode_name })
      end
    end
  end
end

function M.map(type, input, output, description, additional_options)
  local options = { remap = true, desc = description }
  if additional_options then
    options = vim.tbl_deep_extend("force", options, additional_options)
  end

  keymap.set(type, input, output, options)

  try_add_to_which_key_by_input(type, input, description)
end

function M.noremap(type, input, output, description, additional_options)
  local options = { remap = false }
  if additional_options then
    options = vim.tbl_deep_extend("force", options, additional_options)
  end

  M.map(type, input, output, description, options)
end

function M.map_virtual(type, input, description)
  try_add_to_which_key_by_input(type, input, description)
end

function M.which_key(input, description)
  if present_which_key then
    which_key.register {
      [input] = description,
    }
  end
end

return M
