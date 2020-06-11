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
    os.execute('date -u +"~/Downloads/%Y%m%d%H%M%S.txt" | xargs /usr/local/bin/subl -n')
end
function openVimr()
    d = os.date("%Y%m%d%H%M%S")
    file = os.getenv("HOME") .. "/Downloads/" .. d .. ".md"
    os.execute("/usr/local/bin/vimr " .. file)
end

-- ⌘ + ⏎ Opens New Terminal
hs.hotkey.bind({"cmd"}, "return", openTerminal)

-- ⌘ + ⇧ + ⏎ Opens New Browser Window
hs.hotkey.bind({"cmd","shift"}, "return", openBrowser)

-- Ctrl + ⇧ + ⏎
hs.hotkey.bind({"ctrl", "cmd"}, "return", openVimr)

-- Hyper+V types contents of clipboard
hs.hotkey.bind(hyper, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

-- Hyper+` Brings up Hammerspoon console
hs.hotkey.bind(hyper, "`", function() hs.openConsole() end)

-- Launch or Focus Activity Monitor
hs.hotkey.bind(hyper, "M", function() hs.application.launchOrFocus("Activity Monitor") end)

-- Launch or Focus Activity Monitor
hs.hotkey.bind(hyper, "S", function() hs.application.launchOrFocus("Spotify") end)

-- Provides a keyboard based window switcher (instead of app switcher)
hs.hotkey.bind({"cmd", "alt"}, "tab", function() hs.hints.windowHints() end)

-- Paste my email
hs.hotkey.bind(hyper, "E", function() hs.eventtap.keyStrokes("josejavier.gonzalez.ortiz@gmail.com") end)

-- Hyper+F makes toggles app zoom
hs.hotkey.bind(hyper, "F", function() hs.window.focusedWindow():toggleZoom() end)

-- Ctrl+Cmd + Escape -- Sleeps the Computer
hs.hotkey.bind({"ctrl", "cmd"}, "escape", function() hs.caffeinate.systemSleep() end)

-- Ctrl+Shift + Escape -- Sleeps the displays
hs.hotkey.bind({"ctrl", "shift"}, "escape", function() os.execute("pmset displaysleepnow") end)

-- Ctrl+Cmd+Alt + P -- Toggle Caps Lock
hs.hotkey.bind({"ctrl", "cmd", "alt"}, "P", function() hs.hid.capslock.toggle() end)
