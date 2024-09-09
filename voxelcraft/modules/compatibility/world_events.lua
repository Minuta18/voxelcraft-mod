require "voxelcraft:logger/logger"
require "voxelcraft:health/init"
require "voxelcraft:crafting/furnace"
require "voxelcraft:additional_data/init"
require "voxelcraft:compatibility/health_bar"
require "voxelcraft:player/init"
require "voxelcraft:compatibility/saver"
require "voxelcraft:config/config"
require "voxelcraft:compatibility/eat"
require "voxelcraft:compatibility/player_connect_handler"
require "voxelcraft:player/init"

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

world_events.intialize = function ()
    logger.info("voxelcraft.modules.compatibility.on_world_open() called")
    health.health_system:register_system(VoxelcraftHealthSystem)
    hunger.hunger_system:register_system(VoxelcraftHungerSystem)
    player_controller.player_controller_system:register_system(
        player_controller.VoxelcraftPlayerPhysicalController
    )

    player_connect_handler:on_player_connect(0)

    math.randomseed(os.time())
    world_events.kill_all_breakers()
    entities.spawn("voxelcraft:breaker", {0, 0, 0})
    loader.load_additional_data()

    health_bar.setup_bar(vconfig:get("health.max_health"))
    hunger_bar.setup_bar(vconfig:get("health.max_hunger"))
    -- hunger.set_hunger(data["hunger"])
end

world_events.update = function ()
    if not blocks_initialized then
        block.set(1, 5, 1, block.index("voxelcraft:mini_crafter"), 0)
        blocks_initialized = true
    end

    health.health_storage:update_all()
    hunger.hunger_storage:update_all()
    player_controller.player_controller_storage:update_all()
    furnaces.FurnaceStorage.update_all()
    eat_utils.update()

    health_bar.display_health()
    hunger_bar.display_hunger()
    
    if input.is_pressed("key:z") then
        hud.open_block(1, 5, 1)
    end
end

world_events.on_world_save = function ()
    -- local data = {}
    -- data["health"] = health.get_health()
    -- data["hunger"] = hunger.get_hunger()
    -- data["first_launch"] = false
    -- save_data(data)
end

