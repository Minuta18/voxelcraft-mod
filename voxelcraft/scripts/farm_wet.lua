function on_random_update(x, y, z)
    local has_any_water = false
    for ax = -5, 5, 1 do
        for az = -5, 5, 1 do
            if block.name(block.get(x + ax, y, z + az)) == "base:water" then
                has_any_water = true
                break
            end
        end
    end

    if not has_any_water then
        block.set(x, y, z, block.index("voxelcraft:farm"), 0)
    end
end

