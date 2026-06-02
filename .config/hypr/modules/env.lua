-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

--Toolkit Backend
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

--XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

--Qt Variables
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")



-- Hardware Acceleration & Intel specific
hl.env("LIBVA_DRIVER_NAME", "iHD") -- Forces use of the intel-media-driver we installed
hl.env("VAAPI_DRIVER", "iHD")

-- Fixing Cursor issues (Common on Hyprland)
hl.env("WLR_NO_HARDWARE_CURSORS", "1") -- If your cursor disappears, keep this ready

-- Electron Apps (Discord, VSCode, etc.)
-- This forces them to run natively on Wayland instead of XWayland
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Java Apps fix (e.g., some IDEs or older tools)
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")