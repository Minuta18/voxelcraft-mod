require "voxelcraft:logger/logger"
require "voxelcraft:health/init"
require "voxelcraft:crafting/furnace"
require "voxelcraft:additional_data/init"
require "voxelcraft:compatibility/health_bar"
require "voxelcraft:player/init"
require "voxelcraft:compatibility/saver"
require "voxelcraft:config/config"
require "voxelcraft:compatibility/eat"

local blocks_initialized = false

input.add_callback("player.build", function()
    eat_utils.eat(0)
end)

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

world_events.setup_health_system_for_player = function (
    player_id, max_health, current_health
)
    health_system:register_system(VoxelcraftHealthSystem)
    health_storage:set(player_id, VoxelcraftHealthSystem:new(
        player_id, max_health, current_health
    ))
end

world_events.on_world_open = function ()
    logger.info("voxelcraft.modules.compatibility.on_world_open() called")
    local loaded_data = load_data()

    world_events.setup_health_system_for_player(
        0, vconfig:get("max_health"), loaded_data["health"]
    )

    hunger_bar.setup_bar(vconfig:get("health.max_hunger"))
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
    eat_utils.update()

    if gamemode.get_gamemode() == "survival" then
        vplayer.noclip_blocker()
    end

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

