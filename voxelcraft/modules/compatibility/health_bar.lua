require "voxelcraft:logger/logger"
require "voxelcraft:health/health"
require "voxelcraft:gamemode/gamemode"

---@diagnostic disable-next-line: lowercase-global
health_bar = {}

health_bar.on_health_bar_open = function (player_id)
    logger.info(string.format(
        "voxelcraft.modules.compatibility.on_health_bar_open(player_id=%s)"
        .. " called", player_id
    ))
    if gamemode.get_gamemode() == "survival" then
        hud.open_permanent("voxelcraft:health_bar")
    end
end
