local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local gfs = gears.filesystem
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local clock_widget = wibox.widget.textclock("%H:%M")

return require("widgets.bar_highlight")(clock_widget, {0,0,8,8})
