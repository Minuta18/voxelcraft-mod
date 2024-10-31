local ores = {}

function ores.load(directory)
    ores.ores = file.read_combined_list(directory .. "/ores.json")
end

function ores.place(placements, x, z, w, d, seed, hmap, chunk_height)
    for _, ore in ipairs(ores.ores) do
        local count = math.random(1, ore.max_per_chunk)

        -- average count is less than 1
        local addchance = math.fmod(count, 1.0)
        if math.random() < addchance then
            count = count + 1
        end

        for i = 1,count do
            local sx = math.random() * w
            local sz = math.random() * d
            local sy = math.random() * (chunk_height * 0.5)
            if sy < hmap:at(sx, sz) * chunk_height - 10 then
                table.insert(placements, {
                    ore.structures[math.random(1, table.getn(ore.structures))],
                    {sx, sy, sz}, 
                    math.random()*4, -1
                })
            end
        end
    end
end

return ores
