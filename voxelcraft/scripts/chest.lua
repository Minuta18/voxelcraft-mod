require "voxelcraft:core"

function on_interact(x, y, z, player_id)
    voxelcraft_core.logger.debug(string.format(
        "voxelcraft.scripts.chesr.on_interact(" ..
        "x=%s y=%s z=%s player_id=%s)", x, y, z, player_id
    ))
    hud.open_block(x, y, z)
    return true
end
