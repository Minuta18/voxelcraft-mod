require "voxelcraft:logger/logger"
require "voxelcraft:gamemode/gamemode"
require "voxelcraft:config/config"
require "voxelcraft:health/init"
require "voxelcraft:utils/utils"

local is_falling = false
local max_y_point = -1
local is_dead = false
local menu_opened = false
local max_hunger_speed = 2;

local died_pos = {0, 0, 0}
local died_rot = {0, 0, 0}

vplayer = {}

vplayer.drop_inventory = function()
    -- Copied from base package
    local pid = hud.get_player()
    local invid, slot = player.get_inventory(pid)
    for selected_slot = 0, 39, 1 do
        local itemid, itemcount = inventory.get(invid, selected_slot)
        if itemid ~= 0 then
            inventory.set(invid, selected_slot, itemid, 0)

            local random_dir = {
                math.random() * 2 - 1, 
                1, 
                math.random() * 2 - 1
            }
            local pvel = {player.get_vel(pid)}
            local ppos = vec3.add({player.get_pos(pid)}, {0, 0.7, 0})
            logger.debug(vec3.tostring(random_dir))
            local throw_force = vec3.mul(random_dir, random_dir)
            local drop = entities.spawn("base:drop", ppos, {base__drop={
                id=itemid,
                count=itemcount,
            }})
            local velocity = vec3.add(throw_force, vec3.add(pvel, {1, 1, 1}))
            drop.rigidbody:set_vel(velocity)
        end
    end
end

vplayer.apply_fall_damage = function (fall_blocks, player_id)
    voxelcraft_core.logger.debug(string.format(
        "Player felt from %s blocks", fall_blocks
    ))

    local eid = player.get_entity(player_id)
    local player_health = health.health_storage:get(eid)
    local player_hunger = hunger.hunger_storage:get(eid)

    if (vconfig:get("player.fall_damage.enabled")) then
        if (fall_blocks > vconfig:get("player.fall_damage.min_blocks")) then
            if player_health == nil then
                logger.warning(string.format(
                    "Detected entity without health: eid=%s", eid
                ))
                return
            end
            player_hunger:reset_timer()
            player_health:damage(fall_blocks - 3)
        end
    end
end

vplayer.is_dead = function ()
    return is_dead
end

vplayer.kill = function ()
    is_dead = true
    hud.show_overlay("voxelcraft:died_menu", false)
    hud.open_permanent("voxelcraft:died_menu")
    menu_opened = true
    died_pos[1], died_pos[2], died_pos[3] = player.get_pos()
    died_rot[1], died_rot[2], died_rot[3] = player.get_rot()
    vplayer.drop_inventory()
end

vplayer.choose_spawn = function ()
    local x, y, z = player.get_spawnpoint(0)
    for new_y = 255, 1, -1 do
        local block_id = block.get(x, new_y, z)
        if block_id ~= block.index("core:air") and 
            block_id ~= block.index("base:water") and
            block_id ~= -1
        then
            logger.debug(block.get(x, new_y, z))
            logger.debug(block.index("core:air"))
            player.set_spawnpoint(0, x, new_y + 1, z)
            break
        end
    end
end

vplayer.tp_to_spawn = function ()
    local x, y, z = player.get_spawnpoint(0)
    player.set_pos(0, x, y, z)
end

vplayer.respawn = function ()
    vplayer.tp_to_spawn()
    hud.close("voxelcraft:died_menu")
    hud.resume()
    menu_opened = false
    is_dead = false

    local eid = player.get_entity(0)
    local player_health = health.health_storage:get(eid)
    local player_hunger = hunger.hunger_storage:get(eid)
    player_health:set_health(player_health)
    player_hunger:set_hunger(player_hunger)
end

vplayer.block_running = function ()
    -- TODO: idk why does it doesnt work
    local entity_id = player.get_entity(0)
    local player_entity = entities.get(entity_id)
    local rigidbody = player_entity.rigidbody

    if (vec3.length(rigidbody:get_vel()) > max_hunger_speed) then
        local new_vel = vec3.normalize(rigidbody:get_vel())
        new_vel = vec3.mul(new_vel, max_hunger_speed)
        rigidbody.set_vel(new_vel)
    end
end

vplayer.noclip_blocker = function ()
    player.set_flight(false)
    player.set_noclip(false)
end

vplayer.update = function (pos, is_grounded, is_flight)
    local eid = player.get_entity(0)
    local player_health = health.health_storage:get(eid)
    local player_hunger = hunger.hunger_storage:get(eid)

    if gamemode.get_gamemode() == "survival" then
        if player_health ~= nil then
            if player_health:get_health() == 0 and not menu_opened then
                vplayer.kill()
            end
        end
        if is_dead then
            player.set_pos(0, died_pos[1], died_pos[2], died_pos[3])
            player.set_rot(0, died_rot[1], died_rot[2], died_rot[3])
        end

        if player_hunger:get_hunger() <= 6 then
            vplayer.block_running()
        end

        if is_falling then
            if is_grounded then
                vplayer.apply_fall_damage(math.floor(
                    max_y_point - pos[2] + 1
                ))
            end
        end
        if not is_grounded and not is_flight then
            is_falling = true
            max_y_point = math.max(pos[2], max_y_point)
        else
            is_falling = false
            max_y_point = -1
        end
    end
end
