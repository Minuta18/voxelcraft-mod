require "voxelcraft:core"

function on_resize()
    local window_size = gui.get_viewport()
    local x = window_size[1] / 2
    x = x + 50
    local y = window_size[2] - 120
    return x, y
end

hunger_bar.display_hunger = function()
    local hunger_system = hunger.hunger_storage:get(player.get_entity(0))
    local player_hunger = hunger_system:get_hunger()    
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
