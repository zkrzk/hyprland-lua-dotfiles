
-- Set programs that you use
local terminal = "kitty"
local fileManager = "thunar"
local menu        = "rofi -show drun"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier


hl.bind(mainMod .. " + XF86PowerOff", hl.dsp.exec_cmd("poweroff"))
hl.bind(mainMod .. " +SHIFT+ XF86PowerOff", hl.dsp.exec_cmd("reboot"))
hl.bind( " XF86PowerOff", hl.dsp.exec_cmd("hyprlock"))





hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprctl reload"))

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + I", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) 
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("waypaper"))

hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("~/.config/rofi/scripts/waybar_layout.sh"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("~/.config/rofi/scripts/theme_selector.sh"))

hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("~/.config/rofi/scripts/clipboard.sh"))

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/Screenshots"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + SHIFT+ mouse:272", hl.dsp.window.resize(), { mouse = true })

-- Volume
hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%+"), { repeating = true })
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%-"), { repeating = true })
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

-- Brightness Screen
hl.bind(mainMod .. " + F5", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 3%+"), { repeating = true })
hl.bind(mainMod .. " + F4", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 3%-"), { repeating = true })

-- Brightness Keyboard
hl.bind(mainMod .. " + F7", hl.dsp.exec_cmd("brightnessctl -d *kbd_backlight* set 20%+"), { repeating = true })
hl.bind(mainMod .. " + F6", hl.dsp.exec_cmd("brightnessctl -d *kbd_backlight* set 20%-"), { repeating = true })
