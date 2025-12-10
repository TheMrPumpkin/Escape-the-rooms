local STI = require("assets/libraries/sti")
require("player")
require("rectangle")
-- flatpak run org.love2d.love2d .
-- RUN THE GAME


function love.load()
    wf = require("assets.libraries.windfield")
    tick = require "assets.libraries.tick"
    Object = require "assets.libraries.classic"
    anim8 = require "assets.libraries.anim8"
    map = STI("assets/maps/Map1.lua", { "box2d" })
    camera = require "assets.libraries.camera"

    world = wf.newWorld()

    player:load()

    walls = {}

    if map.layers["walls"] then
        for i , obj in pairs(map.layers["walls"].Object) do 
             local wall = world:newRectangleCollider(obj.x , obj.y , obj.width  ,obj.height )
            wall:setType('static')
            table.insert(walls , wall)
        end
    end 


    
end

function love.update(dt)
    world:update(dt)
    player:update(dt)
end

function love.draw()
    cam:attach()
    map:drawLayer(map.layers["Ground"])
    map:drawLayer(map.layers["Trees"])
    player:draw()
    world:draw()
    cam:detach()
end
