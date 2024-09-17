require "voxelcraft:utils/utils"
require "voxelcraft:config/config"
require "voxelcraft:logger/logger"

BaseHealthSystem = create_class()

function BaseHealthSystem:get_health() end
function BaseHealthSystem:set_health(health) end
function BaseHealthSystem:add_health(health) end
function BaseHealthSystem:remove_health(health) end
function BaseHealthSystem:get_max_health() end
function BaseHealthSystem:set_max_health(max_health) end
function BaseHealthSystem:get_eid() end
function BaseHealthSystem:set_eid() end
-- TODO: separate this in HealthSystem and HealthAnimator
function BaseHealthSystem:play_damage_animation() end
function BaseHealthSystem:does_animation_plays() end
function BaseHealthSystem:play_damage_sound() end
function BaseHealthSystem:damage(health) end
function BaseHealthSystem:get_serializer() end
function BaseHealthSystem:set_serializer(serializer) end
