require "voxelcraft:logger/logger"
require "voxelcraft:config/config"

-- Furnace class
Furnace = {}

function Furnace:new(
        invid, max_progress, on_change_callback, 
        reset_checker, on_fuel_end_callback, on_end_callback
    )
    local obj = {}
    obj.fuel = -1
    obj.progress = 0
    obj.fuel_speed = 1
    obj.is_running = false
    obj.is_running_prev = false -- Is running in previous state
                                -- It uses for "started" event
    obj.on_change_callback = on_change_callback
    obj.on_end_callback = on_end_callback
    obj.on_fuel_end_callback = on_fuel_end_callback
    obj.reset_checker = reset_checker
    obj.craft_result = {}
    obj.invid = invid
    obj.max_progress = max_progress -- Max progress in ticks (there are 20
                                    -- 20 ticks in one second)

    function obj:get_fuel()
        return obj.fuel
    end

    function obj:set_fuel(fuel)
        obj.fuel = fuel
    end

    function obj:add_fuel(fuel)
        obj.fuel = obj.fuel + fuel
        return obj.fuel
    end

    function obj:get_progress()
        return obj.progress
    end

    function obj:set_progress(progress)
        obj.progress = progress
    end

    function obj:start_bake(craft_result)
        obj.craft_result = craft_result
        obj.is_running = true
        obj.on_change_callback(invid, "started")
    end

    function obj:end_bake()
        obj.progress = 0
        obj.is_running = false
    end

    function obj:update()
        local would_reset = obj.reset_checker(obj.invid, obj.craft_result)
        if would_reset then
            obj:end_bake()
            obj.on_change_callback(invid, "stopped")
        else 
            logger.debug(obj.fuel)
            if obj.fuel < 1 then
                obj.on_fuel_end_callback(invid)
            end
            if obj.fuel < 0 then
                obj:end_bake()
                obj.on_change_callback(invid, "stopped")
            end
            if obj.is_running then
                obj.fuel = obj.fuel - obj.fuel_speed * vconfig:get(
                    "furnaces.speed_modifier"
                ) 
                obj.progress = obj.progress + 1
                obj.progress = math.min(obj.progress, obj.max_progress)
                if obj.progress == obj.max_progress then
                    obj:end_bake()
                    obj.on_change_callback(invid, "stopped")
                    obj.on_end_callback(obj.invid, obj.craft_result)
                end
            end
        end

        if obj.is_running and not obj.is_running_prev then
            obj.on_change_callback(invid, "started")
        end
        obj.is_running_prev = obj.is_running
    end

    setmetatable(obj, self)
    self.__index = self; return obj
end

-- namespace
furnaces = {}

furnaces.Furnace = Furnace
furnaces.FurnaceStorage = {}

local furnace_storage = {}

furnaces.FurnaceStorage.get = function (fid)
    return furnace_storage[fid]
end

furnaces.FurnaceStorage.set = function (fid, furnace)
    furnace_storage[fid] = furnace
end

furnaces.FurnaceStorage.update_all = function ()
    for _, furnace in pairs(furnace_storage) do
        furnace:update()
    end
end
