local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local gfs = gears.filesystem
local beautiful = require("beautiful")

local ICON_DIR = gfs.get_configuration_dir() .. "theme/icons/"

local powermenu_widget = wibox.widget {
    {
        {
            format = "%H:%M",
            widget = wibox.widget.textclock
        },
        left = 6,
        right = 4,
        widget = wibox.container.margin
    },
    {
        image = ICON_DIR .. "power.svg",
        resize = true,
        widget = wibox.widget.imagebox,
    },
    layout = wibox.layout.align.horizontal
}

local menu_items = {
    { name = "Log Out", icon = "logout.svg", command = function() awesome.quit() end },
    { name = "Lock", icon = "lock.svg", command = function() awful.spawn.with_shell("slock") end },
    { name = "Restart", icon = "restart.svg", command = function() awful.spawn.with_shell("systemctl reboot") end },
    { name = "Shutdown", icon = "power_red.svg", command = function() awful.spawn.with_shell("systemctl poweroff") end },
}

local popup = awful.popup {
    ontop = true,
    visible = false,
    shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 4)
    end,

    border_width = 1,
    border_color = beautiful.bg_focus,
    maximum_width = 400,
    offset = { y = 10, x = -3 },
    widget = {},
}

local rows = { layout = wibox.layout.fixed.vertical }

for _, item in ipairs(menu_items) do
    local row = wibox.widget {
        {
            {
                {
                    image = ICON_DIR ..item.icon,
                    forced_width = 16,
                    forced_height = 16,
                    widget = wibox.widget.imagebox,
                },
                {
                    text = item.name,
                    widget = wibox.widget.textbox,
                },
                spacing = 12,
                layout = wibox.layout.fixed.horizontal,
            },
            margins = 8,
            widget = wibox.container.margin,
        },
        bg = beautiful.bg_normal,
        widget = wibox.container.background,
    }

    row:connect_signal("mouse::enter", function(c) c:set_bg(beautiful.bg_focus) end)
    row:connect_signal("mouse::leave", function(c) c:set_bg(beautiful.bg_normal) end)

    local oldcursor, oldwibox
    row:connect_signal("mouse::enter", function()
        local wb = mouse.current_wibox
        oldcursor, oldwibox = wb.cursor, wb
        wb.cursor = "hand1"
    end)
    row:connect_signal("mouse::leave", function()
        if oldwibox then
            oldwibox.cursor = oldcursor
            oldwibox = nil
        end
    end)

    row:buttons(
        awful.util.table.join(
            awful.button({}, 1, function()
                popup.visible = not popup.visible
                item.command()
            end)
        )
    )

    table.insert(rows, row)
end

popup:setup(rows)

powermenu_widget:buttons(
    awful.util.table.join(
        awful.button({}, 1, function()
            if popup.visible then
                popup.visible = not popup.visible
            else
                popup:move_next_to(mouse.current_widget_geometries[7])
            end
    end))
)
return require("widgets.bar_highlight")(powermenu_widget, {0,0,2,4})
