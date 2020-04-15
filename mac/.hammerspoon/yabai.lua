-- /usr/local/bin/yabai stuff

function bindCmd(mods, key, cmd)
    hs.hotkey.bind(mods, key, function() os.execute(cmd) end)
end

-- focus window
bindCmd({"alt"}, "h", "/usr/local/bin/yabai -m window --focus west")
bindCmd({"alt"}, "j", "/usr/local/bin/yabai -m window --focus south")
bindCmd({"alt"}, "k", "/usr/local/bin/yabai -m window --focus north")
bindCmd({"alt"}, "l", "/usr/local/bin/yabai -m window --focus east")

-- swap window
bindCmd({"shift", "alt"}, "h", "/usr/local/bin/yabai -m window --swap west")
bindCmd({"shift", "alt"}, "j", "/usr/local/bin/yabai -m window --swap south")
bindCmd({"shift", "alt"}, "k", "/usr/local/bin/yabai -m window --swap north")
bindCmd({"shift", "alt"}, "l", "/usr/local/bin/yabai -m window --swap east")

-- move window
bindCmd({"shift", "cmd"}, "h", "/usr/local/bin/yabai -m window --warp west")
bindCmd({"shift", "cmd"}, "j", "/usr/local/bin/yabai -m window --warp south")
bindCmd({"shift", "cmd"}, "k", "/usr/local/bin/yabai -m window --warp north")
bindCmd({"shift", "cmd"}, "l", "/usr/local/bin/yabai -m window --warp east")

-- balance size of windows
bindCmd({"shift", "alt"}, "0", "/usr/local/bin/yabai -m space --balance")

-- make floating window fill screen
-- bindCmd({ "shift", "alt" - up}, " ", "/usr/local/bin/yabai -m window --grid 1:1:0:0:1:1")

-- make floating window fill left-half of screen
-- bindCmd({ "shift", "alt" - le}, " ", "/usr/local/bin/yabai -m window --grid 1:2:0:0:1:1")

-- make floating window fill right-half of screen
-- bindCmd({ "shift", "alt" - ri}, " ", "/usr/local/bin/yabai -m window --grid 1:2:1:0:1:1")


-- fast focus
bindCmd({"cmd", "alt"}, "x", "/usr/local/bin/yabai -m space --focus recent")
bindCmd({"cmd", "alt"}, "z", "/usr/local/bin/yabai -m space --focus prev")
-- bindCmd({ "cmd", "alt"}, "c", "/usr/local/bin/yabai -m space --focus next")
bindCmd({"cmd", "alt"}, "1", "/usr/local/bin/yabai -m space --focus 1")
bindCmd({"cmd", "alt"}, "2", "/usr/local/bin/yabai -m space --focus 2")
bindCmd({"cmd", "alt"}, "3", "/usr/local/bin/yabai -m space --focus 3")
bindCmd({"cmd", "alt"}, "4", "/usr/local/bin/yabai -m space --focus 4")
bindCmd({"cmd", "alt"}, "5", "/usr/local/bin/yabai -m space --focus 5")
bindCmd({"cmd", "alt"}, "6", "/usr/local/bin/yabai -m space --focus 6")
bindCmd({"cmd", "alt"}, "7", "/usr/local/bin/yabai -m space --focus 7")
bindCmd({"cmd", "alt"}, "8", "/usr/local/bin/yabai -m space --focus 8")
bindCmd({"cmd", "alt"}, "9", "/usr/local/bin/yabai -m space --focus 9")
bindCmd({"cmd", "alt"}, "0", "/usr/local/bin/yabai -m space --focus 10")

-- send window to desktop and follow focus
bindCmd({"shift", "cmd"}, "x", "/usr/local/bin/yabai -m window --space recent; /usr/local/bin/yabai -m space --focus recent")
-- bindCmd({ "shift", "cmd"}, "z", "/usr/local/bin/yabai -m window --space prev; /usr/local/bin/yabai -m space --focus prev")
bindCmd({"shift", "cmd"}, "c", "/usr/local/bin/yabai -m window --space next; /usr/local/bin/yabai -m space --focus next")
bindCmd({"shift", "cmd"}, "1", "/usr/local/bin/yabai -m window --space  1; /usr/local/bin/yabai -m space --focus 1")
bindCmd({"shift", "cmd"}, "2", "/usr/local/bin/yabai -m window --space  2; /usr/local/bin/yabai -m space --focus 2")
-- bindCmd({ "shift", "cmd"}, "3", "/usr/local/bin/yabai -m window --space  3; /usr/local/bin/yabai -m space --focus 3")
-- bindCmd({ "shift", "cmd"}, "4", "/usr/local/bin/yabai -m window --space  4; /usr/local/bin/yabai -m space --focus 4")
bindCmd({"shift", "cmd"}, "5", "/usr/local/bin/yabai -m window --space  5; /usr/local/bin/yabai -m space --focus 5")
bindCmd({"shift", "cmd"}, "6", "/usr/local/bin/yabai -m window --space  6; /usr/local/bin/yabai -m space --focus 6")
bindCmd({"shift", "cmd"}, "7", "/usr/local/bin/yabai -m window --space  7; /usr/local/bin/yabai -m space --focus 7")
bindCmd({"shift", "cmd"}, "8", "/usr/local/bin/yabai -m window --space  8; /usr/local/bin/yabai -m space --focus 8")
bindCmd({"shift", "cmd"}, "9", "/usr/local/bin/yabai -m window --space  9; /usr/local/bin/yabai -m space --focus 9")
bindCmd({"shift", "cmd"}, "0", "/usr/local/bin/yabai -m window --space 10; /usr/local/bin/yabai -m space --focus 10")

-- focus monitor
bindCmd({"ctrl", "alt" }, "x", "/usr/local/bin/yabai -m display --focus recent")
bindCmd({"ctrl", "alt" }, "z", "/usr/local/bin/yabai -m display --focus prev")
bindCmd({"ctrl", "alt" }, "c", "/usr/local/bin/yabai -m display --focus next")
bindCmd({"ctrl", "alt" }, "1", "/usr/local/bin/yabai -m display --focus 1")
bindCmd({"ctrl", "alt" }, "2", "/usr/local/bin/yabai -m display --focus 2")
bindCmd({"ctrl", "alt" }, "3", "/usr/local/bin/yabai -m display --focus 3")

-- send window to monitor and follow focus
bindCmd({"ctrl", "cmd" }, "x", "/usr/local/bin/yabai -m window --display recent; /usr/local/bin/yabai -m display --focus recent")
bindCmd({"ctrl", "cmd" }, "z", "/usr/local/bin/yabai -m window --display prev; /usr/local/bin/yabai -m display --focus prev")
bindCmd({"ctrl", "cmd" }, "c", "/usr/local/bin/yabai -m window --display next; /usr/local/bin/yabai -m display --focus next")
bindCmd({"ctrl", "cmd" }, "1", "/usr/local/bin/yabai -m window --display 1; /usr/local/bin/yabai -m display --focus 1")
bindCmd({"ctrl", "cmd" }, "2", "/usr/local/bin/yabai -m window --display 2; /usr/local/bin/yabai -m display --focus 2")
bindCmd({"ctrl", "cmd" }, "3", "/usr/local/bin/yabai -m window --display 3; /usr/local/bin/yabai -m display --focus 3")

-- move window
bindCmd({"shift", "ctrl"}, "a", "/usr/local/bin/yabai -m window --move rel:-20:0")
bindCmd({"shift", "ctrl"}, "s", "/usr/local/bin/yabai -m window --move rel:0:20")
bindCmd({"shift", "ctrl"}, "w", "/usr/local/bin/yabai -m window --move rel:0:-20")
bindCmd({"shift", "ctrl"}, "d", "/usr/local/bin/yabai -m window --move rel:20:0")

-- increase window size
bindCmd({"shift", "alt"}, "a", "/usr/local/bin/yabai -m window --resize left:-20:0")
bindCmd({"shift", "alt"}, "s", "/usr/local/bin/yabai -m window --resize bottom:0:20")
bindCmd({"shift", "alt"}, "w", "/usr/local/bin/yabai -m window --resize top:0:-20")
bindCmd({"shift", "alt"}, "d", "/usr/local/bin/yabai -m window --resize right:20:0")

-- decrease window size
-- bindCmd({ "shift", "cmd"}, "a", "/usr/local/bin/yabai -m window --resize left:20:0")
-- bindCmd({ "shift", "cmd"}, "s", "/usr/local/bin/yabai -m window --resize bottom:0:-20")
bindCmd({"shift", "cmd"}, "w", "/usr/local/bin/yabai -m window --resize top:0:20")
bindCmd({"shift", "cmd"}, "d", "/usr/local/bin/yabai -m window --resize right:-20:0")

-- set insertion point in focused container
bindCmd({"ctrl", "alt"}, "h", "/usr/local/bin/yabai -m window --insert west")
bindCmd({"ctrl", "alt"}, "j", "/usr/local/bin/yabai -m window --insert south")
bindCmd({"ctrl", "alt"}, "k", "/usr/local/bin/yabai -m window --insert north")
bindCmd({"ctrl", "alt"}, "l", "/usr/local/bin/yabai -m window --insert east")

-- rotate tree
bindCmd({"alt"}, "r", "/usr/local/bin/yabai -m space --rotate 90")

-- mirror tree y-axis
bindCmd({"alt"}, "y", "/usr/local/bin/yabai -m space --mirror y-axis")

-- mirror tree x-axis
bindCmd({"alt"}, "x", "/usr/local/bin/yabai -m space --mirror x-axis")

-- toggle desktop offset
bindCmd({"alt"}, "a", "/usr/local/bin/yabai -m space --toggle padding; /usr/local/bin/yabai -m space --toggle gap")

-- toggle window parent zoom
bindCmd({"alt"}, "d", "/usr/local/bin/yabai -m window --toggle zoom-parent")

-- toggle window fullscreen zoom
bindCmd({"alt"}, "f", "/usr/local/bin/yabai -m window --toggle zoom-fullscreen")

-- toggle window native fullscreen
bindCmd({"shift", "alt"}, "f", "/usr/local/bin/yabai -m window --toggle native-fullscreen")

-- toggle window border
bindCmd({"shift", "alt"}, "b", "/usr/local/bin/yabai -m window --toggle border")

-- toggle window split type
-- bindCmd({ "alt"}, "e", "/usr/local/bin/yabai -m window --toggle split")

-- float / unfloat window and center on screen
bindCmd({"alt"}, "t", "/usr/local/bin/yabai -m window --toggle float;\
          /usr/local/bin/yabai -m window --grid 4:4:1:1:2:2")

-- toggle sticky
bindCmd({"alt"}, "s", "/usr/local/bin/yabai -m window --toggle sticky")

-- toggle sticky, float and resize to picture-in-picture size
bindCmd({"alt"}, "p", "/usr/local/bin/yabai -m window --toggle sticky;\
          /usr/local/bin/yabai -m window --grid 5:5:4:0:1:1")

-- change layout of desktop
bindCmd({"ctrl", "alt"}, "a", "/usr/local/bin/yabai -m space --layout bsp")
bindCmd({"ctrl", "alt"}, "d", "/usr/local/bin/yabai -m space --layout float")
