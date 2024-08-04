require "voxelcraft:logger/logger"

this = {}

this.on_world_open = function ()
    logger.debug("voxelcraft.modules.compatibility.on_world_open() called")
end

world_events = this
