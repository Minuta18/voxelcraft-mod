require "voxelcraft:core"

function on_world_open()
    voxelcraft_core.logger.debug(
        "voxelcraft.scripts.world.on_world_open() called"
    )
    voxelcraft_core.on_world_open()
end
