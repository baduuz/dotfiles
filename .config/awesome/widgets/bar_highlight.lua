local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi


local rounded_background = function(inner_widget, margins)
    local background_widget = wibox.container.background()
    background_widget:setup {
        {
            {
                inner_widget,
                top = margins[1],
                bottom = margins[2],
                right = margins[3],
                left = margins[4],
                widget = wibox.container.margin
            },
            bg = beautiful.bg_focus,
            forced_height = 1,
            shape = gears.shape.rounded_bar,
            widget = wibox.container.background
        },
        top = margins.height or 3,
        bottom = margins.height or 3,
        left = 3,
        right = 3,
        widget = wibox.container.margin
    }
    return background_widget
end

return rounded_background
