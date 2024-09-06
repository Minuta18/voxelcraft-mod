local CopyClick = 0
local x1, y1, z1 = nil, nil, nil
local x2, y2, z2 = nil, nil, nil

function on_block_break_by(x, y, z, playerid)
	set_block(x, y+1, z, 1, 0)
end

function ClickPaste(x, y, z)
    local dx = math.abs(x2 - x1)
    local dy = math.abs(y2 - y1)
    local dz = math.abs(z2 - z1)
    local sx = x2 >= x1 and 1 or -1
    local sy = y2 >= y1 and 1 or -1
    local sz = z2 >= z1 and 1 or -1
    
    for az = 0, dz do
        for ay = 0, dy do
            for ax = 0, dx do
                set_block(x + ax * sx, y + ay * sy, z + az * sz, get_block(x1 + ax * sx, y1 + ay * sy, z1 + az * sz), get_block_states(x1 + ax * sx, y1 + ay * sy, z1 + az * sz))
            end
        end
    end
end


function on_placed(x, y, z)
    if CopyClick == 0 then
        x1, y1, z1 = x, y, z
        CopyClick = CopyClick + 1
    elseif CopyClick == 1 then
		x2, y2, z2 = x, y, z
		CopyClick = CopyClick + 1
	elseif CopyClick == 2 then
		set_block(x1, y1, z1, 0)
		set_block(x2, y2, z2, 0)
		ClickPaste(x, y, z)
		set_block(x, y, z, 0)
		CopyClick = 0
    end
end