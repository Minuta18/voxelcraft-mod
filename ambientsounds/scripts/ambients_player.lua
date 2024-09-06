local dist = load_script("ambientsounds:scripts/util/dist.lua")
local blocks = load_script("ambientsounds:scripts/util/blocks.lua")
local mng = load_script("ambientsounds:scripts/ambients_manager.lua")

local cfg = load_script("ambientsounds:scripts/ambients_config.lua")

local beachAmbients = cfg["beach-ambients"]
local ambientsVolume = cfg["ambients-volume"]
local underwaterSoundsVolume = cfg["underwater-sounds-volume"]

local ambients = { pid = -1 }

local waterIndex = -1
local grassIndex = -1
local sandIndex = -1
local leavesIndex = -1
local woodIndex = -1

local function updateIndices()
	waterIndex = block.index("base:water")
	grassIndex = block.index("base:grass")
	sandIndex = block.index("base:sand")
	leavesIndex = block.index("base:leaves")
	woodIndex = block.index("base:wood")
end

local function hasBeach(x, y, z, limit, infoTable)
	if infoTable == nil then infoTable = { checkedBlocksCount = 0 } end

	if not infoTable[x..z] and block.get(x, y, z) == id then
		infoTable[x..z] = true
	end
	
	local axises =
	{
		{1,0,0},
		{0,0,1}
	}

	for i = -1, 1, 2 do
		for j = 1, #axises do
			local axis = axises[j]
			local xi, zi = i * axis[1] + x, i * axis[3] + z

			if not infoTable[xi..zi] then
				infoTable[xi..zi] = true

				local bid = block.get(xi, y, zi)

				if bid == waterIndex then
					infoTable["checkedBlocksCount"] = infoTable["checkedBlocksCount"] + 1

					if infoTable["checkedBlocksCount"] >= limit then
						return -1
					end

					local result = hasBeach(xi, y, zi, limit, infoTable)

					if result == -1 then
						return -1
					elseif result then
						return true
					end
				elseif bid == sandIndex then
					return true
				end
			end
		end
	end

	return false
end

local function playSurrond(sound, x, y, z)
	mng.play_3d(sound)

	mng.set_position(sound, x, y, z)

	mng.set_volume(sound, ambientsVolume)
end

function ambients.play_ambients()
	local pid = ambients.pid

	if pid == -1 then
		return
	end

	updateIndices()

	local ambientsRadius = 10
	local x, y, z = blocks.get_int_player_pos(pid)
	local wx, wy, wz = blocks.find_closest_block(ambientsRadius, waterIndex, x, y, z)
	local underwater = block.get(x, y + 1, z) == waterIndex

	-- checking the presence of water within a radius of 8 blocks

	if wx ~= -1 and wy ~= -1 and wz ~= -1 then
		if underwater then
			local sound

			if y <= 25 then
				sound = "water.underwater-deep"
			else
				sound = "water.underwater"
			end

			if not mng.is_playing(sound) then
				ambients.stop_ambients()
				mng.play_2d(sound, false, underwaterSoundsVolume)
			end
		else
			local sound

			if beachAmbients then
				local beach = hasBeach(wx, wy, wz, 16)

				if beach == true then
					sound = "water.beach"
				else
					sound = "water.ocean"
				end
			else
				sound = "water.ocean"
			end

			playSurrond(sound, wx, wy, wz)

			mng.stop("water.underwater")

			mng.stop("water.underwater-deep")
		end
	else
		mng.stop("water.beach")
		mng.stop("water.ocean")
		mng.stop("water.underwater")
		mng.stop("water.underwater-deep")
	end

	if not underwater then
		local time = world.get_day_time()

		local crow, cricket, cicadas, bird = "animals.crow.crow", "animals.cricket.cricket", "animals.cicadas.cicadas", "animals.bird.bird-ambience"
		local crowChance
		local hasBird, hasCricket, hasCicadas = false, false, false
		local lx, ly, lz, gx, gy, gz = -1, -1, -1, -1, -1, -1

		blocks.for_in_radius(ambientsRadius, x, y, z,
		function(xi, yi, zi)
			local id = block.get(xi, yi, zi)

			if not hasBird and id == leavesIndex then
				hasBird = true
				lx, ly, lz = xi, yi, zi
        	elseif not hasCricket and id == grassIndex then
				hasCricket = true
				hasCicadas = true
				gx, gy, gz = xi, yi, zi
        	end

        	if hasBird and hasCricket then
        		return true
        	end
		end
		)

		if time > 0.25 and time < 0.75 then
			crowChance = 0.0001

			if hasBird then
				playSurrond(bird, lx, ly, lz)
			else
				mng.stop(bird)
			end
		else
			crowChance = 0.0004
			cricket = cricket.."-night"
			cicadas = cicadas.."-night"
		end

		if hasCricket then
			playSurrond(cricket, gx, gy, gz)
		else
			mng.stop(cricket)
		end

		if hasCicadas then
			playSurrond(cicadas, gx, gy, gz)
		else
			mng.stop(cicadas)
		end

		if crowChance > math.random() then
			playSurrond(crow, x, y + 5, z)
		end
	end
end

function ambients.stop_ambients()
	for k, v in pairs(mng.get_speakers()) do
		audio.stop(v)
	end
end

return ambients