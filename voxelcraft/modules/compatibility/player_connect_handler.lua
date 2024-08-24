require "voxelcraft:utils/utils"
require "voxelcraft:health/init"
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
    local player_health = health.health_storage:get(eid) 
    if not player_health then
        local player_data = get_player_data(player_id)
        if player_data == nil then
            health.health_storage:set(
                eid, health.health_system:get_system():new(
                    eid, 
                    vconfig:get("health.max_health"), 
                    vconfig:get("health.max_health")
                )
            )

            vplayer.choose_spawn()
            vplayer.tp_to_spawn()
        else
            health.health_storage:set(
                eid, health.health_system:get_system():new(
                    eid, 
                    player_data.health, 
                    player_data.hunger
                )
            )
            
            if player_data.first_launch then
                vplayer.choose_spawn()
                vplayer.tp_to_spawn()
            end
        end
    end 

    -- TODO: why doesnt it works?
    -- logger.debug(dump(self.on_connect_handlers))
    -- for ind, handler in self.on_connect_handlers do
    --     handler(player_id)
    -- end
end

---@diagnostic disable-next-line: lowercase-global
player_connect_handler = PlayerConnectHandler:new()
