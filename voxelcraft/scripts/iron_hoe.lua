function on_use_on_block(x, y, z, playerid, normal)
    logger.debug(block.name(block.get(x, y, z)))
    if block.name(block.get(x, y, z)) == "base:grass_block" or
        block.name(block.get(x, y, z)) == "base:dirt" 
    then
        block.set(x, y, z, block.index("voxelcraft:farm"), 0)
    end
end