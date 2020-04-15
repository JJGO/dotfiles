-- Zoom mute button


zoomMuteStatusLine = nil

function drawBorder()
    zoomMuteStatusLineColor = {["red"]=1,["blue"]=0,["green"]=0,["alpha"]=0.9}
    max = hs.screen.primaryScreen():fullFrame()
    zoomMuteStatusLine = hs.drawing.rectangle(hs.geometry.rect(max.x, max.y, max.w, max.h))
    zoomMuteStatusLine:setStrokeColor(zoomMuteStatusLineColor)
    zoomMuteStatusLine:setFillColor(zoomMuteStatusLineColor)
    zoomMuteStatusLine:setFill(false)
    zoomMuteStatusLine:setStrokeWidth(30)
    zoomMuteStatusLine:show()
end

function redrawBorder()
    if zoomMuteStatusLine ~= nil then
        zoomMuteStatusLine:delete()
        drawBorder()
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
            -- print("  canMute: " .. tostring(canMute.enabled))
        end
        if canUnmute then
            -- zoomMuteStatusLine:show()
            drawBorder()
            -- print("  canUnmute: " .. tostring(canUnmute.enabled))
        end
        if not (canMute or canUnmute) then
            hs.alert.show("No meeting in progress")
            zoomMuteStatusLine:delete()
        end
    else
        hs.alert.show("Zoom is not running")
        zoomMuteStatusLine:delete()
    end
end

-- Hyper+Z toggles Zoom mute from anywhere and toggles a red border
hs.hotkey.bind(hyper, "Z", toggleZoomMute)
hs.application.enableSpotlightForNameSearches(true)

-- Space switch watcher so border is propagated if necessary
w = hs.spaces.watcher.new(function(x) redrawBorder() end)
w:start()
