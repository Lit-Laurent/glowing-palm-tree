-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
hl.workspace_rule({ workspace = "name:Left", monitor = mL, default = true})
hl.workspace_rule({ workspace = "name:Main", monitor = mMain, default = true})
hl.workspace_rule({ workspace = "name:Right", monitor = mR, default = true})

--hl.workspace_rule({ workspace = "special:magic", on_created_empty = "foot" })


