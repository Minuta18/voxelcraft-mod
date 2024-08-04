require "voxelcraft:logger/logger"
require "voxelcraft:compatibility/init"
require "voxelcraft:health/init"
require "voxelcraft:player/player"

---@diagnostic disable-next-line: lowercase-global
voxelcraft_core = {}
voxelcraft_core.logger = logger
voxelcraft_core.compatibility = compatibility
voxelcraft_core.health = health
voxelcraft_core.vplayer = vplayer
