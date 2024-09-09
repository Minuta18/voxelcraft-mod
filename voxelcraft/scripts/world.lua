require "voxelcraft:core"
require "voxelcraft:worldgen"

function on_world_open()
    voxelcraft_core.logger.info(
        "voxelcraft.scripts.world.on_world_open() called"
    )
end

local intialized = false

function on_world_tick()
    if not intialized then
        voxelcraft_core.compatibility.world_events.intialize()
        intialized = true
    end
    voxelcraft_core.compatibility.world_events.update()
end

function on_world_save()
    voxelcraft_core.compatibility.world_events.on_world_save()
end
