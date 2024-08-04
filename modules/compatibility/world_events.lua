require "voxelcraft:logger/logger"

---@diagnostic disable-next-line: lowercase-global
world_events = {}

world_events.on_world_open = function ()
    logger.debug("voxelcraft.modules.compatibility.on_world_open() called")
end

