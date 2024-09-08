require "voxelcraft:logger/logger"
require "voxelcraft:utils/utils"

local function deep_merge(t1, t2)
	local newTable = {}

	local function add_entries(t, from)
		for key, value in from do
			local existsAlready = t[key]

			if type(value) == 'table' then -- point 1
				t[key] = add_entries(existsAlready or {}, value)
			elseif existsAlready == nil then -- point 2
				t[key] = value
			end
		end

		return t -- point 3
	end

	add_entries(newTable, t1)
	add_entries(newTable, t2)

	return newTable
end

---@diagnostic disable-next-line: lowercase-global
Config = {}

function Config:new()
    local private = {}
        private.config = {}
        private.filename = "voxelcraft:config.json"
        private.user_data_filename = pack.data_file(
            "voxelcraft", "voxelcraft_config.json"
        )
    local public = {}

    function public:load_default_values()
        if not file.exists(private.filename) then 
            logger.error(
                "CRITICAL ERROR: Unable to load config file. Aborting..."
            )
            return false
        end
    
        private.config = json.parse(file.read(private.filename))
        return true
    end

    function public:load_config()
        if not file.exists(private.user_data_filename) then
            return
        end

        private.config = deep_merge(
            private.config,
            json.parse(file.read(private.user_data_filename))
        )
    end

    function public:get(config_path)
        if config_path == nil then
            -- logger.debug("voxelcraft.config.get(config_path=nil) called")
            return nil
        else
            -- logger.debug(string.format(
            --     "voxelcraft.config.get(config_path=%s) called",
            --     config_path  
            -- ))
        end
        local parsed_path = split_string(config_path, ".")
        local result = private.config
        for i, v in ipairs(parsed_path) do
            result = result[v]
            if result == nil then
                return nil
            end
        end
        return result
    end

    public:load_default_values()
    public:load_config()

    setmetatable(public, self)
    self.__index = self;
    return public;
end

vconfig = Config:new()
