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

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function require_if_exists(file)
    if file_exists(file .. ".lua") then
        print(" #### Loading " .. file)
        require(file)
    end
end

require_if_exists("autoreload")
-- hs.loadSpoon("ReloadConfiguration")
-- spoon.ReloadConfiguration:start()

require_if_exists("keyboard")
require_if_exists("yabai")
require_if_exists("auto-audio")
require_if_exists("cpm-backup")
require_if_exists("cpm-backup2")
require_if_exists("zoom-mute")
require_if_exists("multidisplay-black")
require_if_exists("pomo")
require_if_exists("distractions")
