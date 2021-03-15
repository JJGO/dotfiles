-- Zoom mute button


zoomMuteStatusLine = nil
zoomVideoStatusLine = nil

function drawMuteBorder()
    zoomMuteStatusLineColor = {["red"]=1,["blue"]=0,["green"]=0,["alpha"]=0.9}
    max = hs.screen.primaryScreen():fullFrame()
    zoomMuteStatusLine = hs.drawing.rectangle(hs.geometry.rect(max.x, max.y, max.w, max.h))
    zoomMuteStatusLine:setStrokeColor(zoomMuteStatusLineColor)
    zoomMuteStatusLine:setFillColor(zoomMuteStatusLineColor)
    zoomMuteStatusLine:setFill(false)
    zoomMuteStatusLine:setStrokeWidth(30)
    zoomMuteStatusLine:show()
end

function drawVideoBorder()
    zoomVideoStatusLineColor = {["red"]=0,["blue"]=0,["green"]=1,["alpha"]=0.9}
    max = hs.screen.primaryScreen():fullFrame()
    zoomVideoStatusLine = hs.drawing.rectangle(hs.geometry.rect(max.x, max.y, max.w, max.y+25))
    zoomVideoStatusLine:setStrokeColor(zoomVideoStatusLineColor)
    zoomVideoStatusLine:setFillColor(zoomVideoStatusLineColor)
    zoomVideoStatusLine:setFill(false)
    zoomVideoStatusLine:setStrokeWidth(30)
    zoomVideoStatusLine:show()
end

function redrawBorder()
    if zoomMuteStatusLine ~= nil then
        zoomMuteStatusLine:delete()
        drawMuteBorder()
    end
    if zoomVideoStatusLine ~= nil then
        zoomVideoStatusLine:delete()
        drawVideoBorder()
    end
end

function toggleZoomMute()
    z = hs.application.find('zoom.us')
    if z then
        if not z:selectMenuItem('Mute Audio') then
            -- print("Unmute")
            if not z:selectMenuItem('Unmute Audio') then
                print("WTF")
            end
        -- else
            -- print("Mute")
        end
        canMute = z:findMenuItem('Mute Audio')
        canUnmute = z:findMenuItem('Unmute Audio')
        if canMute then
            zoomMuteStatusLine:delete()
            zoomMuteStatusLine = nil
            -- print("  canMute: " .. tostring(canMute.enabled))
        end
        if canUnmute then
            -- zoomMuteStatusLine:show()
            drawMuteBorder()
            -- print("  canUnmute: " .. tostring(canUnmute.enabled))
        end
        if not (canMute or canUnmute) then
            hs.alert.show("No meeting in progress")
            zoomMuteStatusLine:delete()
            zoomMuteStatusLine = nil
        end
    else
        hs.alert.show("Zoom is not running")
        zoomMuteStatusLine:delete()
        zoomMuteStatusLine = nil
    end
end

function toggleZoomVideo()
    z = hs.application.find('zoom.us')
    if z then
        if not z:selectMenuItem('Stop Video') then
            -- print("Stop Video")
            if not z:selectMenuItem('Start Video') then
                print("WTF")
            end
        -- else
            -- print("Mute")
        end
        canStop = z:findMenuItem('Stop Video')
        canStart = z:findMenuItem('Start Video')
        if canStop then
            zoomVideoStatusLine:delete()
            zoomVideoStatusLine = nil
            -- print("  canStop: " .. tostring(canStop.enabled))
        end
        if canStart then
            -- zoomVideoStatusLine:show()
            drawVideoBorder()
            -- print("  canStart: " .. tostring(canStart.enabled))
        end
        if not (canStop or canStart) then
            hs.alert.show("No meeting in progress")
            zoomVideoStatusLine:delete()
            zoomVideoStatusLine = nil
        end
    else
        hs.alert.show("Zoom is not running")
        zoomVideoStatusLine:delete()
        zoomVideoStatusLine = nil
    end
end

hs.application.enableSpotlightForNameSearches(true)

-- Hyper+Z toggles Zoom mute from anywhere and toggles a red border
hs.hotkey.bind(hyper, "Z", toggleZoomMute)

-- Hyper+X toggles Zoom video from anywhere and toggles a green border
hs.hotkey.bind(hyper, "X", toggleZoomVideo)

-- Space switch watcher so border is propagated if necessary
w = hs.spaces.watcher.new(function(x) redrawBorder() end)
w:start()
