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
