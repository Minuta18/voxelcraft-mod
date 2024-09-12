local data_file = pack.data_file("voxelcraft", "meta.json")

---@diagnostic disable-next-line: lowercase-global
voxelcraft_meta = {}
voxelcraft_meta.first_run = true

---@diagnostic disable-next-line: lowercase-global
function save_meta()
    voxelcraft_meta.first_run = false
    file.write(data_file, json.tostring(voxelcraft_meta))    
end

---@diagnostic disable-next-line: lowercase-global
function load_meta()
    if file.exists(data_file) then
        return json.parse(file.read(data_file))
    end
end

local res = load_meta()
if res then
    voxelcraft_meta = res
end
