require "voxelcraft:utils/utils"
require "voxelcraft:config/config"
require "voxelcraft:logger/logger"

BasePlayerPhysicalController = create_class()

function BasePlayerPhysicalController:is_fall_damage_enabled() end
function BasePlayerPhysicalController:set_fall_damage_enabled() end
function BasePlayerPhysicalController:drop_inventory() end 
function BasePlayerPhysicalController:apply_fall_damage() end
function BasePlayerPhysicalController:is_dead() end
function BasePlayerPhysicalController:kill() end
function BasePlayerPhysicalController:respawn() end
function BasePlayerPhysicalController:choose_spawnpoint(x, z) end
function BasePlayerPhysicalController:set_spawnpoint(x, y, z) end
function BasePlayerPhysicalController:get_spawnpoint() end
function BasePlayerPhysicalController:teleport_to_spawnpoint() end
function BasePlayerPhysicalController:set_max_speed(speed) end
function BasePlayerPhysicalController:get_max_speed() end
function BasePlayerPhysicalController:set_max_hunger_speed(speed) end
function BasePlayerPhysicalController:get_max_hunger_speed() end
function BasePlayerPhysicalController:update() end
function BasePlayerPhysicalController:render_update() end
