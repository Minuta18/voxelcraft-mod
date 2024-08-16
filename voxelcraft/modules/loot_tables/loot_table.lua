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
        return pool_probability > rand        
    end

    function private:select_item(variants)
        local sum = 0;
        for ind, var in ipairs(variants) do
            if var ~= nil then
                if var.weight == nil then
                    sum = sum + 1
                else
                    sum = sum + var.weight
                end
            end
        end

        local rand = math.random(1, sum);
        local curr_sum = 0;
        -- logger.debug(dump(variants))
        for ind, var in ipairs(variants) do
            if var ~= nil then
                if var.weight == nil then
                    curr_sum = curr_sum + 1
                else
                    curr_sum = curr_sum + var.weight
                end

                if curr_sum >= rand then
                    local id = var.id;
                    local count = var.count;

                    if id == nil then id = "core:empty" end    
                    if count == nil then count = 0 end
                    
                    local result = {}
                    result[1] = id;
                    result[2] = count;
                    return result;
                end
            end
        end
    end

    function public:get_result()
        local result = {}
        if private.content.pools == nil then
            return result            
        end
        for i = 0, private:get_pool_count() - 1, 1 do
            local pool = private.content.pools[i + 1];
            if private:check_pool(pool) then
                if pool.variant ~= nil then
                    local item = private:select_item(pool.variant)
                    table.insert(result, item)
                end
            end
        end
        return result
    end

    setmetatable(public, self)
    self.__index = self; 
    return public;
end
