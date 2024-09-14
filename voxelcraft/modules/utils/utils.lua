require "voxelcraft:utils/storage"
require "voxelcraft:utils/meta"
require "voxelcraft:utils/serializer"

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

function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end
