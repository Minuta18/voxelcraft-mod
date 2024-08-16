require "voxelcraft:logger/logger"
require "voxelcraft:config/config"

local player_health = vconfig:get("health.max_health")
local damaged = 0;

health = {}

health.get_health = function ()
    return player_health
end

health.set_health = function (health)
    player_health = health
end

health.damage = function (damage)
    damaged = vconfig:get("health.damage.animation_length"); -- 0.25s
    player_health = player_health - damage
    player_health = math.max(player_health, 0)
    audio.play_sound_2d("hit1", 0.5, 2)
    logger.debug(string.format(
        "Player damaged %s points. Now hp is %s", damage, player_health
    ))
end

health.set_damage = function ()
    damaged = 5; 
end

health.is_damaged = function ()
    return damaged > 0
end

health.update = function () 
    damaged = damaged - 1
end
