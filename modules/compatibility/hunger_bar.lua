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

hunger_bar.calc_hunger_bar_position = function (
    screen_width, screen_height, hunger_bar_width, hunger_bar_height
)
    local x = screen_width / 2
    x = x + 50
    local y = screen_height - 80 - hunger_bar_height 
    return x, y
end
