require "voxelcraft:additional_data/load"

block_operations = {}

block_operations.spawn_mini_block = function (block_id, item_count, pos)
    local random_dir = {
        math.random() * 2 - 1, 
        1, 
        math.random() * 2 - 1
    }
    local throw_force = vec3.mul(random_dir, random_dir)
    local drop = entities.spawn("base:drop", vec3.add(pos, 0.5), {base__drop={
        id=block_id,
        count=item_count,
    }})
end

block_operations.destroy_block = function (x, y, z)
    if block.is_segment(x, y, z) then
        x, y, z = block.seek_origin(x, y, z)
    end

    local block_id = block.get(x, y, z)
    if block_id == block.index("core:air") then
        return
    end
    local drops = loader_api.get_drops_by_block(block.name(block_id))
    block.destruct(x, y, z, 0)

    if drops == nil then
        logger.debug(string.format("%s, %s", block_id, block.name(block_id)))
        block_operations.spawn_mini_block(
            item.index(block.name(block_id) .. ".item"), 1, {x, y, z}
        ) 
    end

    ---@diagnostic disable-next-line: param-type-mismatch
    if drops == nil then return end
    for _, drop in ipairs(drops) do
        if drop[1] ~= "core:empty" then
            block_operations.spawn_mini_block(
                item.index(drop[1]), drop[2], {x, y, z}
            )            
        end
    end
end

block_operations.get_rotation_by_normal = function (block_id, normal)
    if block.get_rotation_profile(block_id) == "pipe" then
        if normal[1] == 1 then
            return 3
        elseif normal[1] == -1 then
            return 1
        elseif normal[3] == 1 then
            return 0
        elseif normal[3] == -1 then
            return 2
        elseif normal[2] == 1 then
            return 4
        elseif normal[2] == -1 then
            return 5
        end
        return 0
    end
    if block.get_rotation_profile(block_id) == "pane" then
        if normal[1] == 1 then
            return 1
        elseif normal[1] == -1 then
            return 3
        elseif normal[3] == 1 then
            return 0
        elseif normal[3] == -1 then
            return 2
        elseif normal[2] == 1 then
            return 1
        elseif normal[2] == -1 then
            return 1
        end
        return 0
    end
    return 0
end

block_operations.place_block = function (
    target_block_pos, 
    normal, player_id
)
    local invid, slot = player.get_inventory(player_id)
    local selected_item, selected_item_count = inventory.get(invid, slot)
    if not string.match(item.name(selected_item), ".item$") then
        return
    end

    local cords = target_block_pos
    if not block.is_replaceable_at(
        cords[1], cords[2], cords[3]
    ) then
        cords = vec3.add(cords, normal)
    end

    if not block.is_replaceable_at(cords[1], cords[2], cords[3]) then
        return
    end

    inventory.set(invid, slot, selected_item, selected_item_count - 1)
    local block_ind = block.index(item.name(selected_item):gsub("%.item", ""))

    block.place(
        cords[1], cords[2], cords[3], block_ind,
        block_operations.get_rotation_by_normal(block_ind, normal), 
        player_id
    )
end

block_operations.interact_block = function (pos)
    local block_id = block.get(pos[1], pos[2], pos[3])
    local block_str_id = block.name(block_id)
    events.emit(block_str_id .. ".interact", pos[1], pos[2], pos[3])
end

block_operations.raycast_from_camera = function ()
    local pid = 0
    local cam = cameras.get(cameras.name(player.get_camera(pid)))
    local front = cam:get_front()
    local cam_pos = cam:get_pos()
    local ray = block.raycast(cam_pos, front, 11)

    return ray
end