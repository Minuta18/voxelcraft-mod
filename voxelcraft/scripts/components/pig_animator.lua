local vec3 = require("core:vector3")

local tsf = entity.transform
local body = entity.rigidbody
local rig = entity.skeleton

local meters_traveled = 0

local function animate(delta)
    -- Thanks @murka124 for this code
    local body_vec = vec3(body:get_vel()[1], body:get_vel()[2], body:get_vel()[3])*vec3(1,0,1)
    local body_velocity = body_vec:len()
    
    if body_velocity > 0.1 then
        meters_traveled = meters_traveled + body_velocity * delta      
        
        local walk_animation = math.cos(
            meters_traveled * math.sqrt(body_velocity) * 2
        ) * 20
        local rot1 = mat4.rotate(mat4.idt(), {0, 0, 1}, walk_animation)
        local rot2 = mat4.rotate(mat4.idt(), {0, 0, 1}, -walk_animation)

        rig:set_matrix(rig:index("leg1"), rot1)
        rig:set_matrix(rig:index("leg2"), rot2)
        rig:set_matrix(rig:index("leg3"), rot1)
        rig:set_matrix(rig:index("leg4"), rot2)
    else
        meters_traveled = 0

        rig:set_matrix(rig:index("leg1"), mat4.idt())
        rig:set_matrix(rig:index("leg2"), mat4.idt())
        rig:set_matrix(rig:index("leg3"), mat4.idt())
        rig:set_matrix(rig:index("leg4"), mat4.idt())
    end
end

function on_render(delta) 
    animate(delta)
end
