local utils = require("scripts.utils")

local autostart_cmds = {
    exec = {
        "wl-clip-persist --clipboard regular",
        "wl-paste --type text --watch cliphist store",
        "wl-paste --type image --watch cliphist store",
        "hyprscratch init clean eager",
        "waybar",
        "hyprpaper",
        "hypridle",
        "hyprsunset",
        "mako",
        "blueman-applet",
        "caffeine",
        "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
        "systemctl --user start hyprland-session.target",
        {
            cmd = "wezterm",
            args = { workspace = utils.workspace_ref(10) },
        },
    },
    dispatch = {
        {
            fn = hl.dsp.focus,
            args = { workspace = utils.workspace_ref(1) },
        },
    },
}

local function run_autostart(entries)
    for _, entry in ipairs(entries) do
        if type(entry) == "table" then
            hl.exec_cmd(entry.cmd, entry.args)
        else
            hl.exec_cmd(entry)
        end
    end
end

local function run_dispatch(entries)
    for _, entry in ipairs(entries) do
        hl.dispatch(entry.fn(entry.args))
    end
end

hl.on("hyprland.start", function()
    run_autostart(autostart_cmds.exec)
    run_dispatch(autostart_cmds.dispatch)
end)

hl.on("hyprland.shutdown", function() os.execute("systemctl --user stop hyprland-session.target && sleep 0.1") end)

local closedWindow = false
hl.on("window.open", function(w)
    if w.class == "ckb-next" and not closedWindow then
        hl.dispatch(hl.dsp.window.close({ window = w }))
        closedWindow = true
    end
end)
