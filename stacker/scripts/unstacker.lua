usx, usy, usz, old_block = nil, nil, nil, nil
unstackerBlocks = {}

local function unreplace_block(new_x, new_y, new_z, x, y, z)
    set_block(new_x, new_y, new_z, get_block(x, y, z), get_block_states(x, y, z))
	unstackerBlocks[#unstackerBlocks + 1] = {new_x, new_y-1, new_z, get_block(new_x, new_y-1, new_z), get_block_states(new_x, new_y-1, new_z)}
    unstack(new_x, new_y, new_z)
end

function yunstack(x, y, z)
    local function border(new_x, new_y, new_z)
        return is_replaceable_at(new_x, new_y, new_z) and is_solid_at(new_x, new_y - 1, new_z) and get_block(new_x, new_y - 1, new_z) ~= block_index("base:water")
    end

    for i = 1, 6 do
        if border(x, y - 1, z) then
            unreplace_block(x, y, z, x, y, z)
        elseif border(x + 1, y, z) then
            unreplace_block(x + 1, y, z, x, y, z)
        elseif border(x - 1, y, z) then
            unreplace_block(x - 1, y, z, x, y, z)
        elseif border(x, y, z + 1) then
            unreplace_block(x, y, z + 1, x, y, z)
        elseif border(x, y, z - 1) then
            unreplace_block(x, y, z - 1, x, y, z)
        end
    end
end

function nyunstack(x, y, z)
    local function border(new_x, new_y, new_z)
        return is_replaceable_at(new_x, new_y, new_z) and is_solid_at(new_x, new_y + 1, new_z) and get_block(new_x, new_y + 1, new_z) ~= block_index("base:water")
    end

    for i = 1, 6 do
        if border(x, y + 1, z) then
            unreplace_block(x, y, z, x, y, z)
        elseif border(x + 1, y, z) then
            unreplace_block(x + 1, y, z, x, y, z)
        elseif border(x - 1, y, z) then
            unreplace_block(x - 1, y, z, x, y, z)
        elseif border(x, y, z + 1) then
            unreplace_block(x, y, z + 1, x, y, z)
        elseif border(x, y, z - 1) then
            unreplace_block(x, y, z - 1, x, y, z)
        end
    end
end

function xunstack(x, y, z)
    local function border(new_x, new_y, new_z)
        return is_replaceable_at(new_x, new_y, new_z) and is_solid_at(new_x - 1, new_y, new_z) and get_block(new_x - 1, new_y, new_z) ~= block_index("base:water")
    end

    for i = 1, 6 do
        if border(x - 1, y, z) then
            unreplace_block(x, y, z, x, y, z)
        elseif border(x, y + 1, z) then
            unreplace_block(x, y + 1, z, x, y, z)
        elseif border(x, y - 1, z) then
            unreplace_block(x, y - 1, z, x, y, z)
        elseif border(x, y, z + 1) then
            unreplace_block(x, y, z + 1, x, y, z)
        elseif border(x, y, z - 1) then
            unreplace_block(x, y, z - 1, x, y, z)
        end
    end
end

function nxunstack(x, y, z)
    local function border(new_x, new_y, new_z)
        return is_replaceable_at(new_x, new_y, new_z) and is_solid_at(new_x + 1, new_y, new_z) and get_block(new_x + 1, new_y, new_z) ~= block_index("base:water")
    end

    for i = 1, 6 do
        if border(x + 1, y, z) then
            unreplace_block(x, y, z, x, y, z)
        elseif border(x, y + 1, z) then
            unreplace_block(x, y + 1, z, x, y, z)
        elseif border(x, y - 1, z) then
            unreplace_block(x, y - 1, z, x, y, z)
        elseif border(x, y, z + 1) then
            unreplace_block(x, y, z + 1, x, y, z)
        elseif border(x, y, z - 1) then
            unreplace_block(x, y, z - 1, x, y, z)
        end
    end
end

function zunstack(x, y, z)
    local function border(new_x, new_y, new_z)
        return is_replaceable_at(new_x, new_y, new_z) and is_solid_at(new_x, new_y, new_z - 1) and get_block(new_x, new_y, new_z - 1) ~= block_index("base:water")
    end

    for i = 1, 6 do
        if border(x, y, z - 1) then
            unreplace_block(x, y, z, x, y, z)
        elseif border(x, y + 1, z) then
            unreplace_block(x, y + 1, z, x, y, z)
        elseif border(x, y - 1, z) then
            unreplace_block(x, y - 1, z, x, y, z)
        elseif border(x + 1, y, z) then
            unreplace_block(x + 1, y, z, x, y, z)
        elseif border(x - 1, y, z) then
            unreplace_block(x - 1, y, z, x, y, z)
        end
    end
end

function nzunstack(x, y, z)
    local function border(new_x, new_y, new_z)
        return is_replaceable_at(new_x, new_y, new_z) and is_solid_at(new_x, new_y, new_z + 1) and get_block(new_x, new_y, new_z + 1) ~= block_index("base:water")
    end

    for i = 1, 6 do
        if border(x, y, z + 1) then
            unreplace_block(x, y, z, x, y, z)
        elseif border(x, y + 1, z) then
            unreplace_block(x, y + 1, z, x, y, z)
        elseif border(x, y - 1, z) then
            unreplace_block(x, y - 1, z, x, y, z)
        elseif border(x + 1, y, z) then
            unreplace_block(x + 1, y, z, x, y, z)
        elseif border(x - 1, y, z) then
            unreplace_block(x - 1, y, z, x, y, z)
        end
    end
end

function unstackCoroutine(x, y, z)
	local state = get_block_states(x, y, z)
    if get_block(x, y + 1, z) ~= block_index('stacker:copy') then
        if state == 4 then
            yunstack(x, y, z)
			set_block(x, y, z, 0, 0)
			set_block(x, y - 1, z, 0, 0)
        elseif state == 5 then
            nyunstack(x, y, z)
			set_block(x, y, z, 0, 0)
			set_block(x, y + 1, z, 0, 0)
		elseif state == 3 then
            xunstack(x, y, z)
			set_block(x, y, z, 0, 0)
			set_block(x - 1, y, z, 0, 0)
		elseif state == 1 then
            nxunstack(x, y, z)
			set_block(x, y, z, 0, 0)
			set_block(x + 1, y, z, 0, 0)
		elseif state == 0 then
            zunstack(x, y, z)
			set_block(x, y, z, 0, 0)
			set_block(x, y, z - 1, 0, 0)
		elseif state == 2 then
            nzunstack(x, y, z)
			set_block(x, y, z, 0, 0)
			set_block(x, y, z + 1, 0, 0)
		else
			set_block(x, y, z, 0, 0)
        end
    end
end

function unstack(x, y, z)
    local unstackCoroutineFunc = coroutine.create(function()
        unstackCoroutine(x, y, z)
    end)
    coroutine.resume(unstackCoroutineFunc)
end

function on_placed(x, y, z)
	print("unstacked", x, y, z)
	if not (sx == x and sy == y - 1 and sz == z) then
		usx, usy, usz = x, y, z
		unstackerBlocks = {}
		unstackerBlocks[#unstackerBlocks + 1] = {x, y-1, z, get_block(x, y-1, z), get_block_states(x, y-1, z)}
		unstack(x, y, z)
	else
		for _, coords in ipairs(stackerBlocks) do
			local old_x, old_y, old_z, old_block = unpack(coords)
			set_block(old_x, old_y, old_z, 0)
		end
		set_block(x, y, z, 0, 0)
		set_block(x, y-1, z, 0, 0)
	end
end