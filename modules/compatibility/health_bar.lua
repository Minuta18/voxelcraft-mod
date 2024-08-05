require "voxelcraft:logger/logger"
require "voxelcraft:health/health"
require "voxelcraft:gamemode/gamemode"

---@diagnostic disable-next-line: lowercase-global
health_bar = {}

health_bar.on_health_bar_open = function (player_id)
    logger.debug(string.format(
        "voxelcraft.modules.compatibility.on_health_bar_open(player_id=%s)"
        .. " called", player_id
    ))
    if gamemode.get_gamemode() == "survival" then
        hud.open_permanent("voxelcraft:health_bar")
    end
end

health_bar.calc_health_bar_position = function (
    screen_width, screen_height, health_bar_width, health_bar_height
)
    local x = screen_width / 2 - health_bar_width
    x = x - 50
    local y = screen_height - 80 - health_bar_height 
    return x, y
end


