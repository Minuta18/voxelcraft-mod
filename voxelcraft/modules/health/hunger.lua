require "voxelcraft:logger/logger"
require "voxelcraft:health/health"
require "voxelcraft:config/config"

local player_hunger = vconfig:get("health.max_hunger")
local time_to_health_addition = vconfig:get(
    "health.player_energy.health_addition_length"
);
local max_power = vconfig:get(
    "health.player_energy.max_energy"
);
local power_before_hunger = max_power;

hunger = {}

hunger.get_hunger = function ()
    return player_hunger
end

hunger.set_hunger = function (hunger)
    player_hunger = math.min(hunger, vconfig:get(
        "health.max_hunger"
    ))
end

hunger.reset_time = function ()
    time_to_health_addition = vconfig:get(
        "health.player_energy.health_addition_length"
    );
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
    -- TODO: Refactor this func to avoid using magic unmbers
    if time_to_health_addition > 0 then
        time_to_health_addition = time_to_health_addition - 1;
    end
    if time_to_health_addition == 0 then
        if health.get_health() < 20 and hunger.get_hunger() > 14 then
            if not vplayer.is_dead() then
                health.set_health(health.get_health() + 1)
                health.set_damage()
                hunger.set_hunger(hunger.get_hunger() - 2)
            end
        end
        if hunger.get_hunger() == 0 then
            health.damage(3)
        end
        hunger.reset_time()
    end
end

