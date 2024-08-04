require "voxelcraft:logger/logger"

local player_health = 20
local damaged = 0;

health = {}

health.get_health = function ()
    return player_health
end

health.set_health = function (health)
    player_health = health
end

health.damage = function (damage)
    damaged = 5; -- 0.25s
    player_health = player_health - damage
    player_health = math.max(player_health, 0)
    logger.debug(string.format(
        "Player damaged %s points. Now hp is %s", damage, player_health
    ))
end

health.is_damaged = function ()
    return damaged > 0
end

health.update = function () 
    damaged = damaged - 1
end
