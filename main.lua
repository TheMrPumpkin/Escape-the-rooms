local STI = require("assets/libraries/sti")
require("player")
require("rectangle")



function love.load()
    wf = require("assets.libraries.windfield")
    tick = require "assets.libraries.tick"
    Object = require "assets.libraries.classic"
    anim8 = require "assets.libraries.anim8"
    map = STI("assets/maps/Map1.lua", { "box2d" })
    camera = require "assets.libraries.camera"

    world = wf.newWorld()

    player:load()
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
