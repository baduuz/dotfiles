local awful = require("awful")
local beautiful = require("beautiful")

return {
    {
        rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.center
        },
    },
    {
         rule_any = {
             class = { "Brave-Browser", "firefox" },
         },
         properties = {
             tag = "2"
         },
    },
    {
         rule = {
             class = "Pcmanfm",
         },
         properties = {
             tag = "4"
         },
    },
    {
         rule_any = {
             class = { "Steam", "Virt-manager", "Lutris" },
         },
         properties = {
             tag = "5"
         },
    },
}
