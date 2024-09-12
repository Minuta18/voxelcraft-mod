require "voxelcraft:utils/utils"
require "voxelcraft:logger/logger"
require "voxelcraft:health/init"

---@diagnostic disable-next-line: lowercase-global
function save_all()
    health.health_saver:save()
    hunger.hunger_saver:save()
end

---@diagnostic disable-next-line: lowercase-global
function load_all()
    health.health_saver:load(
        health.health_storage,
        health.VoxelcraftHealthSystem:new(-1, 20, 20):get_serializer()
    )
    hunger.hunger_saver:load(
        hunger.hunger_storage,
        hunger.VoxelcraftHungerSystem:new(-1, 20):get_serializer()
    )
end
