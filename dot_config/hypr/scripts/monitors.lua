local modes = {
    ["DP"] = { 1920, 1080, 144 },
    ["HDMI"] = { 2560, 1080, 60 },
}
local positions = {
    ["DP-3"] = { 0, 0 },
    ["DP-2"] = { -1920, 0 },
    ["DP-1"] = { 1920, 0 },
    ["HDMI-A-1"] = { 0, -1080 },
}

local function monitor(output)
    local pos = positions[output]
    local connector = output:match("^[^-]+")
    local mode = modes[connector]
    if not mode then
        error("Monitor mode for output " .. output .. " not found.")
    elseif not pos then
        error("Monitor position for output " .. output .. " not found.")
    else
        return hl.monitor({
            output = output,
            mode = string.format("%dx%d@%d", table.unpack(mode)),
            position = string.format("%dx%d", table.unpack(pos)),
            scale = 1,
        })
    end
end

monitor("DP-3")
monitor("DP-2")
monitor("DP-1")
monitor("HDMI-A-1")
