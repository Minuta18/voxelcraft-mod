require "voxelcraft:compatibility/world_events"
require "voxelcraft:compatibility/health_bar"

this = {}

this.world_events = world_events
this.health_bar = health_bar

---@diagnostic disable-next-line: lowercase-global
compatibility = this
