require "voxelcraft:logger/logger"
require "voxelcraft:config/config"
require "voxelcraft:utils/utils"

BaseHealthSystem = {}

-- Health system interface
function BaseHealthSystem:new()
    local public = {}

    function public:get_health() end
    function public:set_health(health) end
    function public:add_health(health) end
    function public:remove_health(health) end
    function public:get_max_health() end
    function public:set_max_health(max_health) end
    function public:get_pid() end
    function public:set_pid(pid) end
    function public:play_damage_animation() end
    function public:does_animation_plays() end
    -- Updates health system. This function calls every tick
    function public:update() end

    setmetatable(public, self)
    self.__index = self;
    return public;
end

VoxelcraftHealthSystem = {}

function VoxelcraftHealthSystem:new(pid, max_health, player_health)
    local private = {}
        private.max_health = max_health
        private.player_health = player_health
        private.ticks_to_end_animation = 0
        private.pid = pid
    local public = {}

    function public:get_health()
        return private.player_health
    end

    function public:set_health(health) 
        private.player_health = health
    end

    function public:add_health(health) 
        private.player_health = private.player_health + health
    end

    function public:remove_health(health)
        private.player_health = private.player_health - health
    end
    
    function public:get_max_health() 
        return private.max_health
    end

    function public:set_max_health(max_health) 
        private.max_health = max_health
    end

    function public:get_pid()
        return private.pid
    end

    function public:set_pid(pid)
        private.pid = pid
    end

    function public:play_damage_animation(animation_speed) 
        animation_speed = animation_speed or vconfig:get(
            "visuals.damage.animation_speed"
        )
        private.ticks_to_end_animation = animation_speed        
    end

    function public:does_animation_plays()
        return private.ticks_to_end_animation > 0
    end

    function public:update() 
        private.ticks_to_end_animation = private.ticks_to_end_animation - 1
    end

    setmetatable(public, self)
    self.__index = self;
    return public;
end

extended(VoxelcraftHealthSystem, BaseHealthSystem)

---@diagnostic disable-next-line: lowercase-global
health_storage = PlayerDataStore:new()
