require "voxelcraft:core"

function on_random_update(x, y, z)
    local farm_block = block.name(block.get(x, y - 1, z))
    if farm_block ~= "voxelcraft:farm" and
        farm_block ~= "voxelcraft:farm_wet" then
        voxelcraft_core.compatibility.block_operations.destroy_block(
            x, y, z
        )
        return
    end
    block.set(x, y, z, block.index("voxelcraft:wheat4"), 0)
end

