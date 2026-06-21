--[[--------------------------------------------------]]--
---- https://wiki.hypr.land/Configuring/Start/        ----
---- Lit-Laurent's PC config                          ----
---- https://github.com/Lit-Laurent/glowing-palm-tree ----
--[[--------------------------------------------------]]--

--[[ will make a directory to store scripts with helpful functions ]]--
-- require("palmtreescripts.*")

-- Program aliases --
terminal    = "kitty "
editor      = "nvim "
fileManager = "thunar "
webBrowser  = "zen-browser "
menu        = "fuzzel " -- TODO: check out rofi aswell, might need for hyprpicker and cliphist

--[[ See more on Enviroment variables for uwsm for hyprland ]]
--[[ https://github.com/Vladimir-csp/uwsm?tab=readme-ov-file#4-environments-and-shell-profile) ]]
require("hlenv-vars")  

-- TODO: learn about perms, its new
require("hlperms")

hl.config({
	misc = {
		initial_workspace_tracking = 0
	}
})
require("hlautostart")

--[[ Need to setup better generic monitor compatability (This isn't essential for me rn)]] --
require("hlmonitors")

-----------------
---- Display ----
-----------------
-- TODO: Setup generic monitor compatability (This isn't essential for me rn)
require("hlmonitors")

require("hlworkspacerules")
require("hlwindowrules")
require("hllayerrules")

-- Only using dwindle layouts rn
require("dwindle")

-------------------------------
---- PRETTY LOOK GOOD STUFF----
-------------------------------
require("hlvisual")
require("hlanimations")

-------------------------
---- INPUT AND BINDS ----
-------------------------
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

hl.plugin.csgo_vulkan_fix.vkfix_app({ app = "cs2", w = 2650, h = 1440 })
