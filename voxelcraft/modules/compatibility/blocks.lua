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
    local block_id = block.get(x, y, z)
    if block_id == block.index("core:air") then
        return
    end
    local drop = loader_api.get_drops_by_block(block.name(block_id))
    block.destruct(x, y, z, 0)
    if drop == nil then
        block_operations.spawn_mini_block(block_id, 1, {x, y, z})
        return 
    end
    if drop ~= "none" then
        block_operations.spawn_mini_block(item.index(drop), 1, {x, y, z})
    end
end

block_operations.get_rotation_by_normal = function (normal)
    -- TODO
    local state = 0
    return state
end

block_operations.place_block = function (
    target_block_id, target_block_pos, 
    normal, player_id
)
    local invid, slot = player.get_inventory(player_id)
    local selected_item, selected_item_count = inventory.get(invid, slot)
    if not string.match(item.name(selected_item), ".item$") then
        return
    end

    inventory.set(invid, slot, selected_item, selected_item_count - 1)

    local cords = target_block_pos
    if not block.is_replaceable_at(
        cords[1], cords[2], cords[3]
    ) then
        cords = vec3.add(cords, normal)
    end

    block.place(
        cords[1], cords[2], cords[3],
        block.index(item.name(selected_item):gsub("%.item", "")),
        block_operations.get_rotation_by_normal(), player_id
    )
end

block_operations.interact_block = function (pos)
    local block_id = block.get(pos[1], pos[2], pos[3])
    local block_str_id = block.name(block_id)
    events.emit(block_str_id .. ".interact", pos[1], pos[2], pos[3])
end
