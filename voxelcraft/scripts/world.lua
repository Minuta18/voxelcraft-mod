require "voxelcraft:core"

function on_world_open()
    voxelcraft_core.logger.info(
        "voxelcraft.scripts.world.on_world_open() called"
    )
    voxelcraft_core.compatibility.world_events.on_world_open()
end

local function update_player()
    local entity_id = player.get_entity(0) -- default player id
    local player_entity = entities.get(entity_id)

    if player_entity == nil then return nil end

    local pos = player_entity.transform:get_pos()
    local is_grounded = player_entity.rigidbody:is_grounded()
    local is_flight = player.is_flight()
    voxelcraft_core.vplayer.update(pos, is_grounded, is_flight)
end

function on_world_tick()
    voxelcraft_core.compatibility.world_events.on_world_tick()
    update_player()
end

function on_world_save()
    voxelcraft_core.compatibility.world_events.on_world_save()
end
