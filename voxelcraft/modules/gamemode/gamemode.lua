require "voxelcraft:logger/logger"

local player_gamemode = "survival"

gamemode = {}

gamemode.get_gamemode = function () 
    return player_gamemode
end

gamemode.set_gamemode = function (gm)
    if player_gamemode ~= "survival" and player_gamemode ~= "creative" then
        logger.error(
            string.format("%s is not a valid gamemode", player_gamemode)
        )
        return "error"
    end 
    player_gamemode = gm
    if gm == "creative" then
        hud.close("voxelcraft:health_bar")
        hud.close("voxelcraft:hunger_bar")
        hud.close("voxelcraft:inventory_blocker")

        for key, entity in pairs(entities.get_all()) do
            local defname = entity:def_name()
            if defname == "voxelcraft:breaker" then
                entity:despawn()
            end
        end
    else
        hud.open_permanent("voxelcraft:health_bar")
        hud.open_permanent("voxelcraft:hunger_bar")    
        hud.open_permanent("voxelcraft:inventory_blocker")
        entities.spawn("voxelcraft:breaker", {0, 0, 0})
    end
    return "ok"
end

console.add_command("gamemode gm:str",
    "Changes the gamemode",
    function (args, kwargs)
        gamemode.set_gamemode(args[1])
    end
)
