require "voxelcraft:core"

function on_use_on_block(x, y, z, playerid, normal)
    local farm_block = block.name(block.get(x, y, z))
    if 
        farm_block == "voxelcraft:farm" or
        farm_block == "voxelcraft:farm_wet"
    then
        local invid, slot = player.get_inventory(playerid)
        local selected_item, selected_item_count = inventory.get(invid, slot)
        inventory.set(invid, slot, selected_item, selected_item_count - 1)
        logger.debug(string.format("%s %s %s %s", x, y + 1, z, block.index("voxelcraft:wheat1")))
        block.set(
            x, y + 1, z, block.index("voxelcraft:wheat1"),
            0
        )
    end
end