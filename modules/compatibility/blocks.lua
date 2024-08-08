block_operations = {}

block_operations.spawn_mini_block = function (block_id, item_count, pos)
    local random_dir = {
        math.random() * 2 - 1, 
        1, 
        math.random() * 2 - 1
    }
    local throw_force = vec3.mul(random_dir, random_dir)
    local drop = entities.spawn("base:drop", pos, {base__drop={
        id=block_id,
        count=item_count,
    }})
    local velocity = vec3.add(throw_force, {0, 1, 0})
    drop.rigidbody:set_vel(velocity)
end

block_operations.destroy_block = function (x, y, z)
    local block_id = block.get(x, y, z)
    if block_id == block.index("core:air") then
        return
    end
    block.destruct(x, y, z, 0)
    block_operations.spawn_mini_block(block_id, 1, {x, y, z})
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
    -- cords[1] = math.floor(cords[1])
    -- cords[2] = math.floor(cords[2])
    -- cords[3] = math.floor(cords[3])

    block.place(
        cords[1], cords[2], cords[3],
        block.index(item.name(selected_item):gsub("%.item", "")),
        0, player_id
    )
end

