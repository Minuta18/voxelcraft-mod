local mng = { }

local activeSpeakers = { }
local speakers = { }

function mng.get_active_speakers()
	return activeSpeakers
end

function mng.get_speakers()
	return speakers
end

function mng.is_playing(ambient)
	if activeSpeakers[ambient] == nil then
		return false
	end

	return audio.is_playing(activeSpeakers[ambient])
end

function mng.set_volume(ambient, volume)
	if mng.is_playing(ambient) then
		audio.set_volume(activeSpeakers[ambient], volume)
	end
end

function mng.set_position(ambient, x, y, z)
	if mng.is_playing(ambient) then
		audio.set_position(activeSpeakers[ambient], x, y, z)
	end
end

function mng.stop(ambient)
	local speaker = activeSpeakers[ambient]

	if speaker ~= nil then
		activeSpeakers[ambient] = nil

		audio.stop(speaker)
	end
end

local function getSoundName(ambient)
	return "ambientsounds/"..ambient:gsub("%.", "/")
end

function mng.play_2d(ambient, loop, volume, pitch)
	if mng.is_playing(ambient) then
		return
	end

	if loop == nil then loop = false end
	if volume == nil then volume = 1.0 end
	if pitch == nil then pitch = 1.0 end

	activeSpeakers[ambient] = audio.play_sound_2d(getSoundName(ambient), volume, pitch, "ambient", loop)
	table.insert(speakers, activeSpeakers[ambient])
end

function mng.play_3d(ambient, loop, x, y, z, volume, pitch)
	if mng.is_playing(ambient) then
		return
	end

	if loop == nil then loop = false end
	if x == nil then x = 0 end
	if y == nil then y = 0 end
	if z == nil then z = 0 end
	if volume == nil then volume = 1.0 end
	if pitch == nil then pitch = 1.0 end

	activeSpeakers[ambient] = audio.play_sound(getSoundName(ambient), x, y, z, volume, pitch, "ambient", loop)
	table.insert(speakers, activeSpeakers[ambient])
end

return mng