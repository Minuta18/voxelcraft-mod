---@diagnostic disable: undefined-global
require "voxelcraft:core"

function on_open(invid)
    voxelcraft_core.logger.info(string.format(
        "voxelcraft.layout.died_menu.on_open(invid=%s) called",
        invid
    ))
end

function on_resize()
    local window_size = gui.get_viewport()
    return window_size[1] / 2 - 200, window_size[2] / 2 - 200
end

function on_respawn()
    voxelcraft_core.logger.info(
        "voxelcraft.layout.died_menu.on_respawn() called"
    )
    voxelcraft_core.vplayer.respawn()
end
