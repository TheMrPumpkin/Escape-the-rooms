local STI = require("assets/libraries/sti")
require("player")
require "rectangle"



function love.load()
    
    tick = require "assets.libraries.tick"
    Object = require "assets.libraries.classic"
    anim8 = require "assets.libraries.anim8"
    map = STI("assets/maps/Map1.lua", { "box2d" })
    


    player:load()
end 

function love.update(dt)
    player:update(dt)
end

function love.draw()
    map:draw()
    player:draw()
end
