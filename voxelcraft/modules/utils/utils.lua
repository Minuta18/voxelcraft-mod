function extended(child, parent)
    setmetatable(child,{__index = parent}) 
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
