-- Hyper+F11 toggles black boxes on secondary monitors

movieblocks = nil
function toggleMovieMode()
    if movieblocks ~= nil then
        for k, v in pairs(movieblocks) do
            v:delete()
        end
        movieblocks = nil
    else
        p = hs.screen.primaryScreen()
        movieblocks = {}
        for k, v in pairs(hs.screen.allScreens()) do
            if v:name() ~= p:name() then
                max = v:fullFrame()
                box = hs.drawing.rectangle(hs.geometry.rect(max.x, max.y, max.w, max.h))
                black = {["red"]=0,["blue"]=0,["green"]=0,["alpha"]=1.0}
                box:setStrokeColor(black)
                box:setFillColor(black)
                box:setFill(true)
                box:show()
                -- v:setBrightness(0.0)
                movieblocks[k] = box
            end
        end
    end
    -- for k, v in pairs(hs.screen.allScreens()) do
    --     v:setBrightness(0.75)
    -- end
end

hs.hotkey.bind(hyper, "F11", toggleMovieMode)
