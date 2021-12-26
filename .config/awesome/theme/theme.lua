---------------------------
--        Theme           --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local themes_path = os.getenv("HOME") .. "/.config/awesome/theme"

local theme = {}

theme.font       = "sans 9"

theme.fg_normal  = "#ECEFF4"
theme.fg_focus   = "#88C0D0"
theme.fg_urgent  = "#D08770"
theme.bg_normal  = "#2E3440"
theme.bg_focus   = "#3B4252"
theme.bg_urgent  = "#3B4252"
theme.bg_systray = theme.bg_focus
theme.systray_icon_spacing = dpi(4)

theme.useless_gap   = dpi(8)
theme.border_width  = 3
theme.border_normal = "#3B4252"
theme.border_focus  = "#81a1c1"
theme.border_marked = "#D08770"

theme.titlebar_bg_normal                        = "#202020"
theme.titlebar_bg_focus                         = "#404040"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(5)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
theme.notification_width  = 300
theme.notification_height = 80
theme.notification_icon_size = 70


-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."/submenu.png"
theme.menu_height       = "20"
theme.menu_width        = "150"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."/titlebar/close_normal.svg"
theme.titlebar_close_button_focus  = themes_path.."/titlebar/close_focus.svg"

theme.titlebar_minimize_button_normal = themes_path.."/titlebar/minimize_normal.svg"
theme.titlebar_minimize_button_focus  = themes_path.."/titlebar/minimize_focus.svg"

theme.titlebar_ontop_button_normal_inactive = themes_path.."/titlebar/ontop_normal_inactive.svg"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."/titlebar/ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_active = themes_path.."/titlebar/ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_active  = themes_path.."/titlebar/ontop_focus_active.svg"

theme.titlebar_sticky_button_normal_inactive = themes_path.."/titlebar/sticky_normal_inactive.svg"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."/titlebar/sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_active = themes_path.."/titlebar/sticky_normal_active.svg"
theme.titlebar_sticky_button_focus_active  = themes_path.."/titlebar/sticky_focus_active.svg"

theme.titlebar_floating_button_normal_inactive = themes_path.."/titlebar/floating_normal_inactive.svg"
theme.titlebar_floating_button_focus_inactive  = themes_path.."/titlebar/floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_active = themes_path.."/titlebar/floating_normal_active.svg"
theme.titlebar_floating_button_focus_active  = themes_path.."/titlebar/floating_focus_active.svg"

theme.titlebar_maximized_button_normal_inactive = themes_path.."/titlebar/maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."/titlebar/maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active = themes_path.."/titlebar/maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active  = themes_path.."/titlebar/maximized_focus_active.svg"

theme.wallpaper = themes_path.."/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."/layouts/fairhw.png"
theme.layout_fairv = themes_path.."/layouts/fairvw.png"
theme.layout_floating  = themes_path.."/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."/layouts/magnifierw.png"
theme.layout_max = themes_path.."/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."/layouts/tileleftw.png"
theme.layout_tile = themes_path.."/layouts/tilew.png"
theme.layout_tiletop = themes_path.."/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
