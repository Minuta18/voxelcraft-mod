require "voxelcraft:utils/utils"
require "voxelcraft:config/config"
require "voxelcraft:logger/logger"

BaseHungerSystem = create_class()

function BaseHungerSystem:init(health_system) end
function BaseHungerSystem:get_hunger() end
function BaseHungerSystem:set_hunger(hunger) end
function BaseHungerSystem:get_power() end
function BaseHungerSystem:set_power(power) end
function BaseHungerSystem:get_max_power() end
function BaseHungerSystem:set_max_power(power) end
function BaseHungerSystem:update_power() end
function BaseHungerSystem:update() end
