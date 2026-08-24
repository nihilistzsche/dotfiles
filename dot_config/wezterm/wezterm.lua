local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.font = wezterm.font("Fira Code iScript")
config.harfbuzz_features = { "zero" }
require("monokai-pro").apply_to_config(config, "machine")
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config)
return config
