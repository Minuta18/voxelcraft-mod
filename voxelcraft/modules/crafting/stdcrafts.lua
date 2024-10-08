require "voxelcraft:crafting/check_craft"

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "base:wood.item", "core:empty",
    "core:empty", "core:empty", "core:empty",
}, {"base:planks.item", 4}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "base:planks.item", "core:empty",
    "core:empty", "base:planks.item", "core:empty",
}, {"voxelcraft:stick", 4}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "base:planks.item", "base:planks.item",
    "core:empty", "base:planks.item", "base:planks.item",
}, {"voxelcraft:crafting_table.item", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:cobblestone.item", "voxelcraft:cobblestone.item", "voxelcraft:cobblestone.item",
    "voxelcraft:cobblestone.item", "core:empty", "voxelcraft:cobblestone.item",
    "voxelcraft:cobblestone.item", "voxelcraft:cobblestone.item", "voxelcraft:cobblestone.item",
}, {"voxelcraft:furnace.item", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "base:planks.item", "base:planks.item", "base:planks.item",
    "base:planks.item", "core:empty", "base:planks.item",
    "base:planks.item", "base:planks.item", "base:planks.item",
}, {"voxelcraft:chest.item", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "voxelcraft:coal", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"base:torch.item", 4}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "base:planks.item", "base:planks.item", "base:planks.item",
    "core:empty", "voxelcraft:stick", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:wooden_pickaxe", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "base:planks.item", "base:planks.item", "core:empty",
    "base:planks.item", "voxelcraft:stick", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:wooden_axe", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "base:planks.item", "base:planks.item",
    "core:empty", "voxelcraft:stick", "base:planks.item",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:wooden_axe", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "base:planks.item", "base:planks.item", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:wooden_hoe", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "base:planks.item", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:wooden_shovel", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "base:planks.item", "core:empty",
    "core:empty", "base:planks.item", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:wooden_sword", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:cobblestone.item", "voxelcraft:cobblestone.item", "voxelcraft:cobblestone.item",
    "core:empty", "voxelcraft:stick", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:stone_pickaxe", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:cobblestone.item", "voxelcraft:cobblestone.item", "core:empty",
    "voxelcraft:cobblestone.item", "voxelcraft:stick", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:stone_axe", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "voxelcraft:cobblestone.item", "voxelcraft:cobblestone.item",
    "core:empty", "voxelcraft:stick", "voxelcraft:cobblestone.item",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:stone_axe", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:cobblestone.item", "voxelcraft:cobblestone.item", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:stone_hoe", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "voxelcraft:cobblestone.item", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:stone_shovel", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "voxelcraft:cobblestone.item", "core:empty",
    "core:empty", "voxelcraft:cobblestone.item", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:stone_sword", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:iron", "voxelcraft:iron", "voxelcraft:iron",
    "core:empty", "voxelcraft:stick", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:iron_pickaxe", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:iron", "voxelcraft:iron", "core:empty",
    "voxelcraft:iron", "voxelcraft:stick", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:iron_axe", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "voxelcraft:iron", "voxelcraft:iron",
    "core:empty", "voxelcraft:stick", "voxelcraft:iron",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:iron_axe", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:iron", "voxelcraft:iron", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:iron_hoe", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "voxelcraft:iron", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:iron_shovel", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "voxelcraft:iron", "core:empty",
    "core:empty", "voxelcraft:iron", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:iron_sword", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "base:glass.item", "core:empty",
    "base:glass.item", "base:torch.item", "base:glass.item",
    "core:empty", "base:glass.item", "core:empty",
}, {"base:lamp.item", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "base:glass.item", "core:empty",
    "core:empty", "base:torch.item", "core:empty",
    "core:empty", "core:empty", "core:empty",
}, {"base:lightbulb.item", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "base:stone.item", "base:stone.item",
    "core:empty", "base:stone.item", "base:stone.item",
}, {"base:brick.item", 4}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "voxelcraft:iron", "voxelcraft:iron",
    "core:empty", "voxelcraft:iron", "voxelcraft:iron",
}, {"base:metal.item", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "base:planks.item", "base:planks.item", "base:planks.item",
    "base:planks.item", "base:planks.item", "base:planks.item",
}, {"base:pane.item", 3}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "base:metal.item", "core:empty",
    "core:empty", "core:empty", "core:empty",
}, {"voxelcraft:iron", 4}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "base:metal.item", "base:metal.item", "core:empty",
    "base:metal.item", "base:metal.item", "core:empty",
    "core:empty", "core:empty", "core:empty",
}, {"base:rust.item", 4}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "base:rust.item", "core:empty",
    "core:empty", "core:empty", "core:empty",
}, {"base:metal.item", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:iron", "core:empty", "voxelcraft:iron",
    "voxelcraft:iron", "core:empty", "voxelcraft:iron",
    "voxelcraft:iron", "core:empty", "voxelcraft:iron",
}, {"base:pipe.item", 32}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "base:planks.item", "base:planks.item",
    "core:empty", "base:planks.item", "base:planks.item",
    "core:empty", "base:planks.item", "base:planks.item",
}, {"base:wooden_door.item", 3}, "voxelcraft:crafting_table")

-- crafting.add_crafting_table_craft({
--     "core:empty", "core:empty", "core:empty",
--     "core:empty", "core:empty", "core:empty",
--     "core:empty", "core:empty", "core:empty",
-- }, {"core:empty", 0}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "core:empty", "core:empty",
    "voxelcraft:andesite.item", "voxelcraft:andesite.item", "voxelcraft:andesite.item",
}, {"voxelcraft:andesite_slab.item", 6}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "core:empty", "core:empty",
    "voxelcraft:diorite.item", "voxelcraft:diorite.item", "voxelcraft:diorite.item",
}, {"voxelcraft:diorite_slab.item", 6}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "core:empty", "core:empty",
    "voxelcraft:granite.item", "voxelcraft:granite.item", "voxelcraft:granite.item",
}, {"voxelcraft:granite_slab.item", 6}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "voxelcraft:diorite.item", "voxelcraft:diorite.item",
    "core:empty", "voxelcraft:diorite.item", "voxelcraft:diorite.item",
}, {"voxelcraft:polished_diorite.item", 4}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "voxelcraft:andesite.item", "voxelcraft:andesite.item",
    "core:empty", "voxelcraft:andesite.item", "voxelcraft:andesite.item",
}, {"voxelcraft:polished_andesite.item", 4}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "voxelcraft:granite.item", "voxelcraft:granite.item",
    "core:empty", "voxelcraft:granite.item", "voxelcraft:granite.item",
}, {"voxelcraft:polished_granite.item", 4}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "core:empty", "core:empty",
    "voxelcraft:polished_andesite.item", "voxelcraft:polished_andesite.item", "voxelcraft:polished_andesite.item",
}, {"voxelcraft:polished_andesite_slab.item", 6}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "core:empty", "core:empty",
    "voxelcraft:polished_diorite.item", "voxelcraft:polished_diorite.item", "voxelcraft:polished_diorite.item",
}, {"voxelcraft:polished_diorite_slab.item", 6}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "core:empty", "core:empty",
    "voxelcraft:polished_granite.item", "voxelcraft:polished_granite.item", "voxelcraft:polished_granite.item",
}, {"voxelcraft:polished_granite_slab.item", 6}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:andesite.item", "core:empty", "core:empty",
    "voxelcraft:andesite.item", "voxelcraft:andesite.item", "core:empty",
    "voxelcraft:andesite.item", "voxelcraft:andesite.item", "voxelcraft:andesite.item",
}, {"voxelcraft:andesite_stairs.item", 6}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:diorite.item", "core:empty", "core:empty",
    "voxelcraft:diorite.item", "voxelcraft:diorite.item", "core:empty",
    "voxelcraft:diorite.item", "voxelcraft:diorite.item", "voxelcraft:diorite.item",
}, {"voxelcraft:diorite_stairs.item", 6}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:granite.item", "core:empty", "core:empty",
    "voxelcraft:granite.item", "voxelcraft:granite.item", "core:empty",
    "voxelcraft:granite.item", "voxelcraft:granite.item", "voxelcraft:granite.item",
}, {"voxelcraft:granite_stairs.item", 6}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:polished_andesite.item", "core:empty", "core:empty",
    "voxelcraft:polished_andesite.item", "voxelcraft:polished_andesite.item", "core:empty",
    "voxelcraft:polished_andesite.item", "voxelcraft:polished_andesite.item", "voxelcraft:polished_andesite.item",
}, {"voxelcraft:polished_andesite_stairs.item", 6}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:polished_diorite.item", "core:empty", "core:empty",
    "voxelcraft:polished_diorite.item", "voxelcraft:polished_diorite.item", "core:empty",
    "voxelcraft:polished_diorite.item", "voxelcraft:polished_diorite.item", "voxelcraft:polished_diorite.item",
}, {"voxelcraft:polished_diorite_stairs.item", 6}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:polished_granite.item", "core:empty", "core:empty",
    "voxelcraft:polished_granite.item", "voxelcraft:polished_granite.item", "core:empty",
    "voxelcraft:polished_granite.item", "voxelcraft:polished_granite.item", "voxelcraft:polished_granite.item",
}, {"voxelcraft:polished_granite_stairs.item", 6}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "voxelcraft:wheat", "voxelcraft:wheat", "voxelcraft:wheat",
    "core:empty", "core:empty", "core:empty",
}, {"voxelcraft:bread", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "core:empty", "core:empty",
    "voxelcraft:wheat", "voxelcraft:wheat", "voxelcraft:wheat",
}, {"voxelcraft:bread", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:wheat", "voxelcraft:wheat", "voxelcraft:wheat",
    "core:empty", "core:empty", "core:empty",
    "core:empty", "core:empty", "core:empty",
}, {"voxelcraft:bread", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "voxelcraft:wheat", "voxelcraft:wheat", "voxelcraft:wheat",
    "voxelcraft:wheat", "voxelcraft:wheat", "voxelcraft:wheat",
    "voxelcraft:wheat", "voxelcraft:wheat", "voxelcraft:wheat",
}, {"voxelcraft:wheat_block.item", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "voxelcraft:wheat_block.item", "core:empty",
    "core:empty", "core:empty", "core:empty",
}, {"voxelcraft:wheat", 9}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "base:stone.item", "base:stone.item",
    "core:empty", "base:stone.item", "base:stone.item",
    "core:empty", "core:empty", "core:empty",
}, {"voxelcraft:stone_bricks.item", 4}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "voxelcraft:stone_bricks.item", "core:empty",
    "core:empty", "core:empty", "core:empty",
}, {"voxelcraft:stone_bricks_cracked.item", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "voxelcraft:stone_bricks_cracked.item", "core:empty",
    "core:empty", "core:empty", "core:empty",
}, {"voxelcraft:stone_bricks_mossy.item", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "voxelcraft:stone_bricks_mossy.item", "core:empty",
    "core:empty", "core:empty", "core:empty",
}, {"voxelcraft:stone_bricks_special.item", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_craft({
    "core:empty", "core:empty", "core:empty",
    "core:empty", "voxelcraft:stone_bricks_special.item", "core:empty",
    "core:empty", "core:empty", "core:empty",
}, {"voxelcraft:stone_bricks.item", 1}, "voxelcraft:crafting_table")

crafting.add_crafting_table_inventory_craft({
    "base:planks.item", "base:planks.item", 
    "base:planks.item", "base:planks.item",
}, {"voxelcraft:crafting_table.item", 1}, 
"voxelcraft:crafting_table_inventory")

crafting.add_crafting_table_inventory_craft({
    "base:wood.item", "core:empty", 
    "core:empty", "core:empty",
}, {"base:planks.item", 4}, "voxelcraft:crafting_table_inventory")

crafting.add_crafting_table_inventory_craft({
    "core:empty", "base:wood.item", 
    "core:empty", "core:empty",
}, {"base:planks.item", 4}, "voxelcraft:crafting_table_inventory")

crafting.add_crafting_table_inventory_craft({
    "core:empty", "core:empty", 
    "core:empty", "base:wood.item",
}, {"base:planks.item", 4}, "voxelcraft:crafting_table_inventory")

crafting.add_crafting_table_inventory_craft({
    "core:empty", "core:empty", 
    "base:wood.item", "core:empty",
}, {"base:planks.item", 4}, "voxelcraft:crafting_table_inventory")

crafting.add_crafting_table_inventory_craft({
    "base:planks.item", "core:empty", 
    "base:planks.item", "core:empty",
}, {"voxelcraft:stick", 4}, "voxelcraft:crafting_table_inventory")

crafting.add_crafting_table_inventory_craft({
    "core:empty", "base:planks.item", 
    "core:empty", "base:planks.item",
}, {"voxelcraft:stick", 4}, "voxelcraft:crafting_table_inventory")

crafting.add_crafting_table_inventory_craft({
    "voxelcraft:coal", "core:empty", 
    "voxelcraft:stick", "core:empty",
}, {"base:torch.item", 4}, "voxelcraft:crafting_table_inventory")

crafting.add_crafting_table_inventory_craft({
    "core:empty", "voxelcraft:coal", 
    "core:empty", "voxelcraft:stick",
}, {"base:torch.item", 4}, "voxelcraft:crafting_table_inventory")

crafting.add_craft(function (slot_list)
    if slot_list[1][1] == "voxelcraft:iron_ore.item" then
        return {"voxelcraft:iron", 1}
    end
    return nil
end, "voxelcraft:furnace")

crafting.add_craft(function (slot_list)
    if slot_list[1][1] == "base:sand.item" then
        return {"base:glass.item", 1}
    end
    return nil
end, "voxelcraft:furnace")

crafting.add_craft(function (slot_list)
    if slot_list[1][1] == "voxelcraft:cobblestone.item" then
        return {"base:stone.item", 1}
    end
    return nil
end, "voxelcraft:furnace")

crafting.add_craft(function (slot_list)
    if slot_list[1][1] == "base:wood.item" then
        return {"voxelcraft:coal", 1}
    end
    return nil
end, "voxelcraft:furnace")

