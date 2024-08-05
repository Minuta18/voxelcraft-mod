require "voxelcraft:health/init"

console.add_command("kill",
    "Kills the player",
    function ()
        health.set_health(0)
    end
)
