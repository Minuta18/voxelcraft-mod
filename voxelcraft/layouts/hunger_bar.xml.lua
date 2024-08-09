require "voxelcraft:core"

function on_open(invid)
    voxelcraft_core.logger.info(string.format(
        "voxelcraft.layout.hunger_bar.on_open(invid=%s) called",
        invid
    ))
end

function on_resize()
    local window_size = gui.get_viewport()
    -- hunger bar size is 500x40
    return voxelcraft_core.compatibility.hunger_bar.calc_hunger_bar_position(
        window_size[1], window_size[2], 500, 40
    )
end

hunger_bar.display_hunger = function()
    local player_hunger = voxelcraft_core.hunger.get_hunger()
    for hg = 10, 1, -1 do
        local hg_component = document[string.format("hunger%s", hg)]
        if (player_hunger <= (hg - 1) * 2) then
            hg_component.src = "layouts/hunger-empty"
        end
        if (player_hunger == hg * 2 - 1) then
            hg_component.src = "layouts/hunger-part"
        end
        if (player_hunger >= hg * 2) then
            hg_component.src = "layouts/hunger-full"
        end
    end
end

hunger_bar.setup_bar = function(max_hunger)
    local main_panel = document.root
    for hunger = max_hunger / 2, 1, -1 do
        main_panel:add(string.format(
            "<image pos=\"%s, 0\" size=\"40, 40\" interactive=\"false\" " ..
            "src=\"layouts/hg-full\" id=\"hunger%s\" />",
            (hunger - 1) * 50, (max_hunger / 2 - hunger + 1)
        ))
    end
end
