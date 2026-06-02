#!/usr/bin/env bash

THEME_FILE="$HOME/.config/themes/master_themes.conf"
CHOSEN=$(cut -d"|" -f1 "$THEME_FILE" | grep -v "^#" | rofi -dmenu -i -p "󰸉 Select Theme:")

if [ -n "$CHOSEN" ]; then
    LINE=$(grep "^$CHOSEN|" "$THEME_FILE")
    IFS="|" read -r name bg bg_dark surface text text_dim primary secondary yellow orange green cyan pink teal red <<< "$LINE"

    primary=$(echo "$primary" | tr -d "[:space:]")
    secondary=$(echo "$secondary" | tr -d "[:space:]")

    # Waybar Colors
    printf "@define-color bg $bg;
@define-color bg_dark $bg_dark;
@define-color surface $surface;
@define-color text $text;
@define-color text_dim $text_dim;
@define-color primary $primary;
@define-color secondary $secondary;
@define-color yellow $yellow;
@define-color orange $orange;
@define-color green $green;
@define-color cyan $cyan;
@define-color pink $pink;
@define-color teal $teal;
@define-color red $red;
" > "$HOME/.config/waybar/current_colors.css"

    # Rofi Colors
    printf "* {
    bg: $bg;
    bg-dark: $bg_dark;
    surface: $surface;
    text: $text;
    text-dim: $text_dim;
    primary: $primary;
    secondary: $secondary;
}
" > "$HOME/.config/rofi/colors.rasi"

    # Fish Shell Dynamic Colors
    FISH_VARS="$HOME/.config/fish/fish_variables"
    mkdir -p "$(dirname "$FISH_VARS")"
    touch "$FISH_VARS"
    sed -i "/fish_color_/d" "$FISH_VARS"
    {
        echo "SETUVAR fish_color_normal:normal"
        echo "SETUVAR fish_color_command:$primary"
        echo "SETUVAR fish_color_keyword:$secondary"
        echo "SETUVAR fish_color_quote:$yellow"
        echo "SETUVAR fish_color_redirection:$cyan"
        echo "SETUVAR fish_color_end:$pink"
        echo "SETUVAR fish_color_error:$red"
        echo "SETUVAR fish_color_param:$text"
        echo "SETUVAR fish_color_comment:$text_dim"
        echo "SETUVAR fish_color_selection:--background=$surface"
        echo "SETUVAR fish_color_search_match:--background=$surface"
        echo "SETUVAR fish_color_operator:$teal"
        echo "SETUVAR fish_color_escape:$green"
        echo "SETUVAR fish_color_autosuggestion:$text_dim"
    } >> "$FISH_VARS"

    CAVA_CONF="$HOME/.config/cava/config"
    mkdir -p "$(dirname "$CAVA_CONF")"
    
    echo "[general]" > "$CAVA_CONF"
    echo "" >> "$CAVA_CONF"
    echo "[color]" >> "$CAVA_CONF"
    echo "data_only = 0" >> "$CAVA_CONF"
    echo "gradient = 1"
    printf "gradient_color_1 = %s
gradient_color_2 = %s
" "$primary" "$secondary" >> "$CAVA_CONF"

    KITTY_CONF="$HOME/.config/kitty/theme.conf"
    mkdir -p "$(dirname "$KITTY_CONF")"
    
    printf "background            %s
foreground            %s
cursor                %s
selection_background  %s
selection_foreground  %s

# الألوان الأساسية للـ Terminal
color0  %s
color1  %s
color2  %s
color3  %s
color4  %s
color5  %s
color6  %s
color7  %s
" "$bg" "$text" "$primary" "$surface" "$text" "$bg_dark" "$red" "$green" "$yellow" "$primary" "$secondary" "$cyan" "$text_dim" > "$KITTY_CONF"

    pkill -USR1 kitty


    HYPR_COLORS="$HOME/.config/hypr/current_colors.lua"
    mkdir -p "$(dirname "$HYPR_COLORS")"
    
    printf "return {
    primary = 'rgba($(echo $primary | tr -d "#")ff)',
    bg_dark = 'rgba($(echo $bg_dark | tr -d "#")ff)'
}
" > "$HYPR_COLORS"

    killall waybar && waybar &



    FF_CONFIG="$HOME/.config/fastfetch/config.jsonc"
    mkdir -p "$(dirname "$FF_CONFIG")"
    
    cat <<EOF > "$FF_CONFIG"
{
  "\$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
"logo": {
    "source": "arch",
    "color": {
      "1": "$primary",
      "2": "$primary"  
    },
    "padding": {
      "top": 2,
      "right": 4
    }
  },
  "display": {
    "separator": " "
  },
  "modules": [
    "break",
    {
      "type": "title",
      "keyWidth": 10,
      "color": "$primary"
    },
    "break",
    {
      "type": "os",
      "key": " ",
      "keyColor": "$primary",
      "color": "$primary",
      "format": "{1} {2} ({12})"
    },
    {
      "type": "kernel",
      "key": " ",
      "keyColor": "$primary",
      "color": "$primary"
    },
    {
      "type": "uptime",
      "key": "󱎫 ",
      "keyColor": "$primary",
      "color": "$primary"
    },
    {
      "type": "packages",
      "key": "󰏖 ",
      "keyColor": "$primary",
      "color": "$primary"
    },
    {
      "type": "shell",
      "key": ">_",
      "keyColor": "$primary",
      "color": "$primary",
      "format": "{1} {2}"
    },
    {
      "type": "display",
      "key": "󰍹 ",
      "keyColor": "$primary",
      "color": "$primary",
      "format": "{1}x{2} @ {3}Hz"
    },
    {
      "type": "wm",
      "key": " ",
      "keyColor": "$primary",
      "color": "$primary",
      "format": "{1} ({2})"
    },
    {
      "type": "terminal",
      "key": " ",
      "keyColor": "$primary",
      "color": "$primary"
    },
    "break",
    {
      "type": "host",
      "key": " ",
      "keyColor": "$primary",
      "color": "$primary",
      "format": "{2}"
    },
    {
      "type": "cpu",
      "key": "󰍛 ",
      "keyColor": "$primary",
      "color": "$primary",
      "format": "{1} ({5}) @ {7}GHz"
    },
    {
      "type": "gpu",
      "key": "󰢮 ",
      "keyColor": "$primary",
      "color": "$primary",
      "format": "{2}"
    },
    {
      "type": "memory",
      "key": " ",
      "keyColor": "$primary",
      "color": "$primary",
      "format": "{1} / {2} ({3})"
    },
    {
      "type": "disk",
      "key": " ",
      "keyColor": "$primary",
      "color": "$primary",
      "format": "{1} / {2} ({3})",
      "folders": "/"
    },
    {
      "type": "localip",
      "key": "󰩟 ",
      "keyColor": "$primary",
      "color": "$primary",
      "compact": true
    },
    "break"
  ]
}
EOF


fi
