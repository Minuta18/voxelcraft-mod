require "voxelcraft:logger/logger"

---@diagnostic disable-next-line: lowercase-global
health_bar = {}

health_bar.on_health_bar_open = function (player_id)
    logger.debug(string.format(
        "voxelcraft.modules.compatibility.on_health_bar_open(player_id=%s)"
        .. " called", player_id
    ))
    hud.open_permanent("voxelcraft:health_bar")
end

health_bar.calc_health_bar_position = function (screen_width, screen_height)

end

