local dist = load_script("ambientsounds:scripts/util/dist.lua")
local blocks = { }

function blocks.get_int_player_pos(pid)
	local x, y, z = player.get_pos(pid)

    if x == nil then
        error("Player with ID "..pid.." not found")
    end

	return math.floor(x), math.floor(y), math.floor(z)
end

function blocks.find_closest_block(searchRadius, id, x, y, z)
    local closestDist = searchRadius + 1
    local wx, wy, wz = -1, -1, -1

    blocks.for_in_radius(searchRadius, x, y, z,
    function(xi, yi, zi)
        if block.get(xi, yi, zi) == id then
            local dist = dist(xi, yi, zi, x, y, z)

            if dist < closestDist then
                closestDist = dist
                wx, wy, wz = xi, yi, zi
            end
        end
    end
    )

	return wx, wy, wz
end

function blocks.for_in_radius(searchRadius, x, y, z, func)
    local median = math.floor(searchRadius / 2)

    local startX, startY, startZ = x - median, y + median, z - median
    local endX, endY, endZ = x + median, y - median, z + median
    local checkStartX, checkStartY, checkStartZ = startX - searchRadius, startY + searchRadius, startZ - searchRadius
    local checkEndX, checkEndY, checkEndZ = endX + searchRadius, endY - searchRadius, endZ + searchRadius

    local stop = false

    for xi = checkStartX, checkEndX do
        for yi = checkStartY, checkEndY, -1 do
            for zi = checkStartZ, checkEndZ do
                if func(xi, yi, zi) then
                    stop = true
                end

                if stop then break end
            end

            if stop then break end
        end

        if stop then break end
    end
end

return blocks