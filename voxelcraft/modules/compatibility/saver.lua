local data_file = pack.data_file("voxelcraft", "voxelcraft_data.json")

function save_data(data)
    data["first_launch"] = false
    file.write(data_file, json.tostring(data))
end

function load_data()
    if not file.exists(data_file) then
        local data = {}
        data["health"] = 20
        data["hunger"] = 20
        data["first_launch"] = true
        return data
    end
    local data = json.parse(file.read(data_file))
    return data
end
