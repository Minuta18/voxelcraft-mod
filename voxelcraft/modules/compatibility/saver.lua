---@diagnostic disable: lowercase-global
local data_file = pack.data_file("voxelcraft", "voxelcraft_data.json")

function save_data(data)
    data["first_launch"] = false
    file.write(data_file, json.tostring(data))
end

function load_data()
    if not file.exists(data_file) then
        return {}
    end
    local data = json.parse(file.read(data_file))
    return data
end

data = load_data()

function get_player_data(pid)
    if not data["players"] then
        data["players"] = {}
    end
    return data["players"][pid]
end
