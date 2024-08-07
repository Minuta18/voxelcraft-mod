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

crafting.add_craft(function (slot_list)
    if slot_list[1][1] == "voxelcraft:iron_ore.item" then
        return {"voxelcraft:iron", 1}
    end
    return nil
end, "voxelcraft:furnace")

