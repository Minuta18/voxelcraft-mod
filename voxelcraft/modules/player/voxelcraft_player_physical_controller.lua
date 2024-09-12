require "voxelcraft:utils/utils"
require "voxelcraft:config/config"
require "voxelcraft:logger/logger"
require "voxelcraft:player/base_player_physical_controller"
require "voxelcraft:health/init"

VoxelcraftPlayerPhysicalController = create_class(BasePlayerPhysicalController)

function VoxelcraftPlayerPhysicalController:_block_running()
    local eid = player.get_entity(0)
    local player_entity = entities.get(eid)
    local rigidbody = player_entity.rigidbody

    local player_speed = vec3.length(rigidbody:get_vel())
    local max_speed = 0
    if (player_speed > self.max_speed) then
        max_speed = self.max_speed
    end
    local player_hunger = hunger.hunger_storage:get(eid)
    if (player_hunger:get_hunger() < vconfig:get("health.min_hunger")) then
        max_speed = self.max_hunger_speed
    end
    
    if max_speed ~= 0 then
        -- logger.debug(max_speed)
    end

    if max_speed ~= 0 then
        local new_vel = vec3.normalize(rigidbody:get_vel())
        new_vel = vec3.mul(new_vel, max_speed)
        rigidbody:set_vel({new_vel[1], rigidbody:get_vel()[2], new_vel[3]})
    end
end

function VoxelcraftPlayerPhysicalController:_block_noclip()
    player.set_flight(false)
    player.set_noclip(false)
end

function VoxelcraftPlayerPhysicalController:init(player_id)
    self.player_id = player_id
    self.is_falling = false
    self._is_dead = false
    self.is_menu_opened = false
    self.max_y_point = -1
    self.fall_damage_enabled = vconfig:get("player.physics.fall_damage")
    self.max_speed = vconfig:get("player.physics.max_speed")
    self.max_hunger_speed = vconfig:get("player.physics.max_hunger_speed")

    self.died_pos = {0, 0, 0}
    self.died_rot = {0, 0, 0}

    self.player_hunger = hunger.hunger_storage:get(player.get_entity())
end

function VoxelcraftPlayerPhysicalController:is_fall_damage_enabled()
    return self.fall_damage_enabled
end

function VoxelcraftPlayerPhysicalController:set_fall_damage_enabled(
    fall_damage
)
    self.fall_damage_enabled = fall_damage
end

function VoxelcraftPlayerPhysicalController:drop_inventory()
    if vconfig:get("player.keep_inventory") then return end
    
    local invid, slot = player.get_inventory(self.player_id)
    for selected_slot = 0, 39, 1 do
        local item_id, item_count = inventory.get(invid, selected_slot)
        if item_id ~= 0 then
            inventory.set(invid, selected_slot, item_id, 0)

            local random_direction = {
                math.random() * 2 - 1,
                1,
                math.random() * 2 - 1,
            }
            local player_velocity = {player.get_vel(self.player_id)}
            local player_position = vec3.add(
                {player.get_pos(self.player_id)}, {0, 0.7, 0}
            )
            local drop = entities.spawn("base:drop", player_position, {
                base__drop={
                    id=item_id,
                    count=item_count,
                }
            })
            local drop_velocity = player_velocity
            drop.rigidbody:set_vel(drop_velocity)
        end
    end
end 

function VoxelcraftPlayerPhysicalController:apply_fall_damage(fallen_blocks)
    logger.debug(string.format(
        "Player has fallen from %s blocks", math.floor(fallen_blocks)
    ))
    if not self.fall_damage_enabled then return end
    
    local eid = player.get_entity(self.player_id)
    local player_health = health.health_storage:get(eid)
    local player_hunger = hunger.hunger_storage:get(eid)

    if (math.floor(fallen_blocks) > 
        vconfig:get("player.physics.fall_damage_min_blocks")) then
        if player_health == nil then
            logger.warning(string.format(
                "Detected entity without health: eid=%s", eid
            ))
            return
        end
        if player_hunger == nil then
            logger.warning(string.format(
                "Detected entity without hunger: eid=%s", eid
            ))
            return
        end

        player_hunger:reset_timer()
        player_health:damage((math.floor(fallen_blocks) - vconfig:get(
            "player.physics.fall_damage_min_blocks"
        )) * vconfig:get(
            "player.physics.fall_damage_modifier"
        ))
    end
end

function VoxelcraftPlayerPhysicalController:is_dead()
    return self._is_dead
end

function VoxelcraftPlayerPhysicalController:kill()
    self._is_dead = true
    hud.show_overlay("voxelcraft:died_menu", false)
    hud.open_permanent("voxelcraft:died_menu")
    self.is_menu_opened = true
    self.died_pos[1], self.died_pos[2], self.died_pos[3] = player.get_pos()
    self.died_rot[1], self.died_rot[2], self.died_rot[3] = player.get_rot()
    if not vconfig:get("player:keep_inventory") then
        self:drop_inventory()
    end
end

function VoxelcraftPlayerPhysicalController:respawn()
    self:teleport_to_spawnpoint()
    hud.close("voxelcraft:died_menu")
    hud.resume()
    self.is_menu_opened = false
    self._is_dead = false

    local eid = player.get_entity(self.player_id)
    local player_health = health.health_storage:get(eid)
    local player_hunger = hunger.hunger_storage:get(eid)
    player_health:set_health(vconfig:get("health.max_health"))
    player_hunger:set_hunger(vconfig:get("health.max_hunger"))
end

function VoxelcraftPlayerPhysicalController:choose_spawnpoint(x, z)
    for new_y = 255, 1, -1 do
        local block_id = block.get(x, new_y, z)
        if block_id ~= block.index("core:air") and
            block_id ~= block.index("base:water") and
            block_id ~= -1 
        then
            player.set_spawnpoint(self.player_id, x, new_y + 2, z)
            player.set_pos(x, new_y + 2, z)
            break
        end
    end
end

function VoxelcraftPlayerPhysicalController:teleport_to_spawnpoint()
    local x, y, z = player.get_spawnpoint(self.player_id)
    player.set_pos(self.player_id, x, y, z)
end

function VoxelcraftPlayerPhysicalController:set_max_speed(speed)
    self.max_speed = speed
end

function VoxelcraftPlayerPhysicalController:get_max_speed()
    return self.max_speed
end

function VoxelcraftPlayerPhysicalController:set_max_hunger_speed(speed)
    self.max_hunger_speed = speed
end

function VoxelcraftPlayerPhysicalController:get_max_hunger_speed()
    return self.max_hunger_speed
end

function VoxelcraftPlayerPhysicalController:update()
    local eid = player.get_entity()
    local player_health = health.health_storage:get(eid)
    local player_hunger = hunger.hunger_storage:get(eid)

    if gamemode.get_gamemode() == "survival" then
        if player_health ~= nil then
            if player_health:get_health() <= 0 and not self.is_menu_opened then
                self:kill()
            end
        end

        local player_entity = entities.get(player.get_entity())

        if player_entity ~= nil then
            local is_grounded = player_entity.rigidbody:is_grounded()
            local pos = player_entity.transform:get_pos()

            if self.is_falling then
                if is_grounded then
                    self:apply_fall_damage(self.max_y_point - pos[2] + 1)
                end
            end

            if not is_grounded and not player.is_flight() then
                self.is_falling = true
                self.max_y_point = math.max(pos[2], self.max_y_point)
            else
                self.is_falling = false
                self.max_y_point = -1
            end
        end

        if not self:is_dead() then
            if player_hunger ~= nil then
                player_hunger:update_health()
            end
                -- self.player_hunger:update_health()
        end
    end
end

function VoxelcraftPlayerPhysicalController:render_update()
    if self._is_dead then
        player.set_pos(0, self.died_pos[1], self.died_pos[2], self.died_pos[3])
        player.set_rot(0, self.died_rot[1], self.died_rot[2], self.died_rot[3])
    end

    if gamemode.get_gamemode() == "survival" then
        self:_block_noclip()
        self:_block_running()
    end
end
