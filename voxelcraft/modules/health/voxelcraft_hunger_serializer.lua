require "voxelcraft:utils/utils"
require "voxelcraft:logger/logger"

VoxelcraftHungerSerializer = create_class(ISerializable)

function VoxelcraftHungerSerializer:serialize(inst)
    local serialized_inst = {}
    serialized_inst.max_power = inst.max_power
    serialized_inst.power = inst.power
    serialized_inst.player_hunger = inst.player_hunger
    serialized_inst.player_id = inst.player_id
    serialized_inst.time_to_health_addition = inst.time_to_health_addition
    return serialized_inst
end

function VoxelcraftHungerSerializer:deserialize(serialized_inst)
    if serialized_inst.max_power == nil or
        serialized_inst.power == nil or 
        serialized_inst.player_hunger == nil or
        serialized_inst.player_id == nil or
        serialized_inst.time_to_health_addition == nil
    then
        logger.warning('Found broken or incomplete instance; skipping.')
        logger.warning('Instance details: ' .. dump(serialized_inst))
        return nil
    end

    local inst = VoxelcraftHungerSystem:new(
        serialized_inst.player_id, serialized_inst.player_hugner
    )
    inst.player_hunger = serialized_inst.player_hunger
    inst.max_power = serialized_inst.max_power
    inst.power = serialized_inst.power
    inst.time_to_health_addition = serialized_inst.time_to_health_addition
    logger.debug(dump(inst))
    return inst
end
