require "voxelcraft:health/base_health_system"

VoxelcraftHealthSystem = create_class(BaseHealthSystem)

function VoxelcraftHealthSystem:init(player_id, max_health, player_health)
    self.pid = player_id
    self.max_health = max_health
    self.player_health = player_health
    self.ticks_to_end_animation = 0
end

function VoxelcraftHealthSystem:get_health()
    return self.player_health
end

function VoxelcraftHealthSystem:set_health(health)
    self.player_health = health
end

function VoxelcraftHealthSystem:add_health(health)
    self.player_health = self.player_health + health
end

function VoxelcraftHealthSystem:remove_health(health)
    self.player_health = self.player_health - health
end

function VoxelcraftHealthSystem:get_max_health()
    return self.max_health
end

function VoxelcraftHealthSystem:set_max_health(max_health)
    self.max_health = max_health
end

function VoxelcraftHealthSystem:get_pid()
    return self.pid
end

function VoxelcraftHealthSystem:set_pid(pid)
    self.pid = pid
end

function VoxelcraftHealthSystem:play_damage_animation(animation_length)
    animation_length = animation_length or vconfig:get(
        "visuals.damage.animation_speed"
    )
    self.ticks_to_end_animation = animation_length
end

function VoxelcraftHealthSystem:does_animation_plays()
    return self.ticks_to_end_animation > 0
end

function VoxelcraftHealthSystem:update()
    self.ticks_to_end_animation = self.ticks_to_end_animation - 1
end
    