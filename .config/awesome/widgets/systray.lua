local wibox = require("wibox")

local systray_widget = require("widgets.bar_highlight")(wibox.widget.systray(), {3,3,6,6})

return systray_widget
