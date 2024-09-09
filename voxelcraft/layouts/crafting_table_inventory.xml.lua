require "voxelcraft:core"

local previous_craft_count = 0

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
    local item_id, item_count = inventory.get(invid, 4)
    if result ~= nil then
        if item_count > 0 then
            inventory.set(
                invid, 4, item.index(result[1]), item_count)
        else
            inventory.set(
                invid, 4, item.index(result[1]), result[2])
        end

        return true
    else 
        inventory.set(
            invid, 4, "core:empty", 0
        )

        return false
    end
end

function clear_craft(invid, slot)
    if not check_craft(invid, slot) then
        return
    end

    for i = 1, 4, 1 do
        local item_id, item_count = inventory.get(invid, i - 1)
        if item_id == 0 then
            inventory.set(invid, i - 1, "core:empty", 0)
        else
            inventory.set(invid, i - 1, item_id, item_count - 1)
        end
    end

    inventory.set(
        invid, 4, "core:empty", 0
    )
end
