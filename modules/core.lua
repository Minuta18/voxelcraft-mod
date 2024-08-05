require "voxelcraft:logger/logger"
require "voxelcraft:compatibility/init"
require "voxelcraft:health/init"
require "voxelcraft:player/init"
require "voxelcraft:gamemode/gamemode"

---@diagnostic disable-next-line: lowercase-global
voxelcraft_core = {}
voxelcraft_core.logger = logger
voxelcraft_core.compatibility = compatibility
voxelcraft_core.health = health
voxelcraft_core.hunger = hunger
voxelcraft_core.vplayer = vplayer
voxelcraft_core.gamemode = gamemode
