isCopied = false
CopyClick = 0
local x1, y1, z1 = nil, nil, nil
local ax1, ay1, az1 = nil, nil, nil
local dx1, dy1, dz1 = nil, nil, nil

function copy(x, y, z)
    if isCopied then
        return
    end

    local orig = get_block(x, y, z)
    local dx, dy, dz = 0, 0, 0
    local ax, az, ay = 0, 0, 0
    for i = 1, 100 do
        if get_block(x, y + i, z) == orig then
            dy = y + i
        end
        if get_block(x + i, y, z) == orig then
            dx = x + i
        end
        if get_block(x, y, z + i) == orig then
            dz = z + i
        end
    end

    if dx ~= 0 and dy ~= 0 and dz ~= 0 then
        if get_block(x, y - 1, z) == block_index('stacker:stacker') then
            set_block(x, dy - 1, z, get_block(x, y - 1, z))
            for ay = 0, dy - y do
                for az = 0, dz - z do
                    for ax = 0, dx - x do
                        set_block(x + ax, dy + ay, z + az, get_block(x + ax, y + ay, z + az), get_block_states(x + ax, y + ay, z + az))
                    end
                end
            end
        elseif get_block(x, y - 1, z) == block_index('stacker:xstacker') then
            set_block(dx, y - 1, z, get_block(x, y - 1, z))
            for ay = 0, dy - y do
                for az = 0, dz - z do
                    for ax = 0, dx - x do
                        set_block(dx + ax, y + ay, z + az, get_block(x + ax, y + ay, z + az), get_block_states(x + ax, y + ay, z + az))
                    end
                end
            end
        elseif get_block(x, y - 1, z) == block_index('stacker:zstacker') then
            set_block(x, y - 1, dz, get_block(x, y - 1, z))
            for ay = 0, dy - y do
                for az = 0, dz - z do
                    for ax = 0, dx - x do
                        set_block(x + ax, y + ay, dz + az, get_block(x + ax, y + ay, z + az), get_block_states(x + ax, y + ay, z + az))
                    end
                end
            end
        elseif get_block(x, y - 1, z) == block_index('stacker:xunstacker') then
            set_block(x, y - 1, dz, get_block(x, y - 1, z))
            for ay = 0, dy - y do
                for az = 0, dz - z do
                    for ax = 0, dx - x do
                        set_block(x - ax, y + ay, z + az, get_block(x + ax, y + ay, z + az), get_block_states(x + ax, y + ay, z + az))
                    end
                end
            end
        elseif get_block(x, y - 1, z) == block_index('stacker:zunstacker') then
            set_block(x, y - 1, dz, get_block(x, y - 1, z))
            for ay = 0, dy - y do
                for az = 0, dz - z do
                    for ax = 0, dx - x do
                        set_block(x + ax, y + ay, z - az, get_block(x + ax, y + ay, z + az), get_block_states(x + ax, y + ay, z + az))
                    end
                end
            end
        elseif get_block(x, y - 1, z) == block_index('stacker:copy') then
            for ay = 0, dy - y do
                for az = 0, dz - z do
                    for ax = 0, dx - x do
                        ax1, ay1, az1 = ax, ay, az
                    end
                end
            end
            dx1, dy1, dz1 = dx, dy, dz
            x1, y1, z1 = x, y, z
            CopyClick = 1
            isCopied = true
        end
    end
end

function on_interact(x, y, z)
    isCopied = false
    if CopyClick == 0 then
        copy(x, y, z)
    elseif get_block(x, y - 1, z) == block_index('stacker:copy') then
        for ay1 = 0, dy1 - y1 do
            for az1 = 0, dz1 - z1 do
                for ax1 = 0, dx1 - x1 do
                    set_block(x + ax1, y + ay1, z + az1, get_block(x1 + ax1, y1 + ay1, z1 + az1), get_block_states(x1 + ax1, y1 + ay1, z1 + az1))
                end
            end
        end
        CopyClick = 0
    end
end