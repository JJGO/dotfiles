-- Bunch of convenient Keyboard Shorcut actions

function openTerminal()
    -- kitty
    k = hs.application.find("kitty")
    if k == nil then
        hs.application.launchOrFocus("kitty")
    else
        k:selectMenuItem("New OS window")
    end
end

function openBrowser()
    -- kitty
    k = hs.application.find("Firefox")
    if k == nil then
        hs.application.launchOrFocus("Firefox")
    end
    k:selectMenuItem("New Window")
end

function openSublime()
    -- d = os.date("%Y%m%d%H%M%S")
    os.execute('date -u +"~/Downloads/%Y%m%d%H%M%S.txt" | xargs /usr/local/bin/subl -n')
end

-- ⌘ + ⏎ Opens New Terminal
hs.hotkey.bind({"cmd"}, "return", openTerminal)
-- ⌘ + ⇧ + ⏎ Opens New Browser Window
hs.hotkey.bind({"cmd","shift"}, "return", openBrowser)
-- Ctrl + ⇧ + ⏎
hs.hotkey.bind({"ctrl", "cmd"}, "return", openSublime)

-- Hyper+V types contents of clipboard
hs.hotkey.bind(hyper, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

-- Hyper+` Brings up Hammerspoon console
hs.hotkey.bind(hyper, "`", function() hs.openConsole() end)

-- Launch or Focus Activity Monitor
hs.hotkey.bind(hyper, "M", function() hs.application.launchOrFocus("Activity Monitor") end)

-- Provides a keyboard based window switcher (instead of app switcher)
hs.hotkey.bind(hyper, "tab", function() hs.hints.windowHints() end)
