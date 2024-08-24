require "voxelcraft:utils/storage"

function split_string(inputstr, sep)
    -- Copied from stackoverflow
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end  
