require "voxelcraft:logger/logger"
require "voxelcraft:health/health"
require "voxelcraft:config/config"
require "voxelcraft:health/base_hunger_system"
require "voxelcraft:health/voxelcraft_hunger_system"

---@diagnostic disable-next-line: lowercase-global
hunger = {}

HungerSystem = create_class()

function HungerSystem:register_system(hunger_system)
    self.current_hunger_system = hunger_system
end

function HungerSystem:get_system()
    return self.current_hunger_system
end

hunger.hunger_system = HungerSystem:new()
hunger.hunger_storage = PlayerDataStore:new()
hunger.HungerSystem = HungerSystem
hunger.BaseHungerSystem = BaseHungerSystem
hunger.VoxelcraftHungerSystem = VoxelcraftHungerSystem
