require "voxelcraft:core"

function on_world_open()
    voxelcraft_core.logger.info(
        "voxelcraft.scripts.world.on_world_open() called"
    )
    voxelcraft_core.compatibility.world_events.on_world_open()
end

function on_world_tick()
    voxelcraft_core.compatibility.world_events.on_world_tick()
end

function on_world_save()
    voxelcraft_core.compatibility.world_events.on_world_save()
end
