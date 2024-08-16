LootTable = {}

function LootTable:new(content)
    local private = {}
        
        private.content = content
    
    local public = {}

    function private:get_pool_count()
        local count = private.content.count;
        if count == nil then
            return 1
        end
        return count;
    end

    function private:check_pool(pool)
        local rand = math.random();
        local pool_probability = pool.probability;
        
    end

    function public:get_result()
        local result = {}
        for i = 0, private:get_pool_count(), 1 do
            
        end
        return result
    end

    setmetatable(public, self)
    self.__index = self; 
    return public;
end
