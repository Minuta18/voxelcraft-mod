require "voxelcraft:logger/logger"

local is_falling = false
local max_y_point = -1
local is_dead = false
local menu_opened = false

local died_pos = {0, 0, 0}
local died_rot = {0, 0, 0}

vplayer = {}

vplayer.apply_fall_damage = function (fall_blocks)
    voxelcraft_core.logger.debug(string.format(
        "Player felt from %s blocks", fall_blocks
    ))
    if (fall_blocks > 4) then
        voxelcraft_core.health.damage(fall_blocks - 4)
    end
end

vplayer.is_dead = function ()
    return is_dead
end

vplayer.kill = function ()
    is_dead = true
    hud.open_permanent("voxelcraft:died_menu")
    menu_opened = true
    died_pos[1], died_pos[2], died_pos[3] = player.get_pos()
    died_rot[1], died_rot[2], died_rot[3] = player.get_rot()
end

vplayer.respawn = function ()
    vplayer.tp_to_spawn()
    hud.close("voxelcraft:died_menu")
    menu_opened = false
    is_dead = false
    voxelcraft_core.health.set_health(20)
end

vplayer.update = function (pos, is_grounded, is_flight)
    if not is_grounded and not is_flight then
        is_falling = true
        max_y_point = math.max(pos[2], max_y_point)
        return
    end
    if is_falling then
        if is_grounded then
            vplayer.apply_fall_damage(math.ceil(
                max_y_point - pos[2] + 1
            ))
        end
    end
    is_falling = false
    max_y_point = -1

    if voxelcraft_core.health.get_health() == 0 and not menu_opened then
        vplayer.kill()
    end
    if is_dead then
        player.set_pos(0, died_pos[1], died_pos[2], died_pos[3])
        player.set_rot(0, died_rot[1], died_rot[2], died_rot[3])
    end
end
