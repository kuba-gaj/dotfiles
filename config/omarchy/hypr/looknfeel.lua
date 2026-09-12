-- Look'n'feel (KUB-102): museum eye candy on top of omarchy. Border colours are NOT set here so the
-- active omarchy theme wins. Plugins (hyprfocus, hyprwinwrap) intentionally not ported — not installed.

hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 4,
    gaps_workspaces = 50,
    border_size = 3,
    layout = "master",
    resize_on_border = true,
    allow_tearing = true,
    no_focus_fallback = true,
  },
  decoration = {
    rounding = 4,
    dim_inactive = true,
    dim_strength = 0.1,
    dim_special = 0.2,
    blur = {
      enabled = true,
      size = 12,
      passes = 3,
      new_optimizations = true,
      ignore_opacity = true,
      xray = true,
    },
  },
  master = {
    orientation = "center",
    new_status = "slave",
    slave_count_for_center_master = 0,
    smart_resizing = true,
    new_on_top = true,
    mfact = 0.5,
  },
  dwindle = {
    preserve_split = true,
    smart_resizing = false,
    smart_split = false,
  },
})

-- Museum beziers + animations.
hl.curve("snap", { type = "bezier", points = { { 0.2, 0.8 }, { 0.2, 1 } } })
hl.curve("smoothIn", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })
hl.curve("smoothOut", { type = "bezier", points = { { 0.36, 0 }, { 0.66, -0.56 } } })

for _, leaf in ipairs({ "windows", "windowsIn", "windowsMove", "fade", "workspaces" }) do
  hl.animation({ leaf = leaf, enabled = true, speed = 3, bezier = "snap" })
end
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "smoothOut" })
hl.animation({ leaf = "border", enabled = true, speed = 2, bezier = "snap" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "snap", style = "slidevert" })
