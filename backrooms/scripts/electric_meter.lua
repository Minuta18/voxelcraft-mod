function on_interact(x, y, z)
    set_block(x, y, z, block_index('backrooms:electric_meter_open'), get_block_states(x, y, z))
end