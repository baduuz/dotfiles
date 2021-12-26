local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local gfs = gears.filesystem
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi


local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
                              if client.focus then
                                  client.focus:move_to_tag(t)
                              end
                          end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
                              if client.focus then
                                  client.focus:toggle_tag(t)
                              end
                          end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local icon_dir = gfs.get_configuration_dir() .. "theme/icons/tag-list/"
local selected_empty_icon = gears.color.recolor_image(
gears.surface.load_uncached(icon_dir .. "empty.svg"), beautiful.fg_focus)
local selected_occupied_icon = gears.color.recolor_image(
gears.surface.load_uncached(icon_dir .. "occupied.svg"), beautiful.fg_focus)
local unselected_empty_icon = gears.color.recolor_image(
gears.surface.load_uncached(icon_dir .. "empty.svg"), beautiful.fg_secondary)
local unselected_occupied_icon = gears.color.recolor_image(
gears.surface.load_uncached(icon_dir .. "occupied.svg"), beautiful.fg_secondary)

local update_tags = function(self, c3)
    local tag_icon = self:get_children_by_id('icon_role')[1]
    if c3.selected and #c3:clients() == 0 then
        tag_icon.image = selected_empty_icon
    elseif c3.selected then
        tag_icon.image = selected_occupied_icon
    elseif #c3:clients() == 0 then
        tag_icon.image = unselected_empty_icon
    else
        tag_icon.image = unselected_occupied_icon
    end
end

local taglist = function(s)
    local taglist_widget = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        layout = { spacing = 0, layout = wibox.layout.fixed.horizontal },
        widget_template = {
            {
                {
                    id = "icon_role",
                    widget = wibox.widget.imagebox
                },
                margins = dpi(3),
                widget = wibox.container.margin
            },
            create_callback = function(self, c3, index, objects) --luacheck: no unused args
                update_tags(self, c3)
            end,
            update_callback = function(self, c3, index, objects) --luacheck: no unused args
                update_tags(self, c3)
            end,
            widget = wibox.container.background
        },
        buttons = taglist_buttons
    }

    return require("widgets.bar_highlight")(taglist_widget, {0,0,2,2,height=4})
end


return taglist
