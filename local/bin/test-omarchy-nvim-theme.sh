#!/usr/bin/env bash
# KUB-133: colorscheme.lua must pick the omarchy-generated lazy.nvim spec when it
# exists and fall back to catppuccin when it doesn't - and never merge the two.
# Runs the spec file standalone via `nvim -l` (no lazy.nvim, no plugin install,
# no lockfile writes), with XDG_STATE_HOME pointed at a temp dir.
set -euo pipefail

spec="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)/config/custom/nvim/lua/plugins/colorscheme.lua"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

mkdir -p "$tmp/state-retro/omarchy/current/theme" "$tmp/state-tokyonight/omarchy/current/theme" "$tmp/empty"
cat >"$tmp/state-retro/omarchy/current/theme/neovim.lua" <<'LUA'
return {
  { "OldJobobo/retro-82.nvim", priority = 1000 },
  { "LazyVim/LazyVim", opts = { colorscheme = "retro-82" } },
}
LUA

# Mirrors the stock /usr/share/omarchy/themes/tokyo-night/neovim.lua spec: it
# ships its own enabled folke/tokyonight.nvim entry, unlike retro-82's spec above.
cat >"$tmp/state-tokyonight/omarchy/current/theme/neovim.lua" <<'LUA'
return {
  { "folke/tokyonight.nvim", priority = 1000 },
  { "LazyVim/LazyVim", opts = { colorscheme = "tokyonight-night" } },
}
LUA

cat >"$tmp/check.lua" <<'LUA'
local specs = dofile(os.getenv("SPEC"))
local plugins, colorscheme = {}, nil
for _, p in ipairs(specs) do
  assert(not plugins[p[1]], "FAIL: duplicate spec for " .. tostring(p[1]))
  plugins[p[1]] = p
  if p.opts and p.opts.colorscheme then colorscheme = p.opts.colorscheme end
end
local function want(cond, msg) assert(cond, "FAIL: " .. msg) end
want(colorscheme == os.getenv("WANT_COLORSCHEME"),
  "colorscheme = " .. tostring(colorscheme) .. ", want " .. os.getenv("WANT_COLORSCHEME"))
want(plugins[os.getenv("WANT_PLUGIN")] ~= nil, "missing plugin " .. os.getenv("WANT_PLUGIN"))
want(plugins[os.getenv("NOT_PLUGIN")] == nil, "unexpected plugin " .. os.getenv("NOT_PLUGIN"))
-- personal, theme-independent setting survives every branch
want(plugins["xiyaowong/transparent.nvim"] ~= nil, "transparent.nvim entry lost")

-- tokyonight-disabled must only appear in the catppuccin fallback (it exists to
-- keep the fallback's optional/unused tokyonight plugin from loading); a native
-- omarchy spec's own tokyonight.nvim entry (e.g. the tokyo-night theme) must
-- reach lazy.nvim enabled and undisturbed, and other native themes must not
-- gain a tokyonight entry at all.
local tn = plugins["folke/tokyonight.nvim"]
local mode = os.getenv("TOKYONIGHT")
if mode == "disabled" then
  want(tn ~= nil and tn.enabled == false, "expected disabled tokyonight.nvim fragment in catppuccin fallback")
elseif mode == "enabled" then
  want(tn ~= nil and tn.enabled ~= false,
    "expected native tokyo-night's own tokyonight.nvim to stay enabled, got " .. tostring(tn and tn.enabled))
elseif mode == "absent" then
  want(tn == nil, "unexpected tokyonight.nvim entry for a native theme that doesn't ship one")
end
print("ok " .. colorscheme)
LUA

run() { SPEC="$spec" nvim --clean --headless -l "$tmp/check.lua"; }

echo -n "omarchy theme present (retro-82): "
XDG_STATE_HOME="$tmp/state-retro" WANT_COLORSCHEME=retro-82 WANT_PLUGIN=OldJobobo/retro-82.nvim \
  NOT_PLUGIN=catppuccin/nvim TOKYONIGHT=absent run

echo -n "omarchy theme present (tokyo-night): "
XDG_STATE_HOME="$tmp/state-tokyonight" WANT_COLORSCHEME=tokyonight-night WANT_PLUGIN=folke/tokyonight.nvim \
  NOT_PLUGIN=catppuccin/nvim TOKYONIGHT=enabled run

echo -n "no omarchy state (mac/plain arch): "
XDG_STATE_HOME="$tmp/empty" WANT_COLORSCHEME=catppuccin-mocha WANT_PLUGIN=catppuccin/nvim \
  NOT_PLUGIN=OldJobobo/retro-82.nvim TOKYONIGHT=disabled run
