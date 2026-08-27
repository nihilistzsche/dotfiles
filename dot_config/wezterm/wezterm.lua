local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.font = wezterm.font("Fira Code iScript")
config.harfbuzz_features = { "zero" }
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.show_tabs_in_tab_bar = true
require("monokai-pro").apply_to_config(config, "machine")
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config)
return config
