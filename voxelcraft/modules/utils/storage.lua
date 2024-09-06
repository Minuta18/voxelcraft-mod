function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end 

function create_class(base)
    local class = {}
    class.__index = class
    
    if base then
        setmetatable(class, {__index = base})
    end

    function class:new(...)
        local inst = setmetatable({}, class)
        if inst.init then
            inst:init(...)
        end
        return inst
    end

    return class
end

PlayerDataStore = create_class()

function PlayerDataStore:init()
    self.store = {}
end

function PlayerDataStore:get(eid)
    return self.store[eid]
end

function PlayerDataStore:set(eid, data)
    self.store[eid] = data
end

function PlayerDataStore:update_all()
    for ind, val in pairs(self.store) do
        val:update()
    end
end

function PlayerDataStore:render_update_all()
    for ind, val in pairs(self.store) do
        if val.render_update ~= nil then
            val:render_update()
        end
    end
end
