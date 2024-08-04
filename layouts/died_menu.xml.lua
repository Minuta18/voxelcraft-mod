---@diagnostic disable: undefined-global
require "voxelcraft:core"

function on_open(invid)
    voxelcraft_core.logger.debug(string.format(
        "voxelcraft.layout.died_menu.on_open(invid=%s) called",
        invid
    ))
end

function on_resize()
    local window_size = gui.get_viewport()
    return window_size[1] / 2 - 200, window_size[2] / 2 - 200
end

vplayer.tp_to_spawn = function ()
    local player_spawn = player.get_spawnpoint(0)
    player.set_pos(0, 0, 60, 0)
end

function on_respawn()
    voxelcraft_core.logger.debug(
        "voxelcraft.layout.died_menu.on_respawn() called"
    )
    voxelcraft_core.vplayer.respawn()
end
