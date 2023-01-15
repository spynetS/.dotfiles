
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.

beautiful.init(gears.filesystem.get_themes_dir() .. "xresources/theme.lua")

beautiful.useless_gap = 10
beautiful.font = "DejaVu Sans 16"
-- This is used later as the default terminal and editor to run.
terminal = "kitty"
browser = "firefox"
fm = 'dolphin'
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor



-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.floating,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
--
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
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

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

local timer = require("gears.timer")
--local mpc = require("npc")
--local textbox = require("wibox.widget.textbox")
--local mpd_widget = textbox()
--local state, title, artist, file = "stop", "", "", ""
--local function update_widget()
--    local text = "Current MPD status: "
--    text = text .. tostring(artist or "") .. " - " .. tostring(title or "")
--    if state == "pause" then
--        text = text .. " (paused)"
--    end
--    if state == "stop" then
--        text = text .. " (stopped)"
--    end
--    mpd_widget.text = text
--end
--local connection
--local function error_handler(err)
--    mpd_widget:set_text("Error: " .. tostring(err))
--    -- Try a reconnect soon-ish
--    timer.start_new(10, function()
--        connection:send("ping")
--    end)
--end
--connection = mpc.new(nil, nil, nil, error_handler,
--    "status", function(_, result)
--        state = result.state
--    end,
--    "currentsong", function(_, result)
--        title, artist, file = result.title, result.artist, result.file
--        pcall(update_widget)
--    end)
--mpd_widget:buttons(awful.button({}, 1, function() connection:toggle_play() end))

local textbox = require("wibox.widget.textbox")
local memory_widget = textbox()
memory_widget.valign = 'center'

local command = "free | grep Mem | awk '{print \"Mem use: \"  $3 / $2 * 100 \"%\"  }'"
timer {
    timeout = 1,
    autostart = true,
    callback = function ()
    memory_widget.markup = "<span  ><span foreground=\"#76b5c5\" > 💾</span> "..io.popen(command):read("*all").."</span>"
    end
}
    memory_widget.markup = "<span  ><span foreground=\"#76b5c5\" > 💾</span> "..io.popen(command):read("*all").."</span>"

local cpuUsageCommand = "grep 'cpu ' /proc/stat | awk '{print \"Cpu usage: \"  ($2+$4)*100/($2+$4+$5) \"%\"}' "
local cpu_widget = textbox()
cpu_widget.valign = 'center'

cpu_widget.forced_height = 30

timer {
    timeout = 1,
    autostart = true,
    callback = function ()
        cpu_widget.markup = "<span  ><span foreground=\"#76b5c5\" > 🧠</span> "..io.popen(cpuUsageCommand):read("*all").."</span>"
    end
}
cpu_widget.markup = "<span  ><span foreground=\"#76b5c5\" > 🧠</span> "..io.popen(cpuUsageCommand):read("*all").."</span>"

function battery()
    local icon = " 🔋"
    local w = require("wibox.widget.textbox")
    local widget = w()
    local command = "cat /sys/class/power_supply/BAT0/capacity" 
    widget.markup = "<span  ><span foreground=\"#76b5c5\" >"..icon.."</span> "..io.popen(command):read("*all").."%</span>"
    timer {
        timeout = 1,
        autostart = true,
        callback = function ()
            widget.markup = "<span  ><span foreground=\"#76b5c5\" >"..icon.."</span> "..io.popen(command):read("*all").."%</span>"
        end
    }
    return widget

end

function wifi()
    
    local w = require("wibox.widget.textbox")
    local widget = w()

    local icon = " 📶"
    local command = "nmcli device status | awk 'NR==2{print $4}'" 
    widget.markup = "<span  ><span foreground=\"#76b5c5\" >"..icon.."</span> "..io.popen(command):read("*all").."%</span>"
    timer {
        timeout = 1,
        autostart = true,
        callback = function ()
            widget.markup = "<span  ><span foreground=\"#76b5c5\" >"..icon.."</span> "..io.popen(command):read("*all").."%</span>"
        end
    }
    return widget
end

function audioController()

    local stereoid = "alsa_output.pci-0000_04_00.6.analog-stereo"
    local headphonesid = "alsa_output.usb-Kingston_Technology_Company_HyperX_Cloud_Flight_Wireless-00.analog-stereo"
    local icon = "🎧"
    local selectedId = 59
    local volume = io.popen("pactl list sinks | grep Volume | awk 'NR==1{print $5}' | sed 's/%//'"):read("*all")
    local textbox = require("wibox.widget.textbox")
    local audiodev_widget = textbox()
    
    local function toggleAudiodev()
        if selectedId == headphonesid then
            icon = "📾"
            selectedId = stereoid
            volume = tonumber(io.popen("pactl list sinks | grep Volume | awk 'NR==1{print $5}' | sed 's/%//'"):read("*all"))
            os.execute("/home/spy/.config/awesome/audiodev.sh "..stereoid)
        else 
           icon = "🎧"
            volume = tonumber(io.popen("pactl list sinks | grep Volume | awk 'NR==1{print $5}' | sed 's/%//'"):read("*all"))
            selectedId = headphonesid
           os.execute("/home/spy/.config/awesome/audiodev.sh "..headphonesid)
        end 
        audiodev_widget.markup = "<span><span foreground=\"#76b5c5\" >"..icon.."</span>Volume: "..volume.."%</span>"
    end

    local function changeVol(vol)
        if(volume+vol >= 0) then volume=volume+vol end

        os.execute("pactl set-sink-volume "..selectedId.." "..volume.."%")
        audiodev_widget.markup = "<span><span foreground=\"#76b5c5\" >"..icon.."</span>Volume: "..volume.."%</span>"
    end

    local function mute()
        if(icon == "🔇")then
            os.execute("pactl set-sink-volume "..selectedId.." "..volume.."%")
            if(selectedId == stereoid) then icon = "📾" else icon = "🎧" end
        else
            icon = "🔇"
            os.execute("pactl set-sink-volume "..selectedId.." 0%")
        end
        audiodev_widget.markup = "<span><span foreground=\"#76b5c5\" >"..icon.."</span>Volume: "..volume.."%</span>"
    end
    
    audiodev_widget.markup = "<span><span foreground=\"#76b5c5\" >"..icon.."</span>Volume: "..volume.."%</span>"
    audiodev_widget.valign = 'center'
    audiodev_widget:buttons(gears.table.join(
    awful.button({}, 1, toggleAudiodev),
    awful.button({}, 3, mute),
    awful.button({}, 4, function() changeVol(1) end),
    awful.button({}, 5, function() changeVol(-1) end)
    ))


    return audiodev_widget
end






-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
-- screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    -- set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }
    -- hack to get gap to wibar
    awful.wibox({
        screen = s,
        height = 5,
        bg = "#00000000",
    }) 
    -- Create the wibox
    s.mywibox = awful.wibox({ position = "top", screen = s, height=30, width=1920-40, opacity=0.8})

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        -- memory_widget,
        {
            layout = wibox.layout.fixed.horizontal,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            audioController(),
            battery(),
            wifi(),
            memory_widget,
            cpu_widget,
            mykeyboardlayout,
            mytextclock,
            s.mylayoutbox,
        },
    }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- My keysbindings :)))))
    -- awful.key({ modkey,           }, "l", function () awful.spawn.with_shell("~/.config/rofi/applets/bin/quicklinks.sh") end,
    --           {description="rofi links", group="rofi"}),
    awful.key({ modkey,           }, "n", function () awful.spawn.with_shell("~/.config/rofi/applets/bin/mpd.sh") end,
              {description="rofi mpd", group="rofi"}),
    awful.key({ modkey,           }, "v", function () awful.spawn.with_shell("~/.config/rofi/applets/bin/volume.sh") end,
              {description="rofi volume", group="rofi"}),
    awful.key({ modkey,           }, "b", function () awful.spawn.with_shell("~/.config/rofi/applets/bin/battery.sh") end,
              {description="rofi battery", group="rofi"}),
    awful.key({ modkey,"Shift"           }, "b", function () awful.spawn.with_shell("~/.config/rofi/applets/bin/brightness.sh") end,
              {description="rofi brightness", group="rofi"}),
    awful.key({ modkey,           }, "p", function () awful.spawn.with_shell("~/.config/rofi/applets/bin/powermenu.sh") end,
              {description="rofi powermenu", group="rofi"}),
    awful.key({ modkey,           }, "a", function () awful.spawn.with_shell("~/.config/rofi/applets/bin/apps.sh") end,
              {description="rofi apps", group="rofi"}),
    awful.key({ modkey,           }, "d", function () awful.spawn.with_shell("~/.config/rofi/launchers/type-6/launcher.sh") end,
              {description = "open rofi", group = "rofi"}),

    awful.key({ modkey }, "o",function() require("awful").screen.focused().selected_tag.gap = require("awful").screen.focused().selected_tag.gap+10 end,
              {description="sets kayboard to us", group="awesome"}),
    awful.key({ modkey,"Shift"}, "o",function() require("awful").screen.focused().selected_tag.gap = require("awful").screen.focused().selected_tag.gap-10 end,
              {description="sets kayboard to us", group="awesome"}),

    awful.key({ modkey,"Shift"}, "c",function() awful.spawn("kitty --class calcer calcer -s ")  end,
              {description="spawn calculatro", group="apps"}),

    awful.key({"Control", "Shift"          }, "k",      function() awful.spawn.with_shell("setxkbmap us") end,
              {description="sets kayboard to us", group="awesome"}),
    awful.key({"Control", "Shift"           }, "l",      function() awful.spawn.with_shell("setxkbmap se") end,
              {description="sets kayboard to se", group="awesome"}),
    awful.key({ modkey,           }, "w", function () awful.spawn(browser) end,
              {description = "open broweser", group = "launcher"}),
    awful.key({ modkey,           }, "e", function () awful.spawn(fm) end,
              {description = "open fm", group = "launcher"}),
        
    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey,    }, "q", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, ",",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({ modkey,"Shift" }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"})
)

clientkeys = gears.table.join(
    
    awful.key({ modkey,"Shift"}, "Tab",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),

    awful.key({ modkey, 'Control' }, 't',awful.titlebar.toggle,
            {description = 'toggle title bar', group = 'client'}),


    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey,    }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Shift" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, ",",
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
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = 2,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          -- "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
          "calcer",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "conky",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}
client.connect_signal("property::floating", function(c)
  if c.floating and not c.requests_no_titlebar then
    awful.titlebar.show(c)
  else
    awful.titlebar.hide(c)
  end
end)
-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = true})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
--

-- wibox custumize

-- s.mywibox.height = 30

---- AutoStart --
awful.spawn.with_shell("~/.dotfiles/initsession.sh")
awful.spawn.with_shell("export QT_QPA_PLATFORMTHEME=qt5ct")

-- awful.spawn.with_shell("~/.screenlayout/main.sh")
-- awful.spawn.with_shell("picom")
-- awful.spawn.with_shell("setxkbmap us")
-- awful.spawn.with_shell("wal -R")
-- awful.spawn.with_shell("nitrogen --restore")
-- awful.spawn.with_shell("mpd")
-- awful.spawn.with_shell(".config/conky/Sirius/start.sh")
