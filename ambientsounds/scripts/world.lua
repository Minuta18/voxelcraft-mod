local ambients = load_script("ambientsounds:scripts/ambients_player.lua")

function on_world_save()
	ambients.stop_ambients()
end

function on_world_tick(tps)
	ambients.play_ambients()
end