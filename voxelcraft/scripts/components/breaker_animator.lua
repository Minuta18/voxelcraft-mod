---@diagnostic disable: lowercase-global
require "voxelcraft:core"
require "voxelcraft:additional_data/init"

local tsf = entity.transform
local body = entity.rigidbody
local rig = entity.skeleton
local selected_block = {0, 0, 0}
local progress = 0

MAX_DISTANCE = 11;

function set_texture(texture)
    for i = 1, 6, 1 do
        rig:set_texture(
            "$"..tostring(i - 1), 
            texture
        )
    end
end

function find_selected_block()
    local x, y, z = player.get_selected_block(0)
    if x ~= nil then
        tsf:set_pos({x + 0.5, y + 0.5, z + 0.5})    
        selected_block = {x, y, z}    
    end
end

function on_render()
    find_selected_block()
end

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function on_update()
    -- TODO: refactor this function
    local selected_block_id = block.name(block.get(
        selected_block[1], selected_block[2], selected_block[3])
    )
    local current_block_max_progress = loader_api.get_hardness_by_block(
        selected_block_id
    )
    if current_block_max_progress == nil then
        current_block_max_progress = -1
    end

    local invid, slot = player.get_inventory(0)
    local sel_item, item_count = inventory.get(invid, slot)

    local info = loader_api.get_info_by_tool(item.name(sel_item))
    local progress_speed = 1

    if info ~= nil then
        if has_value(info.materials, block.material(selected_block_id)) then
            current_block_max_progress = 
                current_block_max_progress / info.speed
        end
    end

    if input.is_pressed("mouse:left") then
        progress = progress + progress_speed
    else
        progress = 0
    end

    if current_block_max_progress == nil then
        current_block_max_progress = -1
    end
    if progress == 0 then
        set_texture("blocks:breaking1")
    elseif progress == 1 then
        set_texture("blocks:breaking2")
    elseif progress == math.floor(current_block_max_progress / 4) + 1 then
        set_texture("blocks:breaking3")
    elseif progress == math.floor(current_block_max_progress / 2) + 1 then
        set_texture("blocks:breaking4")
    elseif progress == 
        current_block_max_progress - 
        math.floor(current_block_max_progress / 4) + 1 
    then
        set_texture("blocks:breaking5")
    end

    if progress >= current_block_max_progress and 
        current_block_max_progress > -2 then
        progress = 0
        voxelcraft_core.compatibility.block_operations
            .destroy_block(
                selected_block[1], selected_block[2], selected_block[3]
            )
        selected_block = {0, 0, 0}
        tsf:set_pos({0.5, 0.5, 0.5}) 
    end
end

function on_used()
    local pid = 0
    local cam = cameras.get(cameras.name(player.get_camera(pid)))
    local front = cam:get_front()
    local cam_pos = cam:get_pos()
    local ray = block.raycast(cam_pos, front, MAX_DISTANCE)

    if not ray then
        return 
    end

    local iendpoint = ray.iendpoint
    local normal = ray.normal
    local block = ray.block

    voxelcraft_core.compatibility.block_operations
        .interact_block(iendpoint)

    voxelcraft_core.compatibility.block_operations
        .place_block(iendpoint, normal, pid)
end
