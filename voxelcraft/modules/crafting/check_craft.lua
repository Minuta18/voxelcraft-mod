require "voxelcraft:logger/logger"

local crafts = {}

crafting = {}

crafting.add_craft = function (check_function, craft_type)
    crafts[#crafts + 1] = {
        check_function,
        craft_type,
    }
end

-- Works only for crafting table!
crafting.add_crafting_table_craft = function (table, result, craft_type)
    crafting.add_craft(function(slot_list)
        for i = 0, 2, 1 do
            for j = 1, 3, 1 do
                if table[i * 3 + j] ~= slot_list[(2 - i) * 3 + j][1] then
                    return nil
                end
            end
        end
        return result
    end, craft_type)
end

crafting.add_crafting_table_inventory_craft = 
function (table, result, craft_type)
    crafting.add_craft(function(slot_list)
        for i = 0, 1, 1 do
            for j = 1, 2, 1 do
                if table[i * 2 + j] ~= slot_list[(1 - i) * 2 + j][1] then
                    return nil
                end
            end
        end
        return result
    end, craft_type)
end

crafting.check_craft = function (slot_list, crafter_type)
    for _, craft in ipairs(crafts) do
        if craft[2] == crafter_type then
            local res = craft[1](slot_list)
            if res ~= nil then
                return res
            end
        end
    end
end
