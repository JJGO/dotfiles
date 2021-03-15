pomoActive = false

function pomodoroBreak(minutes)
    overlay_color = {['red']=0.1, ['blue']=0.1, ['green']=0.1, ['alpha']=0.8}
    mainRes = hs.screen.primaryScreen():fullFrame()
    overlay = hs.drawing.rectangle(hs.geometry.rect(mainRes.x, mainRes.y, mainRes.w, mainRes.h))
    overlay:setStrokeColor(overlay_color)
    overlay:setFillColor(overlay_color)
    overlay:setStrokeWidth(0)
    overlay:setFill(true)
    overlay:setLevel(hs.drawing.windowLevels.overlay)
    overlay:show()
    pomoActive = true
    _pomodoroRedraw(minutes*60, overlay, nil)
end


function _pomodoroRedraw(seconds, overlay, text)
    if text then
        text:delete()
    end

    if seconds == 0 or not pomoActive then
        overlay:delete()
    else
        text_color = {['red']=1, ["blue"]=1, ["green"]=1, ['alpha']=1}
        minutes = seconds // 60
        onlyseconds = seconds % 60
        time = string.format("%d:%02d", minutes, onlyseconds)
        text = hs.styledtext.new(time, {font={name="Fira Code", size=150}, color=text_color, paragraphStyle={alignment="center"}})
        textframe = hs.geometry.rect((mainRes.w-600)/2, (mainRes.h-200)/2, 600, 200)
        textdraw = hs.drawing.text(textframe, text)
        textdraw:setLevel(hs.drawing.windowLevels.overlay)
        textdraw:show()
        hs.timer.doAfter(1, function() _pomodoroRedraw(seconds-1, overlay, textdraw) end)
    end
end

function stopPomoBreak()
    pomoActive = false
end

hs.hotkey.bind(hyper, "P", stopPomoBreak)

hs.urlevent.bind("pomodoroBreak", function(eventName, params)
    pomodoroBreak(params['min'])
end)
