function create_class(base)
    local class = {}
    class.__index = base
    
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

PlayerDataStore = {}

function PlayerDataStore:new()
    local private = {}
        private.store = {}
    local public = {}

    function public:get(pid)
        return private.store[pid]
    end

    function public:set(pid, data)
        private.store[pid] = data
    end

    setmetatable(public, self)
    self.__index = self;
    return public;
end
