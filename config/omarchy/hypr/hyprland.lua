-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Disable all Omarchy default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Omarchy's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- omarchy_preinstalled_bindings = false

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Add any other personal Hyprland configuration below.
-- o.window("qemu", { workspace = "5" })

-- KUB-122 (item 7): zen tab-title routing — a tab titled "ws3 …" / "[ws3] …" pulls its window to workspace 3 (silent).
-- Replaces the museum `hyprevents` socket listener's title handler. Callback gets the window handle; `window.move`
-- accepts `window = w` (verified: moves a non-focused window).
hl.on("window.title", function(w)
  if not (w and w.class and w.title and w.class:match("^zen")) then return end
  local ws = w.title:match("^%[?ws(%d+)")
  if ws and w.workspace and w.workspace.id ~= tonumber(ws) then
    hl.dispatch(hl.dsp.window.move({ workspace = ws, follow = false, window = w }))
  end
end)
