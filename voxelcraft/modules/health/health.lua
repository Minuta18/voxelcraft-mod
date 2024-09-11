require "voxelcraft:utils/utils"
require "voxelcraft:health/voxelcraft_health_system"

health = {}

HealthSystem = create_class()

function HealthSystem:register_system(health_system)
    self.current_health_system = health_system
end

function HealthSystem:get_system()
    return self.current_health_system
end

health.health_system = HealthSystem:new()
health.health_storage = PlayerDataStore:new()
health.health_saver = PlayerDataStoreSaver:new(
    health.health_storage, "health_storage"
)
health.HealthSystem = HealthSystem
health.BaseHealthSystem = HealthSystem
health.VoxelcraftHealthSystem = VoxelcraftHealthSystem
