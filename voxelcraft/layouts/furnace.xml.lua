---@diagnostic disable: lowercase-global
require "voxelcraft:core"
require "voxelcraft:additional_data/init"
require "voxelcraft:crafting/furnace"

local FURNACE_MAX_PROGRESS = 100

function get_avaliable_fuel(invid)
    local item_id, item_count = inventory.get(invid, 1)
    if loader_api.get_fuel_by_block(item.name(item_id)) ~= nil then
        inventory.set(invid, 1, item_id, item_count - 1)
        local fuel = loader_api.get_fuel_by_block(item.name(item_id))
        logger.debug("fuel: " .. fuel)
        return fuel
    end
    return 0
end

function check_craft(invid, slot)
    voxelcraft_core.logger.info(string.format(
        "voxelcraft.layouts.furnace.check_craft(" ..
        "invid=%s, slot=%s) called", invid, slot
    ))
    local player_items = {}
    for i = 1, 1, 1 do
        player_items[i] = {
            item.name(inventory.get(invid, i - 1)),
            1
        }
    end

    local result = voxelcraft_core.craft.crafting.check_craft(
        player_items, "voxelcraft:furnace"
    )

    if result ~= nil then
        start_bake(invid, result)    
    end
end

function clear_craft(invid, craft_result)
    local item_id, item_count = inventory.get(invid, 0)
    if item_id == 0 then
        inventory.set(invid, 0, "core:empty", 0)
    else
        inventory.set(invid, 0, item_id, item_count - 1)
    end
    local _, result_item_count = inventory.get(invid, 2)
    inventory.set(
        invid, 2, item.index(craft_result[1]), 
        result_item_count + craft_result[2]
    )
end

function on_change_callback(invid, action)
    local cooking_indicator = document["prg-icon"]
    if action == "stopped" then
        cooking_indicator.src = "layouts/fire-icon2"
    elseif action == "started" then
        cooking_indicator.src = "layouts/fire-icon"
    end
end

function on_end_callback(invid, craft_result)
    clear_craft(invid, craft_result)
    check_craft(invid, 0)
end

function on_fuel_end_callback(invid)
    local furnace = furnaces.FurnaceStorage.get(invid)
    furnace:add_fuel(get_avaliable_fuel(invid))
    logger.debug("!")
end

function reset_checker(invid, craft_result)
    local res_item_id, res_item_count = inventory.get(invid, 2)
    if res_item_count + craft_result[2] > item.stack_size(res_item_id) then
        logger.debug("!1")
        return true
    end
    if res_item_id ~= item.index(craft_result[1]) and 
       res_item_id ~= 0 then
        logger.debug("!2")
        return true
    end
    local src_item_id, src_item_count = inventory.get(invid, 0)
    if src_item_id == 0 then
        logger.debug("!3")
        return true
    end
end

function start_bake(invid, result)
    local furnace = furnaces.FurnaceStorage.get(invid)
    if furnace == nil then
        furnaces.FurnaceStorage.set(invid,
            furnaces.Furnace:new(
                invid, FURNACE_MAX_PROGRESS, 
                on_change_callback, 
                reset_checker, on_fuel_end_callback,
                on_end_callback
            )
        )
        furnace = furnaces.FurnaceStorage.get(invid)
    end

    furnace:start_bake(result)
end
