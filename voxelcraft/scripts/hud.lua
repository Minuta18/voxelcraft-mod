require "voxelcraft:core"

---@diagnostic disable-next-line: lowercase-global
function on_hud_open(player_id)
    voxelcraft_core.logger.info("opening hud for player %s" ..
        player_id
    )
    voxelcraft_core.compatibility.health_bar.on_health_bar_open(player_id)
    voxelcraft_core.compatibility.hunger_bar.on_hunger_bar_open(player_id)
    hud.open_permanent("voxelcraft:inventory_blocker")
end
