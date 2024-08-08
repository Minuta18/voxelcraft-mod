---@diagnostic disable: lowercase-global
require "voxelcraft:core"
require "voxelcraft:additional_data/init"

local tsf = entity.transform
local body = entity.rigidbody
local rig = entity.skeleton
local selected_block = {0, 0, 0}
local progress = 0

MAX_DISTANCE = 11;

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

function on_update()
    if input.is_pressed("mouse:left") then
        progress = progress + 1
    else
        progress = 0
    end
    local selected_block_id = block.name(block.get(
        selected_block[1], selected_block[2], selected_block[3])
    )
    local current_block_max_progress = loader_api.get_hardness_by_block(
        selected_block_id
    )
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
    if progress == current_block_max_progress then
        progress = 0
        voxelcraft_core.compatibility.block_operations
            .destroy_block(
                selected_block[1], selected_block[2], selected_block[3]
            )

        find_selected_block()
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
        .place_block(block, iendpoint, normal, pid)
end
