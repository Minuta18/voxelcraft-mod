sx, sy, sz = nil, nil, nil
stackerBlocks = {}

local function replace_block(new_x, new_y, new_z, x, y, z)
    set_block(new_x, new_y, new_z, get_block(x, y, z), get_block_states(x, y, z))
	stackerBlocks[#stackerBlocks + 1] = {new_x, new_y, new_z}
    stack(new_x, new_y, new_z)
end

function ystack(x, y, z)
    local function border(new_x, new_y, new_z)
        return is_replaceable_at(new_x, new_y, new_z) and is_solid_at(new_x, new_y - 1, new_z) and get_block(new_x, new_y - 1, new_z) ~= block_index("base:water")
    end

    for i = 1, 6 do
        if border(x, y - 1, z) then
            replace_block(x, y, z, x, y, z)
        elseif border(x + 1, y, z) then
            replace_block(x + 1, y, z, x, y, z)
        elseif border(x - 1, y, z) then
            replace_block(x - 1, y, z, x, y, z)
        elseif border(x, y, z + 1) then
            replace_block(x, y, z + 1, x, y, z)
        elseif border(x, y, z - 1) then
            replace_block(x, y, z - 1, x, y, z)
        end
    end
end

function nystack(x, y, z)
    local function border(new_x, new_y, new_z)
        return is_replaceable_at(new_x, new_y, new_z) and is_solid_at(new_x, new_y + 1, new_z) and get_block(new_x, new_y + 1, new_z) ~= block_index("base:water")
    end

    for i = 1, 6 do
        if border(x, y + 1, z) then
            replace_block(x, y, z, x, y, z)
        elseif border(x + 1, y, z) then
            replace_block(x + 1, y, z, x, y, z)
        elseif border(x - 1, y, z) then
            replace_block(x - 1, y, z, x, y, z)
        elseif border(x, y, z + 1) then
            replace_block(x, y, z + 1, x, y, z)
        elseif border(x, y, z - 1) then
            replace_block(x, y, z - 1, x, y, z)
        end
    end
end

function xstack(x, y, z)
    local function border(new_x, new_y, new_z)
        return is_replaceable_at(new_x, new_y, new_z) and is_solid_at(new_x - 1, new_y, new_z) and get_block(new_x - 1, new_y, new_z) ~= block_index("base:water")
    end

    for i = 1, 6 do
        if border(x - 1, y, z) then
            replace_block(x, y, z, x, y, z)
        elseif border(x, y + 1, z) then
            replace_block(x, y + 1, z, x, y, z)
        elseif border(x, y - 1, z) then
            replace_block(x, y - 1, z, x, y, z)
        elseif border(x, y, z + 1) then
            replace_block(x, y, z + 1, x, y, z)
        elseif border(x, y, z - 1) then
            replace_block(x, y, z - 1, x, y, z)
        end
    end
end

function nxstack(x, y, z)
    local function border(new_x, new_y, new_z)
        return is_replaceable_at(new_x, new_y, new_z) and is_solid_at(new_x + 1, new_y, new_z) and get_block(new_x + 1, new_y, new_z) ~= block_index("base:water")
    end

    for i = 1, 6 do
        if border(x + 1, y, z) then
            replace_block(x, y, z, x, y, z)
        elseif border(x, y + 1, z) then
            replace_block(x, y + 1, z, x, y, z)
        elseif border(x, y - 1, z) then
            replace_block(x, y - 1, z, x, y, z)
        elseif border(x, y, z + 1) then
            replace_block(x, y, z + 1, x, y, z)
        elseif border(x, y, z - 1) then
            replace_block(x, y, z - 1, x, y, z)
        end
    end
end

function zstack(x, y, z)
    local function border(new_x, new_y, new_z)
        return is_replaceable_at(new_x, new_y, new_z) and is_solid_at(new_x, new_y, new_z - 1) and get_block(new_x, new_y, new_z - 1) ~= block_index("base:water")
    end

    for i = 1, 6 do
        if border(x, y, z - 1) then
            replace_block(x, y, z, x, y, z)
        elseif border(x, y + 1, z) then
            replace_block(x, y + 1, z, x, y, z)
        elseif border(x, y - 1, z) then
            replace_block(x, y - 1, z, x, y, z)
        elseif border(x + 1, y, z) then
            replace_block(x + 1, y, z, x, y, z)
        elseif border(x - 1, y, z) then
            replace_block(x - 1, y, z, x, y, z)
        end
    end
end

function nzstack(x, y, z)
    local function border(new_x, new_y, new_z)
        return is_replaceable_at(new_x, new_y, new_z) and is_solid_at(new_x, new_y, new_z + 1) and get_block(new_x, new_y, new_z + 1) ~= block_index("base:water")
    end

    for i = 1, 6 do
        if border(x, y, z + 1) then
            replace_block(x, y, z, x, y, z)
        elseif border(x, y + 1, z) then
            replace_block(x, y + 1, z, x, y, z)
        elseif border(x, y - 1, z) then
            replace_block(x, y - 1, z, x, y, z)
        elseif border(x + 1, y, z) then
            replace_block(x + 1, y, z, x, y, z)
        elseif border(x - 1, y, z) then
            replace_block(x - 1, y, z, x, y, z)
        end
    end
end

local function stackCoroutine(x, y, z)
    local state = get_block_states(x, y, z)
    if get_block(x, y + 1, z) ~= block_index('stacker:copy') then
        if state == 4 then
            ystack(x, y, z)
            set_block(x, y, z, get_block(x, y - 1, z), get_block_states(x, y - 1, z))
        elseif state == 5 then
            nystack(x, y, z)
            set_block(x, y, z, get_block(x, y + 1, z), get_block_states(x, y + 1, z))
        elseif state == 3 then
            xstack(x, y, z)
            set_block(x, y, z, get_block(x - 1, y, z), get_block_states(x - 1, y, z))
        elseif state == 1 then
            nxstack(x, y, z)
            set_block(x, y, z, get_block(x + 1, y, z), get_block_states(x + 1, y, z))
        elseif state == 0 then
            zstack(x, y, z)
            set_block(x, y, z, get_block(x, y, z - 1), get_block_states(x, y, z - 1))
        elseif state == 2 then
            nzstack(x, y, z)
            set_block(x, y, z, get_block(x, y, z + 1), get_block_states(x, y, z + 1))
        else
            set_block(x, y, z, 0)
        end
    end
end

function stack(x, y, z)
    local stackCoroutineFunc = coroutine.create(function()
        stackCoroutine(x, y, z)
    end)
    coroutine.resume(stackCoroutineFunc)
end

function on_placed(x, y, z)
	print("stacked", x, y, z)
	if not (usx == x and usy == y + 1 and usz == z) then
		sx, sy, sz = x, y, z
		stackerBlocks = {}
		stack(x, y, z)
	else
		for _, coords in ipairs(unstackerBlocks) do
			local old_x, old_y, old_z, old_block, old_state = unpack(coords)
			set_block(old_x, old_y, old_z, old_block, old_state)
		end
	end
end