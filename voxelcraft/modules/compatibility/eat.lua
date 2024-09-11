---@diagnostic disable: cast-local-type
require "voxelcraft:additional_data/init"
require "voxelcraft:health/init"
require "voxelcraft:config/config"

---@diagnostic disable-next-line: lowercase-global
eat_utils = {}

local eat_cooldown = 0

eat_utils.eat = function (pid)
    local invid, slot = player.get_inventory(pid)
    local item_id, item_count = inventory.get(invid, slot)
    local item_str_id = item.name(item_id)
    local food = loader_api.get_food_by_item(item_str_id)
    if food == nil then
        return
    end
    if eat_cooldown ~= 0 then
        return 
    end

    local hunger_system = hunger.hunger_storage:get(
        player.get_entity(pid)
    )
    hunger_system:set_hunger(hunger_system:get_hunger() + food)

    inventory.set(invid, slot, item_id, item_count - 1)
    eat_cooldown = vconfig:get(
        "health.eating_cooldown"
    )
end

eat_utils.update = function ()
    if eat_cooldown > 0 then
        eat_cooldown = eat_cooldown - 1
    end
end
