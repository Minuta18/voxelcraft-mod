require "customworldgen:main"

customworldgen.params["generation_rate"] = 20
customworldgen.params["generation_radius"] = 2

customworldgen.register_generator(function (chunk_x, chunk_z)
    local x1, z1, x2, z2 = customworldgen.get_cords_by_chunk(chunk_x, chunk_z)
    
    for k, v in pairs(voxelcraft_core.loader_api.get_ores()) do
        local count = math.random(1, v["max_per_chunk"])
        for i = 1, count, 1 do
            local y = math.random(v["min_height"], v["max_height"])
            local x = math.random(x1, x2)
            local z = math.random(z1, z2)
            local size = math.random(v["min_size"], v["max_size"])
            local cord_list = {}

            if size <= 8 then
                for x_add = 0, 1, 1 do
                    for y_add = 0, 1, 1 do
                        for z_add = 0, 1, 1 do
                            if math.random(1, 8) >= size then
                                table.insert(cord_list, {x_add, y_add, z_add})
                            end 
                        end
                    end
                end
            else
                local x_add, y_add, z_add = 0, 0, 0
                table.insert(cord_list, {x_add, y_add, z_add})
                for j = 1, size, 1 do
                    x_add = x_add + math.random(-1, 1)
                    y_add = y_add + math.random(-1, 1)
                    z_add = z_add + math.random(-1, 1)
                    table.insert(cord_list, {x_add, y_add, z_add})
                end
            end

            local exit = false
            for _, v in ipairs(cord_list) do
                local block_id = block.get(v[1] + x, v[2] + y, v[3] + z)
                if block_id == -1 or block_id == block.index("core:air") or
                    block_id == block.index("base:water") or
                    block_id == block.index("base:dirt") or
                    block_id == block.index("base:grass_block") 
                then
                    exit = true
                end
            end
            if not exit then
                for _, v in ipairs(cord_list) do
                    block.set(v[1] + x, v[2] + y, v[3] + z, block.index(k), 0)
                end
            end
        end
    end
end)
