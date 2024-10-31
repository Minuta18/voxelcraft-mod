local _, dir = parse_path(__DIR__)
local ores = require "voxelcraft:worldgen"
ores.load(dir)

math.randomseed(SEED)

function generate_heightmap(x, y, w, h, bpd, inputs)  
    local map = Heightmap(w, h)
    map.noiseSeed = SEED + 3298
    map:noise({x, y}, bpd * 0.1, 6, 0.01)
    map:add(0.28)

    local hills_map = Heightmap(w, h)
    hills_map.noiseSeed = SEED + 32892
    hills_map:noise({x, y}, 0.1 * bpd, 6, 0.1)
    hills_map:max(0.0)
    hills_map:pow(2)
    hills_map:mul(10.0)
    map:add(hills_map)    

    local ocean_map = Heightmap(w, h)
    ocean_map.noiseSeed = SEED + 6794
    ocean_map:noise({x, y}, bpd * 0.1, 6, 0.07)
    ocean_map:add(0.15)

    map:mixin(ocean_map, inputs[3])
    
    return map
end

function generate_biome_parameters(x, y, w, h, s)
    local tempmap = Heightmap(w, h)
    tempmap.noiseSeed = SEED + 5324
    tempmap:noise({x, y}, 0.04*s, 4)
    tempmap:mul(0.5)
    tempmap:add(0.5)

    local hummap = Heightmap(w, h)
    hummap.noiseSeed = SEED + 953
    hummap:noise({x, y}, 0.04*s, 4)
    tempmap:pow(3)
    hummap:pow(3)
    hummap:add(0.02)
    tempmap:add(-0.02)
    
    local ocean_biome_map = Heightmap(w, h)
    ocean_biome_map.noiseSeed = SEED + 434
    ocean_biome_map:noise({x, y}, 0.05 * s, 6, 0.5)
    ocean_biome_map:add(0.15)
    ocean_biome_map:max(0)
    ocean_biome_map:mul(4)
    ocean_biome_map:min(1)

    -- local rivermap = Heightmap(w, h)
    -- rivermap.noiseSeed = SEED
    -- rivermap:noise({x, y}, 0.1 * s, 6, 0.7)
    -- rivermap:abs()
    -- rivermap:pow(0.2)
    -- rivermap:sub(1.0)
    -- rivermap:abs()
    -- rivermap:sub(0.3)
    -- rivermap:max(0.0)
    -- rivermap:mul(0.1)

    -- ocean_biome_map:add(rivermap)

    return tempmap, hummap, ocean_biome_map
end

function place_structures(x, z, w, d, hmap, chunk_height)
    local placements = {}
    ores.place(placements, x, z, w, d, SEED, hmap, chunk_height)
    return placements
end

function place_structures_wide(x, z, w, d, chunk_height)
    local placements = {}
    if math.random() < 0.05 then -- generate caves
        local sx = x + math.random() * 10 - 5
        local sy = math.random() * (chunk_height / 4) + 10
        local sz = z + math.random() * 10 - 5

        local dir = math.random() * math.pi * 2
        local dir_inertia = (math.random() - 0.5) * 2
        local elevation = -3
        local width = math.random() * 3 + 2

        for i=1,18 do
            local dx = math.sin(dir) * 10
            local dz = -math.cos(dir) * 10

            local ex = sx + dx
            local ey = sy + elevation
            local ez = sz + dz

            table.insert(placements, 
                {":line", 0, {sx, sy, sz}, {ex, ey, ez}, width})

            sx = ex
            sy = ey
            sz = ez
            
            dir_inertia = dir_inertia * 0.8 + 
                (math.random() - 0.5) * math.pow(math.random(), 2) * 8
            elevation = elevation * 0.9 + 
                (math.random() - 0.4) * (1.0-math.pow(math.random(), 4)) * 8
            dir = dir + dir_inertia
        end
    end
    return placements
end
