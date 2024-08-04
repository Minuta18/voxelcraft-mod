require "voxelcraft:core"

function on_open(invid)
    voxelcraft_core.logger.debug(string.format(
        "voxelcraft.layout.health_bar.on_open(invid=%s) called",
        invid
    ))
end

function on_resize()
    local window_size = gui.get_viewport()
    return window_size[1] / 2 - 534 / 2, window_size[2] - 100
end


