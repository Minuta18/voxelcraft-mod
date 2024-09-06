local LineClick = 0
local x1, y1, z1, id1 = nil, nil, nil, nil

local function LineClickSecond(x, y, z, id)
    local startX, startY, startZ, endX, endY, endZ

    -- Область
    startX = math.min(x, x1)
    startY = math.min(y, y1)
    startZ = math.min(z, z1)
    endX = math.max(x, x1)
    endY = math.max(y, y1)
    endZ = math.max(z, z1)

    -- Заполнение
    for currX = startX, endX do
        for currY = startY, endY do
            for currZ = startZ, endZ do
                set_block(currX, currY, currZ, id, get_block_states(currX, currY, currZ))
            end
        end
    end

    LineClick = 0
end

function on_placed(x, y, z)
    if LineClick == 0 then
        x1, y1, z1, id1 = x, y, z, get_block(x, y - 1, z)
        LineClick = LineClick + 1
    elseif LineClick == 1 then
        LineClickSecond(x, y, z, id1)
    end
end