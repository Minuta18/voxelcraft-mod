require "voxelcraft:logger/logger"

---@diagnostic disable-next-line: lowercase-global
hunger_bar = {}

hunger_bar.on_hunger_bar_open = function (player_id)
    logger.info(string.format(
        "opened hunger bar for player %s",
        player_id
    ))
    if gamemode.get_gamemode() == "survival" then
        hud.open_permanent("voxelcraft:hunger_bar")
    end
end
