require "voxelcraft:logger/logger"

---@diagnostic disable-next-line: lowercase-global
hunger_bar = {}

hunger_bar.on_hunger_bar_open = function (player_id)
    logger.info(string.format(
        "voxelcraft.modules.compatibility.on_hunger_bar_open(player_id=%s)"
        .. " called", player_id
    ))
    if gamemode.get_gamemode() == "survival" then
        hud.open_permanent("voxelcraft:hunger_bar")
    end
end
