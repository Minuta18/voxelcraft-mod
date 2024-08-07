require "voxelcraft:logger/logger"

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end
 

loader = {}

local fuels = {}

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

loader.load_additional_data = function ()
    logger.info("Loading additional data. Found packs:")
    local packs = pack.get_installed()
    for ind, pack_ in ipairs(packs) do
        logger.info("- " .. pack_)
    end
    for ind, pack_ in ipairs(packs) do
        logger.debug(pack_ .. ":additional_data/fuels.json")
        if file.exists(pack_ .. ":additional_data/fuels.json") then
            loader.load_fuels(
                json.parse(file.read(pack_ .. ":additional_data/fuels.json")),
                pack_
            )
        end
    end
end

loader_api = {}

loader_api.get_fuel_by_block = function (str_id)
    return fuels[str_id]
end
