-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
mMain = "DP-2"
mL    = "DP-1"
mR    = "HDMI-A-1"

hl.monitor({output=mMain, 
    mode="2560x1440@165", 
    position="0x0", scale="1",
})

hl.monitor({output=mL, 
    mode="1920x1080@165", 
    position="auto-left", scale="1",
    -- reserved_area={left=60} 
})

hl.monitor({output=mR, 
    mode="1920x1080@60", 
    position="auto-right", scale= "1",
    transform= 3, -- Rotates monitor 270 degrees cc-wise
})

hl.workspace_rule({ workspace = "name:Right", monitor = mR, default = true})
hl.workspace_rule({ workspace = "name:Left", monitor = mL, default = true})
hl.workspace_rule({ workspace = "name:Main", monitor = mMain, default = true})

-- Unconfigured Monitor Fallback
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

-- To disable a monitor
-- hl.monitor({ output = "name", disabled = true })




