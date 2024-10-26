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
