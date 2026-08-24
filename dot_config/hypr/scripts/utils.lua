local utils = {}
utils.workspaces = {
    "Games",
    "Discord",
    "Dev",
    "Media",
    "Web",
    "Extra1",
    "Teamcraft",
    "Steam",
    "EasyEffects",
    "Terminal",
}

function utils.workspace_ref(workspace) return "name:" .. utils.workspaces[workspace] end

return utils
