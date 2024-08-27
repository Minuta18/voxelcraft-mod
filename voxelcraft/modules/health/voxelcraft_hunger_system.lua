require "voxelcraft:utils/utils"
require "voxelcraft:config/config"
require "voxelcraft:logger/logger"
require "voxelcraft:health/base_hunger_system"
require "voxelcraft:health/health"

VoxelcraftHungerSystem = create_class()

function VoxelcraftHungerSystem:init(player_id)
    self.health_system = health.health_storage:get(
        player.get_entity(player_id)
    )
    self.max_power = vconfig:get("health.player_energy.health_addition_length")
    self.power = self.max_power
    self.player_hunger = vconfig:get("health.max_hunger")
    self.player_id = player_id
    self.time_to_health_addition = vconfig:get(
        "health.player_energy.health_addition_length"
    );
end

function VoxelcraftHungerSystem:get_hunger()
    return self.player_hunger  
end

function VoxelcraftHungerSystem:set_hunger(player_hunger)
    self.player_hunger = player_hunger
end

function VoxelcraftHungerSystem:remove_hunger(player_hunger)
    self.player_hunger = self.player_hunger - player_hunger
    self.player_hunger = math.min(self.player_hunger, 0)
end

function VoxelcraftHungerSystem:get_power()
    return self.power
end

function VoxelcraftHungerSystem:set_power(power)
    self.power = power
end

function VoxelcraftHungerSystem:get_max_power()
    return self.max_power
end

function VoxelcraftHungerSystem:set_max_power(max_power)
    self.max_power = max_power
end

function VoxelcraftHungerSystem:update_power()
    local entity_id = player.get_entity(self.player_id)    
    local player_entity = entities.get(entity_id)

    if player_entity == nil then
        return
    end

    local rigitbody = player_entity.rigitbody
    local force = vec3.length(rigitbody:get_vel())

    self.power = self.power - force
    if self.power <= 0 then
        self.power = self.max_power
        self:remove_hunger(1)
    end
end

function VoxelcraftHungerSystem:update_health()
    self.time_to_health_addition = self.time_to_health_addition - 1
    if self.time_to_health_addition == 0 then
        if self.health_system:get_health() < 
            self.health_system:get_max_health() and 
            self:get_hunger() > vconfig:get("health.min_hunger_to_add_health") 
        then
            if not vplayer.is_dead() then
                self.health_system:add_health(
                    vconfig:get("health.health_regeneration")
                )
            end
            if self.player_hunger == 0 then
                self.health_system:damage(vconfig:get("health.hunger_damage"))
            end
            self.time_to_health_addition = vconfig:get(
                "health.player_energy.health_addition_length"
            );
        end
    end
end

function VoxelcraftHungerSystem:update()
    self:update_power()
    self:update_health()
end