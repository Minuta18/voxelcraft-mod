require "voxelcraft:logger/logger"
require "voxelcraft:compatibility/init"
require "voxelcraft:player/init"
require "voxelcraft:gamemode/gamemode"
require "voxelcraft:crafting/init"
require "voxelcraft:additional_data/init"
require "voxelcraft:health/init"

---@diagnostic disable-next-line: lowercase-global
voxelcraft_core = {}
voxelcraft_core.logger = logger
voxelcraft_core.compatibility = compatibility
voxelcraft_core.health = health
voxelcraft_core.hunger = hunger
voxelcraft_core.player_controller = player_controller
voxelcraft_core.gamemode = gamemode
voxelcraft_core.craft = craft
voxelcraft_core.loader = loader
voxelcraft_core.loader_api = loader_api
