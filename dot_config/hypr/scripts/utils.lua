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

function utils.workspace_ref(workspace)
	return string.format("name:%d_%s", workspace, utils.workspaces[workspace])
end

return utils
