---@diagnostic disable: undefined-global
require "voxelcraft:core"

function on_open(invid)
    voxelcraft_core.logger.info(string.format(
        "voxelcraft.layout.health_bar.on_open(invid=%s) called",
        invid
    ))
end

function on_resize()
    local window_size = gui.get_viewport()
    -- health bar size is 500x40
    return voxelcraft_core.compatibility.health_bar.calc_health_bar_position(
        window_size[1], window_size[2], 500, 40
    )
end

health_bar.display_health = function()
    local player_health = voxelcraft_core.health.get_health()
    local damaged = voxelcraft_core.health.is_damaged()
    for heart = 1, 10, 1 do
        local heart_component = document[string.format("heart%s", heart)]
        if (player_health <= (heart - 1) * 2) then
            heart_component.src = "layouts/heart-empty"
        end
        if (player_health == heart * 2 - 1) then
            heart_component.src = "layouts/heart-part"
        end
        if (player_health >= heart * 2) then
            heart_component.src = "layouts/heart-full"
        end
    end

    for heart = 1, 10, 1 do
        local heart_component = document[string.format(
            "heart-damage%s", heart
        )]
        heart_component.visible = health.is_damaged()
    end
end

health_bar.setup_bar = function(max_hp)
    local main_panel = document.root
    for heart = 1, max_hp / 2, 1 do
        main_panel:add(string.format(
            "<image pos=\"%s, 0\" size=\"40, 40\" interactive=\"false\" " ..
            "src=\"layouts/heart-full\" id=\"heart%s\" />",
            (heart - 1) * 50, heart
        ))
        main_panel:add(string.format(
            "<image pos=\"%s, 0\" size=\"40, 40\" interactive=\"false\" " ..
            "src=\"layouts/heart-damage\" id=\"heart-damage%s\"" ..
            "visible=\"true\" />",
            (heart - 1) * 50, heart
        ))
    end
end
