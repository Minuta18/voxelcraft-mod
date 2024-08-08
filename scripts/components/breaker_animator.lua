require "voxelcraft:core"

local tsf = entity.transform
local body = entity.rigidbody
local rig = entity.skeleton
local selected_block = {0, 0, 0}
local progress = 0
local max_progress = 100 -- 5 seconds

function set_texture(texture)
    do
        for i = 1, 6, 1 do
            rig:set_texture(
                "$"..tostring(i - 1), 
                texture
            )
        end
    end
end

set_texture("blocks:breaking1")

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
    if progress == 0 then
        set_texture("blocks:breaking1")
    elseif progress == 1 then
        set_texture("blocks:breaking2")
    elseif progress == 26 then
        set_texture("blocks:breaking3")
    elseif progress == 51 then
        set_texture("blocks:breaking4")
    elseif progress == 76 then
        set_texture("blocks:breaking5")
    end
    if progress == max_progress then
        logger.debug(progress)
        progress = 0
        voxelcraft_core.compatibility.block_operations
            .destroy_block(
                selected_block[1], selected_block[2], selected_block[3]
            )

        find_selected_block()
    end
end
