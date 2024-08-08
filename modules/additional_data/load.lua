---@diagnostic disable: lowercase-global
require "voxelcraft:logger/logger"

loader = {}

local fuels = {}
local hardness = {}

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

loader.load_file = function(filename, pack_, loadfunc)
    logger.debug(pack_ .. ":additional_data/" .. filename)
    if file.exists(pack_ .. ":additional_data/" .. filename) then
        loadfunc(
            json.parse(file.read(pack_ .. ":additional_data/" .. filename)),
            pack_
        )
    end
end

loader.load_additional_data = function ()
    logger.info("Loading additional data. Found packs:")
    local packs = pack.get_installed()
    for ind, pack_ in ipairs(packs) do
        logger.info("- " .. pack_)
    end
    for ind, pack_ in ipairs(packs) do
        logger.debug(pack_ .. ":additional_data/fuels.json")
        loader.load_file("fuels.json", pack_, loader.load_fuels)

        logger.debug(pack_ .. ":additional_data/hardness.json")
        loader.load_file("hardness.json", pack_, loader.load_hardness)
    end
end

loader_api = {}

loader_api.get_fuel_by_block = function (str_id)
    return fuels[str_id]
end

loader_api.get_hardness_by_block = function (str_id)
    return hardness[str_id]
end
