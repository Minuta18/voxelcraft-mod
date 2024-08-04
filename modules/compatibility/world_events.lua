require "voxelcraft:logger/logger"
require "voxelcraft:health/init"
require "voxelcraft:compatibility/health_bar"

---@diagnostic disable-next-line: lowercase-global
world_events = {}

world_events.on_world_open = function ()
    logger.debug("voxelcraft.modules.compatibility.on_world_open() called")
    health_bar.setup_bar(20)
    player.set_spawnpoint(0, 0, 60, 0)
end

world_events.on_world_tick = function ()
    health.update()
    health_bar.display_health()
end

