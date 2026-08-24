local utils = require("scripts.utils")
local workspaces = utils.workspaces

for i = 1, 10 do
    hl.dsp.workspace.rename({ workspace = i, name = workspaces[i] })
end

hl.workspace_rule({ workspace = utils.workspace_ref(1), monitor = "DP-3", default = true, persistent = true })
hl.workspace_rule({ workspace = utils.workspace_ref(2), monitor = "DP-2", default = true, persistent = true })
hl.workspace_rule({ workspace = utils.workspace_ref(3), monitor = "DP-1", default = true, persistent = true })
hl.workspace_rule({ workspace = utils.workspace_ref(4), monitor = "HDMI-A-1", default = true, persistent = true })
hl.workspace_rule({ workspace = utils.workspace_ref(5), monitor = "DP-1", persistent = true })

for i = 6, 10 do
    hl.workspace_rule({ workspace = utils.workspace_ref(i), monitor = "DP-2", persistent = true })
end
