require "voxelcraft:utils/utils"
require "voxelcraft:health/voxelcraft_health_system"

---@diagnostic disable-next-line: lowercase-global
health_storage = PlayerDataStore:new()

HealthSystem = create_class()

function HealthSystem:register_system(health_system)
    self.current_health_system = health_system
end

function HealthSystem:get_system()
    return self.current_health_system
end

---@diagnostic disable-next-line: lowercase-global
health_system = HealthSystem:new()
