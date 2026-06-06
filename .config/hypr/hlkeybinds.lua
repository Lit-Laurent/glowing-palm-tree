-- See https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local notifcolor = "80FF00" -- Set only for Screenshot notifications so far

 
hl.bind(mainMod .. " + M", -- The hyprland kill switch, swapped 'hl.dsp.exit()' to having it execute 'uwsm stop' apparently is cleaner for uwsm
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exec uwsm stop'"))
hl.bind(mainMod .. " + C", hl.dsp.window.close()) -- local closeWindowBind = hl.bind(...) ; closeWindowBind:set_enabled(false)
hl.bind("CONTROL + ALT + W", hl.dsp.exec_cmd("pkill waybar && waybar")) -- Reload Waybar

----------------
-- Quick Apps --
----------------
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal)) -- Kitty
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(webBrowser)) -- Zen Browser
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager)) -- Dolphin Default
hl.bind(mainMod .. " + R",				-- Testing out Fuzzel
	hl.dsp.exec_cmd("pkill " .. menu .. " || " .. menu)) 
hl.bind(mainMod .. " + SHIFT + grave", 			-- System Resources
	hl.dsp.exec_cmd("pkill btop || " .. terminal .. " btop"))

hl.bind(mainMod .. " + N", 			-- Opens Nvim at the hypr dotfiles
	hl.dsp.exec_cmd(terminal .. '-T .config/hypr -d $HOME/.config/hypr ' .. editor .. '$HOME/.config/hypr',
	{ float = true, move = {200,100}})) 
	-- TODO: figure out if I can center this without calling a script to read width of the workspace and window

-- Screen Capture --
hl.bind(mainMod .. " + ALT + P", -- Screenshots -- TODO: use variables for monitor outputs / make a script to choose which monitor is currently active
    hl.dsp.exec_cmd('grim -o '.. mMain ..' - | wl-copy && hyprctl notify 1 5000 "rgb("'.. notifcolor .. '")" "fontsize:18 Display Captured: "' .. mMain))
hl.bind(mainMod .. " + ALT + bracketleft", 
    hl.dsp.exec_cmd('grim -o '.. mL ..' - | wl-copy && hyprctl notify 1 5000 "rgb("'.. notifcolor .. '")" "fontsize:18 Display Captured: "' .. mL))
hl.bind(mainMod .. " + ALT + bracketright", 
    hl.dsp.exec_cmd('grim -o '.. mR ..' - | wl-copy && hyprctl notify 1 5000 "rgb("'.. notifcolor .. '")" "fontsize:18 Display Captured: "' .. mR))

    --[[ Might make some sort of eww popup for selecting the monitor to just use one hotkey ]]--

-------------------------------
-- Window/Workspace Controls --
-------------------------------
-- Window Mods --
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + ALT + F", -- FULL SCREEN
    hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SHIFT + F11", hl.dsp.window.fullscreen({ action = "toggle" }))


-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + Tab", hl.dsp.focus({monitor = mMain }))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.window.move({ monitor = mMain }))
hl.bind(mainMod .. " + 1", hl.dsp.focus({ monitor = mL}))
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ monitor = mL }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ monitor =  mR}))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ monitor = mR }))

-- Special workspace
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- TODO: make this not scroll the active window -- its scuffed
-- Resize windows with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.window.resize({x=-240,y=-240,relative=true}))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.window.resize({x=240,y=240,relative=true}))

-------------------	
-- MEDIA CONTROL --
-------------------
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

-- [ REQUIRES: playerctl ] --
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true }) 
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true }) 
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true }) 
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

