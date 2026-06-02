function set_kitty_theme
    # مسار ملف الثيمات الخاص بك (تأكد من تعديل المسار الحقيقي لملفك هنا)
    set theme_file "$HOME/.config/hypr/themes.txt" 
    set target_theme $argv[1]

    if test -z "$target_theme"
        echo "الرجاء كتابة اسم الثيم، مثال: set_kitty_theme 'Catppuccin Mocha'"
        return 1
    end

    # البحث عن السطر الخاص بالثيم المختار داخل الملف
    set theme_line (grep -i "^$target_theme|" $theme_file)

    if test -z "$theme_line"
        echo "❌ لم يتم العثور على ثيم باسم: $target_theme"
        return 1
    end

    # تفكيك السطر وتحويله إلى مصفوفة ألوان عبر تقسيم علامة |
    set colors (string split "|" $theme_line)

    # تعيين الألوان المكتشفة إلى متغيرات مريحة
    set bg $colors[2]
    set fg $colors[5]
    set cursor $colors[7] # استخدام اللون المميز للمؤشر
    set color0 $colors[3] # الخلفية الداكنة كلون أسود
    set color1 $colors[15] # الأحمر
    set color2 $colors[11] # الأخضر
    set color3 $colors[9] # الأصفر
    set color4 $colors[7] # الأزرق
    set color5 $colors[8] # الموف/البنفسجي
    set color6 $colors[14] # السماوي
    set color7 $colors[5] # الأبيض/النص الثانوي

    # كتابة ملف الإعدادات الخاص بـ Kitty فوراً
    echo "# Kitty Theme: $target_theme
background            $bg
foreground            $fg
cursor                $cursor
selection_background  $color0
selection_foreground  $fg

# Colors
color0  $color0
color1  $color1
color2  $color2
color3  $color3
color4  $color4
color5  $color5
color6  $color6
color7  $color7
" > ~/.config/kitty/theme.conf

    # إرسال إشارة حية إلى Kitty لتحديث الألوان فوراً بدون إعادة تشغيله
    pkill -USR1 kitty
    echo "🎨 تم تحويل ألوان Kitty بنجاح إلى ثيم: $target_theme!"


end
