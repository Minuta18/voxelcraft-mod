function generate_heightmap(x, y, w, h, bpd, inputs)  
    local map = Heightmap(w, h)
    map.noiseSeed = SEED + 3298
    map:noise({x, y}, bpd * 0.1, 6, 0.01)
    map:add(0.28)

    local ocean_map = Heightmap(w, h)
    ocean_map.noiseSeed = SEED + 6794
    ocean_map:noise({x, y}, bpd * 0.1, 6, 0.07)
    ocean_map:add(0.15)

    local ocean_biome_map = Heightmap(w, h)
    ocean_biome_map.noiseSeed = SEED + 434
    ocean_biome_map:noise({x, y}, 0.1 * bpd, 6, 0.5)
    ocean_biome_map:add(0.16)
    ocean_biome_map:max(0)
    ocean_biome_map:mul(4)
    ocean_biome_map:min(1)

    map:mixin(ocean_map, ocean_biome_map)

    return map
end

function generate_biome_parameters(x, y, w, h, s)
    local tempmap = Heightmap(w, h)
    tempmap.noiseSeed = SEED + 5324
    tempmap:noise({x, y}, 0.08*s, 6)
    tempmap:mul(0.5)
    tempmap:add(0.5)

    local hummap = Heightmap(w, h)
    hummap.noiseSeed = SEED + 953
    hummap:noise({x, y}, 0.08*s, 6)
    tempmap:pow(3)
    hummap:pow(3)
    
    local ocean_biome_map = Heightmap(w, h)
    ocean_biome_map.noiseSeed = SEED + 434
    ocean_biome_map:noise({x, y}, 0.1 * s, 6, 0.5)
    ocean_biome_map:add(0.2)
    ocean_biome_map:max(0)
    ocean_biome_map:mul(4)
    ocean_biome_map:min(1)

    return tempmap, hummap, ocean_biome_map
end

function place_structures(x, z, w, d, hmap, chunk_height)
    local placements = {}
    return placements
end


local w, h, x, y, bpd = 1000, 1000, 0, 0, 1
local map = Heightmap(w, h)
map.noiseSeed = SEED + 3298
map:noise({x, y}, bpd * 0.1, 6, 0.01)
map:add(0.28)

local ocean_map = Heightmap(w, h)
ocean_map.noiseSeed = SEED + 6794
ocean_map:noise({x, y}, bpd * 0.1, 6, 0.07)
ocean_map:add(0.15)

local ocean_biome_map = Heightmap(w, h)
ocean_biome_map.noiseSeed = SEED + 434
ocean_biome_map:noise({x, y}, 0.1 * bpd, 6, 0.5)
ocean_biome_map:add(0.3)
ocean_biome_map:max(0)
ocean_biome_map:mul(4)
ocean_biome_map:min(1)
ocean_biome_map:dump("export:ocean_biome_map.png")

map:mixin(ocean_map, ocean_biome_map)
map:dump("export:result_map.png")
