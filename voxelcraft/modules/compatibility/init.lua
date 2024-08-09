require "voxelcraft:compatibility/world_events"
require "voxelcraft:compatibility/health_bar"
require "voxelcraft:compatibility/hunger_bar"
require "voxelcraft:compatibility/blocks"

---@diagnostic disable-next-line: lowercase-global
compatibility = {}

compatibility.world_events = world_events
compatibility.health_bar = health_bar
compatibility.hunger_bar = hunger_bar
compatibility.block_operations = block_operations
