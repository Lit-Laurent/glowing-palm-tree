-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function () 
   hl.exec_cmd("awww-daemon && waypaper --restore")
   hl.exec_cmd("waybar")
   hl.exec_cmd("wl-clip-persist --clipboard regular") -- TODO: Setup cliphist

   hl.exec_cmd('hyprctl notify -1 15000 "rgb(AFD0DF)" "fontsize:40 Welcome $LOGNAME"')

   -- Dispatch the main monitor for auto-start applications to be opened there 
   --hl.exec_cmd("hyprctl dispatch 'hl.dsp.focus({ monitor = mMain)") -- TS DONT WORK
   hl.exec_cmd(terminal .. editor .. "TODO.txt")

   hl.exec_cmd('hyprctl notify -1 15000 "rgb(AFD0DF)" "fontsize:18 Auto-start Complete!"')
end)

