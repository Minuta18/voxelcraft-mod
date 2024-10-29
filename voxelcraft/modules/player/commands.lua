require "voxelcraft:health/init"

console.add_command("kill player_id:int",
    "Kills the player",
    function (player_id)
        local player_health = health.health_storage:get(
            player.get_entity(player_id)
        )
        if player_health ~= nil then
            player_health:set_health(0)
        end
    end
)

console.add_command(
    "entity.spawn name:str", 
    "Spawns entity", 
    function (name)
        local x, y, z = player.get_pos(0)
        entities.spawn(name[1], {x, y, z})
    end
)

console.add_command(
    "genmap size_x:int size_z:int scale:int octaves:int filename:str", 
    "Generates map for debug",
    function (args)
        local map = Heightmap(args[1], args[2])
        map.noiseSeed = SEED
        map:cellnoise({0, 0}, args[3], args[4])
        map:dump(string.format("export:%s", args[5]))
    end
)
