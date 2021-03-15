function killApp(app)

    app = hs.application.find(app)
    if app ~= nil then
        app:kill()
    end
end


hs.urlevent.bind("killApp", function(eventname, params)
    killApp(params['app'])
end)
