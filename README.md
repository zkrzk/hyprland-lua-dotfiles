# 🌊 Hyprland-Lua Multi-Layout Rice

Alright folks, you asked for it on Reddit, so here it is! This is my personal, highly customized Arch Linux setup. It's not your typical Hyprland setup—the entire window manager is configured using **Lua**, and it features a dynamic theme-switching core and 5 on-the-fly Waybar layouts.

---

## 🔥 Key Features
* 🧠 **Hyprland via Lua:** Configured completely with Lua modules (`modules/*.lua`) for maximum performance and clean hacking.
* 📊 **5 Waybar Layouts:** Hot-swap between `dynamic_island`, `bottom_dock`, `minimal`, `all_right`, and `Full` instantly via Rofi.
* 🎨 **Dynamic Theme Core:** One single `master_themes.conf` triggers system-wide color changes across Hyprland, Waybar, Rofi, Kitty, and Fish Shell flawlessly.
* 🕋 **Prayer & Weather Modules:** Python-powered scripts with local caching to keep you updated without breaking system packages or hitting API limits.

---

## 🛠️ Dependencies
Make sure you have these bad boys installed before diving in:
* **WM:** `hyprland` (and whatever Lua-wrapper you use)
* **Bar & Menu:** `waybar`, `rofi`, `jq`
* **Terminal & Shell:** `kitty`, `fish`, `fastfetch`
* **Python Deps:** `python-requests` (for the prayer cache script)
* **Fonts:** `ttf-jetbrains-mono-nerd`, `ttf-vazirmatn-fonts` (for perfect Arabic fallback support in Rofi)

---

## 🚀 Installation

1. **Clone this repo:**
```bash
   git clone [https://github.com/YOUR_GITHUB_USERNAME/hyprland-lua-dotfiles.git](https://github.com/YOUR_GITHUB_USERNAME/hyprland-lua-dotfiles.git)
   cd hyprland-lua-dotfiles
