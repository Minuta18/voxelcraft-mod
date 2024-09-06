function on_interact(x, y, z)
    set_block(x, y, z, block_index('backrooms:box_for_fire_extinguisher'), get_block_states(x, y, z))
end