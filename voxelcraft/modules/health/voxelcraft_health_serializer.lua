require "voxelcraft:utils/utils"
require "voxelcraft:logger/logger"

VoxelcraftHealthSerializer = create_class(ISerializable)

function VoxelcraftHealthSerializer:serialize(inst)
    local serialized_inst = {}
    serialized_inst.eid = inst.eid
    serialized_inst.max_health = inst.max_health
    serialized_inst.player_health = inst.player_health
    serialized_inst.ticks_to_end_animation = inst.ticks_to_end_animation
    return serialized_inst
end

function VoxelcraftHealthSerializer:deserialize(serialized_inst)
    if serialized_inst.eid == nil or serialized_inst.max_health == nil or
    serialized_inst.player_health == nil or 
    serialized_inst.ticks_to_end_animation == nil then
        logger.warning('Found broken or incomplete instance; skipping.')
        logger.warning('Instance details: ' .. dump(serialized_inst))
        return nil
    end

    local inst = VoxelcraftHealthSystem:new(
        serialized_inst.eid, serialized_inst.max_health, 
        serialized_inst.player_health
    )
    inst.ticks_to_end_animation = serialized_inst.ticks_to_end_animation

    return inst
end
