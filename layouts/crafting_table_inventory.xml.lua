require "voxelcraft:core"

function check_craft(invid, slot)
    voxelcraft_core.logger.info(string.format(
        "voxelcraft.layouts.crafting_table_inventory.check_craft(" ..
        "invid=%s, slot=%s) called", invid, slot
    ))

    local player_items = {}
    for i = 1, 4, 1 do
        player_items[i] = {
            item.name(inventory.get(invid, i - 1)),
            1
        }
    end
    local result = voxelcraft_core.craft.crafting.check_craft(
        player_items, "voxelcraft:crafting_table_inventory"
    )
    if result ~= nil then
        local item_id, item_count = inventory.get(invid, 4)
        inventory.set(
            invid, 4, item.index(result[1]), result[2])
    else
        inventory.set(invid, 4, item.index("core:empty"), 4)
    end
end

function clear_craft(invid, slot)
    for i = 1, 4, 1 do
        local item_id, item_count = inventory.get(invid, i - 1)
        if item_id == 0 then
            inventory.set(invid, i - 1, "core:empty", 0)
        else
            inventory.set(invid, i - 1, item_id, item_count - 1)
        end
    end
    check_craft(invid, slot)
end
