--[[--------------------------------------------------]]--
---- https://wiki.hypr.land/Configuring/Start/        ----
---- Lit-Laurent's PC config                          ----
---- https://github.com/Lit-Laurent/glowing-palm-tree ----
--[[--------------------------------------------------]]--

require("hlmonitors")
require("hlperms")
require("hlautostart")

require("hlwindowrules")
require("dwindle")

-- [[
--  -- Unused
-- require("hlworkspacerules")
-- require("hllayerrules")
--
-- ]]

-- Visual good looking things
require("hlvisual")
require("hlanimations")

require("hlinput") -- Requires a "mydevs.lua" file for per-device configuration
require("hlkeybinds")

----------------
----  MISC  ----
----------------
hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
    plugin = {
        csgo_vulkan_fix = {
            fix_mouse = true,
        },
    },
})

hl.plugin.csgo_vulkan_fix.vkfix_app({ app = "cs2", w = 2650, h = 1440 }) -- w should be 2560?
