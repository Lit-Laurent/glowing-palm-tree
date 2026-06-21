-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function () 
   hl.exec_cmd("awww-daemon && waypaper --restore")   -- Wallpaper managers
   hl.exec_cmd("waybar")
   hl.exec_cmd("wl-clip-persist --clipboard regular") -- TODO: Setup cliphist
   hl.exec_cmd("alacritty -e nvim TODO.txt")
   hl.exec_cmd("hyprpm reload") -- Reload hyprland plugins

   hl.exec_cmd('hyprctl notify -1 15000 "rgb(AFD0DF)" "fontsize:40 Welcome $LOGNAME"') 


   

   hl.exec_cmd('hyprctl notify -1 15000 "rgb(AFD0DF)" "fontsize:18 Auto-start Complete!"')
end)
