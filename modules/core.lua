require "voxelcraft:logger"

local this = {}
this.logger = logger

this.on_world_open = function ()
    this.logger.debug("voxelcraft.modules.core.on_world_open() called")
end

voxelcraft_core = this
