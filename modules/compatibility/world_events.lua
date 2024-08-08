require "voxelcraft:logger/logger"
require "voxelcraft:health/init"
require "voxelcraft:compatibility/health_bar"
require "voxelcraft:crafting/furnace"
require "voxelcraft:additional_data/init"

---@diagnostic disable-next-line: lowercase-global
world_events = {}

world_events.kill_all_breakers = function ()
    for key, entity in pairs(entities.get_all()) do
        logger.debug(entity:def_name())
        if entity:get_defname() == "voxelcraft:breaker" then
            entity:despawn()
        end
    end
end

world_events.on_world_open = function ()
    logger.info("voxelcraft.modules.compatibility.on_world_open() called")
    health_bar.setup_bar(20)
    hunger_bar.setup_bar(20)
    player.set_spawnpoint(0, 0, 60, 0)
    math.randomseed(os.time())
    loader.load_additional_data()
    world_events.kill_all_breakers()
    entities.spawn("voxelcraft:breaker", {0, 0, 0})
end

world_events.on_world_tick = function ()
    health.update()
    hunger.update()
    furnaces.FurnaceStorage.update_all()
    hunger.check_power()
    health_bar.display_health()
    hunger_bar.display_hunger()
    vplayer.noclip_blocker()
end

