-- Standard Awesome library
local gears = require("gears")
local awful = require("awful")
-- Custom Local Library
-- local titlebar = require("anybox.titlebar")

local _M = {}
local modkey = RC.vars.modkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
      function (c)
        c.fullscreen = not c.fullscreen
        c:raise()
      end,
      {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
      function (c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
      end ,
      {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
      function (c)
        c.maximized = not c.maximized
        c:raise()
      end ,
      {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
      function (c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
      end ,
      {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
      function (c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
      end ,
      {description = "(un)maximize horizontally", group = "client"}),
      awful.key({ modkey }, "Up", function () os.execute("xbacklight -inc 10") end,
        {description = "+2%", group = "hotkeys"}),
    awful.key({ modkey }, "Down", function () os.execute("xbacklight -dec 10") end,
        {description = "-2%", group = "hotkeys"}),

    --Volume

    awful.key({ }, "XF86AudioRaiseVolume", function ()
        awful.util.spawn("amixer set Master 5%+") end),
    awful.key({ }, "XF86AudioLowerVolume", function ()
        awful.util.spawn("amixer set Master 5%-") end),
    awful.key({ }, "XF86AudioMute", function ()
        awful.util.spawn("amixer sset Master toggle") end)
  )

  return clientkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
