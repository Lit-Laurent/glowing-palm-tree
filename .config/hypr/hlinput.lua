hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Per-device configuration --
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
--
-- To check devices "hyprctl devices"
hl.device({name = "MyKeyboard"
})
hl.device({name = "MyMouse"
})
hl.device({name = "MyController"
})
