local STI = require("assets/libraries/sti")
require("player")
require("rectangle")



function love.load()
    tick = require "assets.libraries.tick"
    Object = require "assets.libraries.classic"
    anim8 = require "assets.libraries.anim8"
    map = STI("assets/maps/Map1.lua", { "box2d" })
    camera = require "assets.libraries.camera"



    player:load()
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    cam:attach()
    map:drawLayer(map.layers["Ground"])
    map:drawLayer(map.layers["Trees"])
    player:draw()
    cam:detach()
end
