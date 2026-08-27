local utils = require("scripts.utils")

local function assign_window_to_workspace(class, workspace)
	hl.window_rule({
		match = {
			class = class,
		},
		workspace = utils.workspace_ref(workspace),
	})
end
assign_window_to_workspace("discord", 2)
assign_window_to_workspace("steam", 8)
assign_window_to_workspace("com.github.wwmm.easyeffects", 9)
assign_window_to_workspace("ffxiv-teamcraft", 7)
assign_window_to_workspace("neovide", 3)

hl.window_rule({ match = { class = "org.wezfurlong.wezterm" }, opacity = "0.8 0.8" })
hl.window_rule({ match = { class = "discord" }, opacity = "0.9 0.9" })
hl.window_rule({ match = { class = "neovide" }, opacity = "0.8 0.8" })

-- Enable blur for waybar
hl.layer_rule({ match = { namespace = "waybar" }, blur = true })

-- Named layer rule
hl.layer_rule({
	match = { namespace = "selection" },
	no_anim = true,
})

-- Enable blur and ignore_alpha for rofi
hl.layer_rule({
	match = { namespace = "rofi" },
	blur = true,
	ignore_alpha = 0.5,
})
