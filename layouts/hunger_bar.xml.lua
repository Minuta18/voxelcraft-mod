require "voxelcraft:core"

function on_open(invid)
    voxelcraft_core.logger.debug(string.format(
        "voxelcraft.layout.hunger_bar.on_open(invid=%s) called",
        invid
    ))
end

function on_resize()
    local window_size = gui.get_viewport()
    -- health bar size is 500x40
    return voxelcraft_core.compatibility.hunger_bar.calc_hunger_bar_position(
        window_size[1], window_size[2], 500, 40
    )
end
