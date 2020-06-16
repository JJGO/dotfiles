
function backupCallback(exitCode, stdOut, stdErr)
    if (exitCode == 0) then
        hs.alert.show("CPM backup done", 2)
        hs.alert.show("Unmounting", 2)
        hs.fs.volume.eject("/Volumes/COPPERMIND")
        hs.alert("CPM backup completed. Disconnect USB")
    else
        hs.alert("CPM backup error: " .. exitCode, 3)
    end
end
function fsCallback(event, data)
    if (event == hs.fs.volume.didMount) then
        if (data["path"] == "/Volumes/COPPERMIND") then
            hs.alert.show("CPM detected, starting backup")
            usbBackupTask = hs.task.new("/Users/josejavier/.secbin/usb-backup", backupCallback)
            usbBackupTask:start()
        end
    end
end

fswatcher = hs.fs.volume.new(fsCallback)
fswatcher:start()

