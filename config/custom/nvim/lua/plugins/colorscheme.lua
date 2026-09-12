-- Colors follow the Omarchy theme when its generated lazy.nvim spec exists
-- (`omarchy theme set` rewrites <state>/omarchy/current/theme/neovim.lua);
-- otherwise fall back to Catppuccin Mocha (macOS / non-Omarchy Arch).
-- The two are mutually exclusive: never layer catppuccin opts on the generated
-- spec, or LazyVim's colorscheme opt fights itself. Startup-only - a running
-- nvim keeps its colors until restart. Each theme pulls its own colorscheme
-- plugin, so the first start after switching themes installs it.
local state = vim.env.XDG_STATE_HOME or (vim.env.HOME .. "/.local/state")
local theme_file = state .. "/omarchy/current/theme/neovim.lua"
local exists = ((vim.uv or vim.loop).fs_stat(theme_file)) ~= nil
local ok, omarchy
if exists then
  ok, omarchy = pcall(dofile, theme_file)
else
  ok, omarchy = false, nil
end
local valid = ok and type(omarchy) == "table" and #omarchy > 0

if exists and not valid then
  vim.notify(
    "colorscheme.lua: " .. theme_file .. " exists but is not a valid lazy.nvim spec, falling back to Catppuccin",
    vim.log.levels.WARN
  )
end

-- tokyonight-disabled only applies to the catppuccin fallback: the native omarchy
-- tokyo-night theme ships its own enabled folke/tokyonight.nvim spec (see
-- /usr/share/omarchy/themes/tokyo-night/neovim.lua), so a spec on this branch
-- must never fight it.
local theme = valid and omarchy or {
  { "catppuccin/nvim", name = "catppuccin" },
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin-mocha" } },
  { "folke/tokyonight.nvim", enabled = false },
}

return vim.list_extend(theme, {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    enabled = not vim.g.started_by_firenvim,
  },
})
