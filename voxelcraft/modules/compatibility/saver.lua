require "voxelcraft:utils/utils"
require "voxelcraft:logger/logger"
require "voxelcraft:health/init"

---@diagnostic disable-next-line: lowercase-global
function save_all()
    health.health_saver:save()
end
