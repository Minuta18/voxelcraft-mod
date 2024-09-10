require "voxelcraft:core"

function check_craft(invid, slot)
    voxelcraft_core.logger.info(string.format(
        "voxelcraft.layouts.crafting_table.check_craft(" ..
        "invid=%s, slot=%s) called", invid, slot
    ))

    local player_items = {}
    for i = 1, 9, 1 do
        player_items[i] = {
            item.name(inventory.get(invid, i - 1)),
            1
        }
    end
    local result = voxelcraft_core.craft.crafting.check_craft(
        player_items, "voxelcraft:crafting_table"
    )
    if result ~= nil then
        local item_id, item_count = inventory.get(invid, 9)
        inventory.set(
            invid, 9, item.index(result[1]), result[2])
    else
        inventory.set(invid, 9, item.index("core:empty"), 0)
    end
end

function clear_craft(invid, slot)
    for i = 1, 9, 1 do
        local item_id, item_count = inventory.get(invid, i - 1)
        if item_id == 0 then
            inventory.set(invid, i - 1, "core:empty", 0)
        else
            inventory.set(invid, i - 1, item_id, item_count - 1)
        end
    end
    check_craft(invid, slot)
end

---@diagnostic disable-next-line: lowercase-global
function craft_all(invid, slot)
    local player_items = {}
    local result = 0

    while result ~= nil do
        for i = 1, 9, 1 do
            player_items[i] = {
                item.name(inventory.get(invid, i - 1)),
                1
            }
        end
        result = voxelcraft_core.craft.crafting.check_craft(
            player_items, "voxelcraft:crafting_table"
        )
        if result == nil then return end
    
        local left = inventory.add(
            player.get_inventory(0), item.index(result[1]), result[2]
        )

        for i = 1, left, 1 do
            voxelcraft_core.compatibility.block_operations.spawn_mini_block(
                item.index(result[1]),
                1, player.get_pos() 
            )
        end

        for i = 1, 9, 1 do
            local item_id, item_count = inventory.get(invid, i - 1)
            if item_id == 0 then
                inventory.set(invid, i - 1, item.index("core:empty"), 0)
            else
                inventory.set(invid, i - 1, item_id, item_count - 1)
            end
        end
    end
end
