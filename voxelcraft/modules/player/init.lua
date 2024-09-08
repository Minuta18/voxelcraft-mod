require "voxelcraft:player/base_player_physical_controller"
require "voxelcraft:player/voxelcraft_player_physical_controller"
require "voxelcraft:player/commands"
require "voxelcraft:utils/utils"

---@diagnostic disable-next-line: lowercase-global
player_controller = {}

PlayerControllerSystem = create_class()

function PlayerControllerSystem:register_system(system)
    self.current_system = system
end

function PlayerControllerSystem:get_system()
    return self.current_system
end

player_controller.BasePlayerPhysicalController = BasePlayerPhysicalController
player_controller.VoxelcraftPlayerPhysicalController = 
    VoxelcraftPlayerPhysicalController
player_controller.PlayerControllerSystem = PlayerControllerSystem
player_controller.player_controller_system = PlayerControllerSystem:new()
player_controller.player_controller_storage = PlayerDataStore:new()
