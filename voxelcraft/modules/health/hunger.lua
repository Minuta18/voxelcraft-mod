require "voxelcraft:logger/logger"
require "voxelcraft:health/health"

local player_hunger = 20
local time_to_health_addition = 60;
local max_power = 3000;
local power_before_hunger = max_power;

hunger = {}

hunger.get_hunger = function ()
    return player_hunger
end

hunger.set_hunger = function (hunger)
    player_hunger = hunger
end

hunger.reset_time = function ()
    time_to_health_addition = 60;
end

hunger.check_power = function ()
    local entity_id = player.get_entity(0)
    local player_entity = entities.get(entity_id)

    if player_entity == nil then return nil end

    local rigidbody = player_entity.rigidbody
    local force = vec3.length(rigidbody:get_vel())

    power_before_hunger = power_before_hunger - force
    if power_before_hunger <= 0 then
        power_before_hunger = max_power
        player_hunger = player_hunger - 1
    end
end

hunger.update = function ()
    if time_to_health_addition > 0 then
        time_to_health_addition = time_to_health_addition - 1;
    end
    if time_to_health_addition == 0 then
        if health.get_health() < 20 and hunger.get_hunger() > 14 then
            health.set_health(health.get_health() + 1)
            health.set_damage()
            hunger.set_hunger(hunger.get_hunger() - 2)
        end
        if hunger.get_hunger() == 0 then
            health.damage(3)
        end
        hunger.reset_time()
    end
end
