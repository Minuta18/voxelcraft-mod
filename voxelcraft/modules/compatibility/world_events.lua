require "voxelcraft:logger/logger"
require "voxelcraft:health/init"
require "voxelcraft:crafting/furnace"
require "voxelcraft:additional_data/init"
require "voxelcraft:compatibility/health_bar"
require "voxelcraft:player/init"
require "voxelcraft:compatibility/saver"
require "voxelcraft:config/config"

local blocks_initialized = false
local hud_opened = false

---@diagnostic disable-next-line: lowercase-global
world_events = {}

world_events.kill_all_breakers = function ()
    for key, entity in pairs(entities.get_all()) do
        logger.debug(entity:def_name())
        if entity:def_name() == "voxelcraft:breaker" then
            entity:despawn()
        end
    end
end

world_events.on_world_open = function ()
    logger.info("voxelcraft.modules.compatibility.on_world_open() called")

    local loaded_data = load_data()
    health_bar.setup_bar(vconfig:get("health.max_health"))
    hunger_bar.setup_bar(vconfig:get("health.max_hunger"))
    health.set_health(loaded_data["health"])
    hunger.set_hunger(loaded_data["hunger"])
    math.randomseed(os.time())
    loader.load_additional_data()
    world_events.kill_all_breakers()
    entities.spawn("voxelcraft:breaker", {0, 0, 0})

    if loaded_data["first_launch"] then
        vplayer.choose_spawn()
        vplayer.tp_to_spawn()
    end
end

world_events.on_world_tick = function ()
    if not blocks_initialized then
        logger.debug("!!")
        block.set(1, 5, 1, block.index("voxelcraft:mini_crafter"), 0)
        blocks_initialized = true
    end

    health.update()
    hunger.update()
    furnaces.FurnaceStorage.update_all()
    hunger.check_power()
    health_bar.display_health()
    hunger_bar.display_hunger()
    vplayer.noclip_blocker()

    if input.is_pressed("key:z") then
        hud.open_block(1, 5, 1)
    end
end

world_events.on_world_save = function ()
    local data = {}
    data["health"] = health.get_health()
    data["hunger"] = hunger.get_hunger()
    data["first_launch"] = false
    save_data(data)
end

