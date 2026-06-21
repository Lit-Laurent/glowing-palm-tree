-- See https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local notifcolor = "80FF00" -- Set only for Screenshot notifications so far

hl.bind(mainMod .. " + M", -- The hyprland kill switch, swapped 'hl.dsp.exit()' to having it execute 'uwsm stop' apparently is cleaner for uwsm
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || uwsm stop"))
-- FTLoG make this bind into a damn popup to choose mulitple options, so many misclicks........

hl.bind(mainMod .. " + C", hl.dsp.window.close()) -- local closeWindowBind = hl.bind(...) ; closeWindowBind:set_enabled(false)

hl.bind("CONTROL + ALT + W", hl.dsp.exec_cmd("pkill waybar && waybar")) -- Reload Waybar
hl.bind(mainMod .. " + CONTROL + ALT + W", hl.dsp.exec_cmd("waybar")) -- Reopen waybar for when you screw up the config :P

----------------
-- Quick Apps --
----------------
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal)) -- was Kitty, using Alacritty, may use Foot (its cool)
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(webBrowser)) -- Zen Browser, Dopa type browser
hl.bind(mainMod .. " + ALT + W", hl.dsp.exec_cmd(webBrowser .. "--blank-window")) -- Blank Window for quick searches
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager)) -- Dolphin Default -- check out some other options
hl.bind(mainMod .. " + A",				-- Testing out Fuzzel -- good but minimal.
	hl.dsp.exec_cmd("pkill " .. menu .. " || " .. menu)) 


hl.bind(mainMod .. " + grave", 			-- System Resources
	hl.dsp.exec_cmd("pkill btop || " .. terminal .. "-T SysResources btop"))

hl.bind(mainMod .. " + SHIFT + grave",
	hl.dsp.exec_cmd('kill $(cat $HOME/.config/myScripts/ff/pid) || ' .. terminal .. '-c "$HOME/.config/kitty/ff.conf" -T Fastfetch "$HOME/.config/myScripts/ff/ff.sh"'))          -- Fastfetch Window
	
hl.bind(mainMod .. " + N", 			-- Opens Nvim at the hypr dotfiles
	hl.dsp.exec_cmd(terminal .. '--working-directory $HOME/.config/hypr ' .. editor .. '$HOME/.config/hypr',
	{ float = true })) 

-- Screen Capture --
hl.bind(mainMod .. " + ALT + P", -- Screenshots -- TODO: use variables for monitor outputs / make a script to choose which monitor is currently active
    hl.dsp.exec_cmd('grim -o '.. mMain ..' - | wl-copy && hyprctl notify 1 5000 "rgb("'.. notifcolor .. '")" "fontsize:18 Display Captured: "' .. mMain))
hl.bind(mainMod .. " + ALT + bracketleft", 
    hl.dsp.exec_cmd('grim -o '.. mL ..' - | wl-copy && hyprctl notify 1 5000 "rgb("'.. notifcolor .. '")" "fontsize:18 Display Captured: "' .. mL))
hl.bind(mainMod .. " + ALT + bracketright", 
    hl.dsp.exec_cmd('grim -o '.. mR ..' - | wl-copy && hyprctl notify 1 5000 "rgb("'.. notifcolor .. '")" "fontsize:18 Display Captured: "' .. mR))

    --[[ Might make some sort of eww popup for selecting the monitor to just use one hotkey ]]--

--[[ Disable Monitors --
--hl.bind(mainMod .. " + CONTROL + P",hl.dsp.exec_cmd())
--hl.bind(mainMod .. " + CONTROL + bracketleft", hl.dsp.exec_cmd())
--hl.bind(mainMod .. " + CONTROL + bracketright", hl.dsp.exec_cmd())

-- Its not a clean monitor disable, turns off main monitor shortly too its aight but could be better, the workspaces stay active and mouse can leave the screen thats on still
hl.bind(mainMod .. " + CONTROL + bracketright", function()
                 hl.timer(function()
                   hl.dispatch(hl.dsp.dpms({monitor=mL}))
		   hl.dispatch(hl.dsp.dpms({monitor=mR}))
                 end, {timeout = 50, type = "oneshot"})
               end)
]]--


-------------------------------
-- Window/Workspace Controls --
-------------------------------
-- Window Mods --

--[[ idk how to set/unset these its only toggle --
hl.bind(mainMod .. " + ALT + mouse_down", hl.dsp.window.float())
hl.bind(mainMod .. " + ALT + mouse_up",   hl.dsp.window.float())
]]--

--[[ Make Window gap cycling selector, Gaps / Smart Gaps / No Gaps  -- make sure theres no issue of overwriting current win rules
hl.bind(mainMod .. " + ALT + G",
	hl.dsp.exec_cmd())
--]]

hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + ALT + F", -- FULL SCREEN
    hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SHIFT + F11", hl.dsp.window.fullscreen({ action = "toggle" }))


-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- TODO: make this not scroll the active window -- its scuffed
-- NO LONGER SCUFFED I DID IT, I READ THE WHOLE WIKI 4 TIMES
-- hl.config({ -- Fix to make windows not scroll on bind usage. 
	-- idk if there is any reason why I would want to change it back to default after binds are set
hl.config ({
    binds = {
   	scroll_event_delay = 0
    }
})

-- Resize windows with mainMod + scroll
hl.bind(mainMod .. " + mouse_up", hl.dsp.window.resize({x=-160,y=-100,relative=true}))
hl.bind(mainMod .. " + mouse_down",   hl.dsp.window.resize({x=160,y=100,relative=true}))


-- WORKSPACE --
-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move Monitor Focus / Bring Window with you
hl.bind(mainMod .. " + Tab", hl.dsp.focus({monitor = mMain }))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.window.move({ monitor = mMain }))
hl.bind(mainMod .. " + 1", hl.dsp.focus({ monitor = mL}))
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ monitor = mL }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ monitor =  mR}))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ monitor = mR }))

-- Special workspace
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))


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

