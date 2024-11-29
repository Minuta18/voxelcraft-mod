-- Modified code from pack "Mob example" by Nekokawa
require "voxelcraft:core"
require "voxelcraft:loot_tables/loot_table"
require "voxelcraft:additional_data/init"

local Fsm = require "entity_fsm:example/mob_fsm"

local fsm = Fsm:new(entity)
local tsf = entity.transform
local eid = entity:get_uid()
local health_system = voxelcraft_core.health.health_storage:get(eid)

if not health_system then
    voxelcraft_core.health.health_storage:set(eid,
        voxelcraft_core.health.VoxelcraftHealthSystem:new(
            eid, 20, 20
        )
    )
    health_system = voxelcraft_core.health.health_storage:get(eid)
end

function on_update()
    fsm:update()

    if health_system:get_health() <= 0 then
        entity:despawn()

        local lt = LootTable:new(loader_api.get_loot_table("voxelcraft:pig"))
        local drops = lt:get_results()

        if drops == nil then return end
        for _, drop in ipairs(drops) do
            if drop[1] ~= "core:empty" then
                block_operations.spawn_mini_block(
                    item.index(drop[1]), drop[2], tsf:get_pos()
                )
            end
        end
    end
end

function on_attacked()
    health_system:damage(4)
end

