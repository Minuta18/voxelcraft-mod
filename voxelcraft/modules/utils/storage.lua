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

PlayerDataStoreSaver = create_class()

function PlayerDataStoreSaver:init(player_data_store, filename)
    self.player_data_store = player_data_store
    self.filename = filename
end

function PlayerDataStoreSaver:get_filename()
    return self.filename
end

function PlayerDataStoreSaver:set_filename(filename)
    self.filename = filename
end

function PlayerDataStoreSaver:save()
    local data = self.player_data_store.store
    local data_file = pack.data_file(
        "voxelcraft", "stores/" .. self.filename .. ".json"
    )
    logger.debug(dump(data))
    file.write(data_file, json.tostring(data))
end
