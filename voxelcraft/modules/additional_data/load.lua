---@diagnostic disable: lowercase-global
require "voxelcraft:logger/logger"
require "voxelcraft:loot_tables/loot_table"

loader = {}

local fuels = {}
local hardness = {}
local drops = {}
local tools = {}
local food = {}
local loot_tables = {}
local ores = {}

loader.load_fuels = function (table, pack_name)
    local count = 0
    for k, v in pairs(table) do
        if type(v) == "number" then
            fuels[k] = v
            count = count + 1
        end
    end
    logger.info(string.format(
        "Loaded %d fuel recepies from pack %s", count, pack_name
    ))
end

loader.load_ores = function (table, pack_name)
    local count = 0
    for k, v in pairs(table) do
        ores[k] = v
        count = count + 1
    end
    logger.info(string.format(
        "Loaded %d ores from pack %s", count, pack_name
    ))
end

loader.load_hardness = function (table, pack_name)
    local count = 0
    for k, v in pairs(table) do
        if type(v) == "number" then
            hardness[k] = v
            count = count + 1
        end
    end
    logger.info(string.format(
        "Loaded %d hardness values from pack %s", count, pack_name
    ))
end

loader.load_food = function (table, pack_name)
    local count = 0
    for k, v in pairs(table) do
        if type(v) == "number" then
            food[k] = v
            count = count + 1
        end
    end
    logger.info(string.format(
        "Loaded %d food values from pack %s", count, pack_name
    ))
end

loader.load_drops = function (table, pack_name)
    local count = 0
    for k, v in pairs(table) do
        drops[k] = {}
        if type(v) == "string" then
            drops[k].type = "single_drop"
            drops[k].content = v
        elseif type(v) == "table" then
            drops[k].type = "loot_table"
            drops[k].content = v["loot_table"]
        end
        count = count + 1
    end
    logger.info(string.format(
        "Loaded %d drop values from pack %s", count, pack_name
    ))
end

loader.load_tools = function (table, pack_name)
    local count = 0
    for k, v in pairs(table) do
        if tools[k] ~= nil then
            if v["speed"] ~= nil then
                tools[k]["speed"] = v["speed"]
            end
            if tools[k]["materials"] == nil then
                tools[k]["materials"] = {}
            end
            for k1, v1 in pairs(v["materials"]) do
                table.insert(tools[k]["materials"], v1)
            end
        else
            tools[k] = v
        end
        count = count + 1
    end
    logger.info(string.format(
        "Loaded %d tool values from pack %s", count, pack_name
    ))
end

loader.load_file = function(filename, pack_, loadfunc)
    logger.debug(pack_ .. ":additional_data/" .. filename)
    if file.exists(pack_ .. ":additional_data/" .. filename) then
        loadfunc(
            json.parse(file.read(pack_ .. ":additional_data/" .. filename)),
            pack_
        )
    end
end

loader.load_loot_tables = function (pack_name)
    local filename = pack_name .. ":additional_data/loot_tables.json" 
    if file.exists(filename) then
        local count = 0
        local data = json.parse(file.read(filename))

        for ind, loot_table in ipairs(data.loot_tables) do
            local loot_table_filename = 
                pack_name .. ":loot_tables/" .. loot_table .. ".json"
            if file.exists(loot_table_filename) then
                loot_tables[pack_name .. ":" .. loot_table] = json.parse(
                    file.read(loot_table_filename)
                )
                count = count + 1
            end
        end

        logger.info(string.format(
            "Loaded %d loot tables from pack %s", count, pack_name
        ))
    end
end

loader.load_additional_data = function ()
    logger.info("Loading additional data. Found packs:")
    local packs = pack.get_installed()
    for ind, pack_ in ipairs(packs) do
        logger.info("- " .. pack_)
    end
    for ind, pack_ in ipairs(packs) do
        loader.load_loot_tables(pack_)

        logger.debug(pack_ .. ":additional_data/fuels.json")
        loader.load_file("fuels.json", pack_, loader.load_fuels)

        logger.debug(pack_ .. ":additional_data/food.json")
        loader.load_file("food.json", pack_, loader.load_food)

        logger.debug(pack_ .. ":additional_data/hardness.json")
        loader.load_file("hardness.json", pack_, loader.load_hardness)

        logger.debug(pack_ .. ":additional_data/drops.json")
        loader.load_file("drops.json", pack_, loader.load_drops)

        logger.debug(pack_ .. ":additional_data/tools.json")
        loader.load_file("tools.json", pack_, loader.load_tools)

        logger.debug(pack_ .. ":additional_data/ores.json")
        loader.load_file("ores.json", pack_, loader.load_ores)
    end
end

loader_api = {}

loader_api.get_fuel_by_block = function (str_id)
    return fuels[str_id]
end

loader_api.get_hardness_by_block = function (str_id)
    return hardness[str_id]
end

loader_api.get_drops_by_block = function (str_id)
    local drop = drops[str_id]
    if drop == nil then
        return nil
    end
    if drop.type == nil then
        return nil
    elseif drop.type == "single_drop" then
        local result = {}
        result[1] = {drop.content, 1}
        return result
    elseif drop.type == "loot_table" then
        if loot_tables[drop.content] == nil then
            logger.warning(
                "Unable to find loot table " .. drop.content
            )
            logger.debug(dump(loot_tables))
            return {}
        end
        local loot_table = LootTable:new(loot_tables[drop.content])
        local result = loot_table:get_result()
        return result
    end
    return {}
end

loader_api.get_info_by_tool = function (str_id)
    return tools[str_id]
end

loader_api.get_food_by_item = function (str_id)
    return food[str_id]
end

loader_api.get_ores = function ()
    return ores
end
