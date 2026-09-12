-- Personal bindings on top of omarchy (KUB-102, from KUB-90 verdicts + ADR 0001/0002).
-- Omarchy SUPER binds stay unless listed in the unbind block below. ALT is the window-management layer.
-- Every o.bind carries a description: omarchy-menu-keybindings reads them.
-- Validate: hyprctl reload && hyprctl configerrors; dispatcher arg errors only surface at keypress.

---------------------------------------------------------------------------
-- 1. ALT window-management layer (ADR 0001) — all keys free in omarchy
---------------------------------------------------------------------------
local dirs = { H = "l", J = "d", K = "u", L = "r" }
for key, d in pairs(dirs) do
  o.bind("ALT + " .. key, "Focus window " .. d, hl.dsp.focus({ direction = d }))
  o.bind("ALT + SHIFT + " .. key, "Move window " .. d, hl.dsp.window.move({ direction = d }))
end

-- Workspaces 1..10 on keycodes 10..19 (layout-independent). SHIFT = move silently, CTRL = move and follow.
for ws = 1, 10 do
  local key = "code:" .. (ws + 9)
  o.bind("ALT + " .. key, "Workspace " .. ws, hl.dsp.focus({ workspace = tostring(ws) }))
  o.bind("ALT + SHIFT + " .. key, "Move window to workspace " .. ws .. " (silent)",
    hl.dsp.window.move({ workspace = tostring(ws), follow = false }))
  o.bind("ALT + CTRL + " .. key, "Move window to workspace " .. ws,
    hl.dsp.window.move({ workspace = tostring(ws) }))
end
o.bind("ALT + bracketleft", "Previous workspace (relative)", hl.dsp.focus({ workspace = "r-1" }))
o.bind("ALT + bracketright", "Next workspace (relative)", hl.dsp.focus({ workspace = "r+1" }))
o.bind("ALT + SHIFT + bracketleft", "Move window to previous workspace (silent)", hl.dsp.window.move({ workspace = "r-1", follow = false }))
o.bind("ALT + SHIFT + bracketright", "Move window to next workspace (silent)", hl.dsp.window.move({ workspace = "r+1", follow = false }))
o.bind("ALT + CTRL + bracketleft", "Move window to previous workspace", hl.dsp.window.move({ workspace = "r-1" }))
o.bind("ALT + CTRL + bracketright", "Move window to next workspace", hl.dsp.window.move({ workspace = "r+1" }))
hl.unbind("ALT + TAB") -- omarchy: next window / reveal on top
o.bind("ALT + TAB", "Former workspace", hl.dsp.focus({ workspace = "previous" }))
o.bind("ALT + mouse_down", "Next workspace (relative)", hl.dsp.focus({ workspace = "r+1" }))
o.bind("ALT + mouse_up", "Previous workspace (relative)", hl.dsp.focus({ workspace = "r-1" }))

-- Floating
o.bind("ALT + SPACE", "Toggle floating", hl.dsp.window.float({ action = "toggle" }))
o.bind("ALT + SHIFT + SPACE", "Focus other layer (floating <-> tiled)", function()
  local active = hl.get_active_window()
  if not active then return end
  local ws = hl.get_active_workspace()
  for _, w in ipairs(hl.get_windows({ workspace = ws and ws.id, floating = not active.floating })) do
    hl.dispatch(hl.dsp.focus({ window = "address:" .. w.address }))
    return
  end
end)

-- Monitors
o.bind("ALT + X", "Move window to next monitor", hl.dsp.window.move({ monitor = "+1" }))
o.bind("ALT + SHIFT + X", "Move workspace to next monitor", hl.dsp.workspace.move({ monitor = "+1" }))
o.bind("ALT + grave", "Focus next monitor", hl.dsp.focus({ monitor = "+1" }))
o.bind("ALT + SUPER + H", "Focus monitor left", hl.dsp.focus({ monitor = "l" }))
o.bind("ALT + SUPER + L", "Focus monitor right", hl.dsp.focus({ monitor = "r" }))

-- Master layout
o.bind("ALT + semicolon", "Swap with master", hl.dsp.layout("swapwithmaster auto"))
o.bind("ALT + comma", "Roll stack left", hl.dsp.layout("rollprev"))
o.bind("ALT + period", "Roll stack right", hl.dsp.layout("rollnext"))
-- 3-way layout cycle for the active workspace (replaces hyprtogglelayout; `layoutmsg setlayout` is gone in 0.56).
-- ponytail: not persisted across hyprctl reload (omarchy's toggle writes ~/.local/state/omarchy/workspace-layouts/).
o.bind("ALT + CTRL + L", "Cycle layout master → dwindle → scrolling", function()
  local ws = hl.get_active_workspace()
  if not ws then return end
  local nxt = ({ master = "dwindle", dwindle = "scrolling", scrolling = "master" })[ws.tiled_layout] or "master"
  hl.workspace_rule({ workspace = tostring(ws.id), layout = nxt })
  hl.exec_cmd("omarchy-notification-send -g 󱂬 'Layout: " .. nxt .. "'")
end)

-- Resize: ALT+arrows ±50 (repeat), ALT+R submap h/j/k/l ±10, escape to leave.
o.bind("ALT + LEFT", "Resize window left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
o.bind("ALT + RIGHT", "Resize window right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
o.bind("ALT + UP", "Resize window up", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
o.bind("ALT + DOWN", "Resize window down", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })
o.bind("ALT + R", "Resize submap: hjkl then escape", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
  hl.bind("escape", hl.dsp.submap("reset"))
  hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
  hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
  hl.bind("K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
  hl.bind("J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
end)

-- Mouse
o.bind("ALT + mouse:272", "Drag window", hl.dsp.window.drag(), { mouse = true })
o.bind("ALT + mouse:273", "Resize window", hl.dsp.window.resize(), { mouse = true })
-- Logitech MX Master extra buttons → shortcuts into the active window
o.bind("mouse:276", "MX forward: Obsidian web clipper", hl.dsp.send_shortcut({ mods = "SHIFT SUPER", key = "O" }))
o.bind("mouse:277", "MX haptic: reopen tab", hl.dsp.send_shortcut({ mods = "CTRL SHIFT", key = "T" }))
o.bind("mouse:278", "MX gesture: close tab", hl.dsp.send_shortcut({ mods = "CTRL", key = "W" }))

---------------------------------------------------------------------------
-- 2. Apps / misc
---------------------------------------------------------------------------
o.bind("SUPER + SHIFT + Q", "Kill window", hl.dsp.window.kill())
hl.unbind("SUPER + CTRL + A") -- omarchy: Audio
o.bind("SUPER + CTRL + A", "Toggle pipewire profile", "pw-profile toggle")
o.bind("ALT + ALT_L", "Voxtype record toggle", "voxtype record toggle")

---------------------------------------------------------------------------
-- 3. Scratchpads as special workspaces (ADR 0002). Terminal app-ids must be reverse-DNS (ghostty rejects
--    "drop-term" and falls back to com.mitchellh.ghostty). Class regexes are case-sensitive. No daemon: if a window whose class contains
--    `match` exists → toggle its special workspace, else launch it (window rule parks it there).
---------------------------------------------------------------------------
for _, k in ipairs({
  "SUPER + BACKSPACE", "SUPER + SHIFT + BACKSPACE", "SUPER + O", "SUPER + SHIFT + O", "SUPER + SHIFT + A",
  "SUPER + P", "SUPER + T", "SUPER + V", "SUPER + RETURN",
  "SUPER + L", -- omarchy 2-way layout toggle; ours is ALT+CTRL+L (3-way)
  "SUPER + code:10", -- omarchy "workspace 1"; ours are ALT+digits. KUB-107: SUPER+1 = 1password
}) do
  hl.unbind(k)
end

local function scratch(key, name, match, cmd, rules)
  o.bind(key, "Scratchpad: " .. name, function()
    -- "[Ss]potify.*" → "spotify" for the plain-find below (window-rule class regexes are full-match)
    local needle = match:gsub("%[%a(%a)%]", "%1"):gsub("%.%*", ""):lower()
    for _, w in ipairs(hl.get_windows({ mapped = true })) do
      if w.class:lower():find(needle, 1, true) then
        -- Self-heal: a window that opened while another special was showing lands there. Adopt it.
        if not (w.workspace and w.workspace.name == "special:" .. name) then
          hl.dispatch(hl.dsp.focus({ window = w }))
          hl.dispatch(hl.dsp.window.move({ workspace = "special:" .. name, follow = false }))
          if not w.floating then -- window rules only apply at map time
            hl.dispatch(hl.dsp.window.float({ action = "on" }))
            hl.dispatch(hl.dsp.window.resize({ x = 1920, y = 1200 }))
            hl.dispatch(hl.dsp.window.center())
          end
        end
        hl.dispatch(hl.dsp.workspace.toggle_special(name))
        -- input.special_fallthrough=true: a floating-only special doesn't take focus by itself.
        local sp = hl.get_active_special_workspace()
        if sp and sp.name == "special:" .. name then
          hl.dispatch(hl.dsp.focus({ window = w }))
        end
        return
      end
    end
    hl.exec_cmd("uwsm-app -- " .. cmd)
  end)
  -- not "silent": first launch should reveal the special workspace
  local rule = { workspace = "special:" .. name, float = true, center = true, size = { 1920, 1200 } }
  for k, v in pairs(rules or {}) do rule[k] = v end
  o.window(match, rule)
end

scratch("SUPER + BACKSPACE", "slack", "[Ss]lack", "slack")
scratch("SUPER + SHIFT + BACKSPACE", "whatsapp", "chrome-web.whatsapp.com__.*", "omarchy-launch-webapp https://web.whatsapp.com/")
scratch("SUPER + O", "obsidian", "obsidian", "obsidian")
scratch("SUPER + N", "notion", "chrome-www.notion.so__.*", "omarchy-launch-webapp https://www.notion.so")
scratch("SUPER + code:10", "1password", "1[Pp]assword", "1password", { size = { "33%", "66%" } })
scratch("SUPER + M", "spotify", "[Ss]potify.*", "spotify-launcher")
scratch("SUPER + A", "openwebui", "crx_ciaamnabomjhndmogimfmmkflefihebh", "gtk-launch openwebui")
scratch("SUPER + SHIFT + A", "claude", "[Cc]laude.*", "claude-desktop")
scratch("SUPER + P", "protonmail", ".*[Pp]roton.*", "proton-mail")
scratch("SUPER + L", "linear", "linear-linux", "linear-linux")
scratch("SUPER + V", "volume", "org.pulseaudio.pavucontrol", "pavucontrol", { size = { 800, 600 } })
scratch("SUPER + SHIFT + V", "easyeffects", "com.github.wwmm.easyeffects", "easyeffects")
scratch("SUPER + I", "top", "scratch.btm", "xdg-terminal-exec --app-id=scratch.btm -e btm")
scratch("SUPER + SHIFT + I", "nvtop", "scratch.nvtop", "xdg-terminal-exec --app-id=scratch.nvtop -e nvtop")
scratch("SUPER + RETURN", "dropterm", "scratch.dropterm", "xdg-terminal-exec --app-id=scratch.dropterm")
scratch("SUPER + DELETE", "reclaim", "chrome-reclaim.ai__-Profile_1", "gtk-launch reclaim")
scratch("SUPER + SHIFT + DELETE", "todoist", ".*[Tt]odoist.*", "todoist")
o.window("obsidian", { focus_on_activate = true })
