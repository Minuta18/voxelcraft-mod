function on_open(invid)
    print("OPEN HP BAR GUI", invid)
end

function on_resize()
    local window_size = gui.get_viewport()
    return window_size[1] / 2 - 534 / 2, window_size[2] - 100
end


