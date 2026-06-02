
--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})




hl.window_rule({
    name  = "waypaper-float",
    match = { class = "^(waypaper)$" },

    float  = true,
    size   = { 800, 500 },
    center = true,
})


hl.layer_rule({
    name  = "waybar-blur",
    match = { namespace = "waybar" },
    
    blur         = true,
    ignore_alpha = 0.1,
})