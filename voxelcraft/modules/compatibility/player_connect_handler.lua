require "voxelcraft:utils/utils"
require "voxelcraft:utils/meta"
require "voxelcraft:health/init"
require "voxelcraft:player/init"
require "voxelcraft:compatibility/saver"

PlayerConnectHandler = create_class()

function PlayerConnectHandler:init()
    self.connections = {}
    self.on_connect_handlers = {}
end

function PlayerConnectHandler:get_current_player_count()
    return #self.connections
end

function PlayerConnectHandler:register_on_connect_handler(handler)
    table.insert(self.on_connect_handlers, handler)
end

function PlayerConnectHandler:on_player_connect(player_id)
    local eid = player.get_entity(player_id)

    local hunger_storage = hunger.hunger_storage:get(eid)
    logger.debug(dump(hunger.hunger_storage))

    if hunger_storage == nil then
        hunger.hunger_storage:set(
            eid, hunger.hunger_system:get_system():new(
                player_id, vconfig:get("health.max_hunger")
            )
        )
        logger.info(string.format(
            "HungerSystem initialized for player %s", player_id
        ))
    end

    local health_storage = health.health_storage:get(eid)

    if health_storage == nil then
        health.health_storage:set(
            eid, health.health_system:get_system():new(
                eid, 
                vconfig:get("health.max_health"), 
                vconfig:get("health.max_health")
            )
        )
      
        logger.info(string.format(
            "HealthSystem initialized for player %s", player_id
        ))
    end

    player_controller.player_controller_storage:set(
        eid, player_controller.player_controller_system:get_system():new(
            player_id
        )
    )
    local player_cnt = player_controller.player_controller_storage:get(
        eid
    ) 
    logger.info(string.format(
        "PlayerController initialized for player %s", player_id
    ))


    if voxelcraft_meta.first_run then
        player_cnt:choose_spawnpoint()
        player_cnt:teleport_to_spawnpoint()
    end

    -- TODO: why doesnt it works?
    -- logger.debug(dump(self.on_connect_handlers))
    -- for ind, handler in self.on_connect_handlers do
    --     handler(player_id)
    -- end
end

---@diagnostic disable-next-line: lowercase-global
player_connect_handler = PlayerConnectHandler:new()
