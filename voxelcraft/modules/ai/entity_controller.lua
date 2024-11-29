require "voxelcraft:utils/utils"
require "voxelcraft:config/config"
require "voxelcraft:logger/logger"

local pathfinder = require "starpath:pathfinder"

EntityController = create_class()

function EntityController:init(
    entity_id, 
    speed, 
    cost_table, 
    pathfinding_radius
)
    self.entity_id = entity_id
    self.speed = speed
    self.cost_table = cost_table
    self.options = {
        algorithm = pathfinder.AStar,
        radius = pathfinding_radius,
        maxAscent = 2,
        maxDescent = 1,
    }
    
    self.goto_goal = {0, 0, 0}
    self.goto_enable = false
end

function EntityController:goto_cords(cords)
    self.goto_goal = cords
    self.goto_enable = true
end

function EntityController:stop_going()
    self.goto_enable = false
end

function EntityController:set_speed(speed)
    self.speed = speed
end

function EntityController:get_speed()
    return self.speed
end

function EntityController:update()
    if self.goto_enable then
        local ent = entities.get(self.entity_id)
        local cords = ent.transform:get_pos()
        local path = pathfinder.find_path(
            cords[1], cords[2], cords[3],
            self.goto_goal[1], self.goto_goal[2], self.goto_goal[3],
            self.options
        )

        if not path then
            self.goto_enable = false
            return
        end

        local rotation = mat4.idt()
        mat4.look_at({-cords[1], 0, cords[3]},
            {-self.goto_goal[1], 0, self.goto_goal[3]}, 
            {0,1,0}, rotation
        )
        ent.transform:set_rot(rotation)

        local moving_vec = {
            path[2].x - path[1].x,
            path[2].y - path[1].y,
            path[2].z - path[1].z,
        }
        moving_vec = vec3.mul(moving_vec, self.speed)
        moving_vec = vec3.normalize(moving_vec)
        print(dump(ent.rigidbody:get_vel()))
        ent.rigidbody:set_vel(moving_vec)
    end
end


