require "voxelcraft:core"

function on_hud_open(player_id)
    voxelcraft_core.logger.debug("voxelcraft.scripts.hud.on_hud_open(" ..
        "player_id=" .. player_id .. ") called"
    )
end
