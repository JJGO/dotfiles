hyper = {"ctrl", "alt", "cmd", "shift"}

-- Generic Helpers

function printt(table)
    for k, v in pairs(table) do
        print(k .. "--\t" .. tostring(v))
    end
end

hs.urlevent.bind("alert", function(eventName, params)
    hs.alert.show(params['msg'])
end)


function clickMenuItem(app, item)
    app = hs.application.find(app)
    app:selectMenuItem(item)
end

require("autoreload")
require("keyboard")
require("yabai")
require("auto-audio")
require("cpm-backup")
require("zoom-mute")
require("multidisplay-black")

